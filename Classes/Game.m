//
//  Game.m
//  Sokokus
//
//  Created by 卞 中杰 on 11-1-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Game.h"
#import "MainMenu.h"
#import "GameLayer.h"
#import "GameData.h"
//#define GAME_LEVEL  12	//难度


@implementation Game



CCSprite *gridNumbers[9][9]; //空格处的sprite，保存了用户在相应位置填的数

int selectedNumberTemp;
int pointInLeft = 0, pointInRight = 0;	//是否点中左右两个按钮
int theSelectedNumber;	//选中的数字
int aGridFlag = 0;

CGPoint everyPoint[9][9];
CGPoint aGridTemp;
CGPoint lastGridTemp;

BOOL canSketch;
CCSprite *work, *aGrid;

extern GameData gSaveGame;



BOOL aGridisActive;

void clear()
{
	for (int i=0; i < 9; i ++) {
		for (int j = 0; j < 9; j ++) {
			gridNumbers[i][j] = nil;
		}
	}
	selectedNumberTemp = 0;
	theSelectedNumber = 0;
	aGridFlag = 0;
	aGridTemp = ccp(0,0);
	lastGridTemp = ccp(0,0);
	canSketch = NO;
	aGridisActive = NO;
	work = nil;
	aGrid = nil;
}


- (id) init {
	
	if ((self = [super init])) {
		canSketch = NO;
		aGridisActive = NO;
		lastGridTemp = ccp(0,0);
		
		Numbers *firstGen = [Numbers node];
		//Data *gSaveGame = [Game node];
		
		self.isTouchEnabled = YES;
		int i = 0, j = 0;
		int x = 0, y = 0;
		NSMutableArray *array;
		CGPoint tempPosition;
		
		for (i = 0; i < 9; i++) 
			for (j = 0; j < 9; j++){
				printf("%d ", gSaveGame.doing[i][j]);
				if (j == 8) 
					printf("\n");
			}
		
		if (gSaveGame.gameActive == NO) {
			createNewSodoku();
			createCorrectMatrix(gSaveGame.difficulty);
		}
		else {
			
			for (i = 0; i < 9; i++) {
				for (j = 0; j < 9; j++) {
					if (gSaveGame.doing[i][j]) {
						Numbers *firstGen = [Numbers node];
						array = [firstGen createNumbers];
						tempPosition = ccp(j*70 + 40, 800 - i*70);
						CCSprite *a = [[array objectAtIndex:1] objectAtIndex: gSaveGame.doing[i][j] - 1];
						a.positionInPixels = tempPosition;
						gridNumbers[i][j] = a;
						[self addChild:a z:0];
					}
				}
			}
			
			
		}

		
		gSaveGame.gameActive = YES;
//打印	
		/*
		for (i = 0; i < 9; i++) 
			for (j = 0; j < 9; j++){
				printf("%d ", gSaveGame.originalGenerated[i][j]);
				if (j == 8) 
					printf("\n");
			}
		printf("\n");
		*/
	
//加载背景图案	
		/*
		CCSprite *gameBack = [CCSprite spriteWithFile:@"gameBack.png"];
		//gameBack.anchorPoint = CGPointZero;
		gameBack.position = ccp(160, 240);
		[self addChild:gameBack z:-100];
		 */
//加载网格		
		CCSprite *gameGrid = [CCSprite spriteWithFile:@"gridStyle2.png"];
		gameGrid.positionInPixels = ccp(320, 520);
		[self addChild:gameGrid z:0];		
		

		
		x = 40;
		y = 800;	//初始左上角的格子的中心点的实际坐标
		
		CCSprite *one;
		

//正式加载游戏		
		for (i = 0; i < 9; i++) {
			for (j = 0; j < 9; j++) {
				everyPoint[i][j] = ccp(x/2, y/2);//获取每个点的实际坐标
				if (gSaveGame.correct[i][j] != 0) {x += 70; continue;}
				one = [[firstGen.grayNumbers objectAtIndex:i] objectAtIndex:(gSaveGame.originalGenerated[i][j] - 1)];
				one.positionInPixels = ccp(x, y);
				[self addChild:one z:0];
				x += 70;
			}
			x = 40;
			y -= 70;
		}
		
//顶部的操作用数字
		x = 40;
		for (i = 0; i < 9; i++) {
			one = [[firstGen.redNumbers objectAtIndex:0] objectAtIndex:i];
			one.positionInPixels = ccp(x, 898);
			[self addChild:one z:0 tag:i+1];
			x += 70;
		}
//底部的按钮		
		CCSprite *renewButton = [CCSprite spriteWithFile:@"new.png"];
		renewButton.positionInPixels = ccp(160, 102);
		[self addChild:renewButton z:0 tag:13];
		CCSprite *loseButton = [CCSprite spriteWithFile:@"lose.png"];
		loseButton.positionInPixels = ccp(480, 102);
		[self addChild:loseButton z:0 tag:14];
		
		
	}
	return self;
}

#pragma mark -
#pragma mark Create Sodokus

void createNewSodoku()
{
	int i, j, m, temp, flag;
	int rand9[9];
	temp = 0;
	flag = 0;
	//初始模板数独
	int seedList[9][9] = {
		{9,7,8,3,1,2,6,4,5},  
		{3,1,2,6,4,5,9,7,8},  
		{6,4,5,9,7,8,3,1,2},  
		{7,8,9,1,2,3,4,5,6},  
		{1,2,3,4,5,6,7,8,9},  
		{4,5,6,7,8,9,1,2,3},  
		{8,9,7,2,3,1,5,6,4},  
		{2,3,1,5,6,4,8,9,7},  
		{5,6,4,8,9,7,2,3,1}  
	};
	
	//生成1维随机数列
	for (i = 0; i < 9; ) {
		temp = arc4random()%9 + 1;
		for (j = 0; j < i; j++) 
			if (temp == rand9[j])
			{
				flag = 1;
				break;
			}
		if (flag) {
			flag = 0;
			continue;
		}
		rand9[i] = temp;
		i++;
	}
	
	
	
	//生成随机数独阵
	
	for (i = 0; i < 9; i++) {
		for (j = 0; j < 9; j++) {
			for (m = 0; m < 9; m++) {
				if (seedList[i][j] == rand9[m]) {
					seedList[i][j] = rand9[(m+1)%9];
					break;
				}
			}
		}
	}
	
	for (i = 0; i < 9; i++) {
		for (j = 0; j < 9; j++) {
			gSaveGame.originalGenerated[i][j] = seedList[i][j];
		}
	}
	
}

void createCorrectMatrix(int difficulty)
{
	//按难度挖孔	
	int i, j, k;
	int a = 0, b = 0;
	
	difficulty = gSaveGame.difficulty;
	//初始化	
	for (i = 0; i < 9; i++) 
		for (j = 0; j < 9; j++)
		{
			gSaveGame.correct[i][j] = 0;
			gSaveGame.doing[i][j] = 0;
		}
	
	for (i = 0; i < 9; i++) {
		for (j = 0; j < 9; j++) {
			gridNumbers[i][j] = nil;
		}
	}
	
	
	//每行不超过level个孔	
	for (i = 0; i < 9 ; i++) {
		for (k = 0; k < difficulty; k++) {
			a = i;
			b = arc4random()%9;
			gSaveGame.correct[a][b] = gSaveGame.originalGenerated[a][b];
			
		}
	}
	
}

#pragma mark -
#pragma mark Touches

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	int i, j;
	
	
	if ([touches count] == 2) {
		aGridisActive = NO;
		//[self removeChild:aGrid cleanup:YES];
		
		canSketch = NO;
		[aGrid runAction:[CCMoveTo actionWithDuration:0 position:ccp(-100, -100)]];
		return;
	}	
	
	//CGPoint inHere = CGPointMake(320, 480);
	HereGridPosition inHere;
	NSMutableArray *array;
	UITouch *touch = [touches anyObject];
	
	CGPoint startPositon = [touch locationInView:[touch view]];
	CGPoint convertedStartPosition = [[CCDirector sharedDirector] convertToGL:startPositon];
	
	//检测点击的是否是按钮		
	pointInLeft = isInLeft(convertedStartPosition);
	pointInRight= isInRight(convertedStartPosition);
	
	if (pointInLeft || pointInRight) {
		aGridisActive = NO;
		canSketch = NO;
	}
	
	
	if (aGridisActive == YES) {
		//点了操作用数字？
		if (convertedStartPosition.y > 431 && convertedStartPosition.y < 466) {
			Numbers *firstGen = [Numbers node];
			array = [firstGen createNumbers];
			theSelectedNumber = convertedStartPosition.x / 35 + 1;
			canSketch = YES;
			
		}
		
		else if(convertedStartPosition.x >= 2.5 && convertedStartPosition.x <= 317.5
				&& convertedStartPosition.y >= 102.5 && convertedStartPosition.y <= 417.5)
		{
			inHere = theRealGridPosition(convertedStartPosition);
			
			
			//aGridisActive = YES;
			j = (int)((inHere.here.x - 2.5)/35);
			i = (int)(9 - (inHere.here.y - 102.5)/35);
			//如果点选的是可以填写的格子
			if (gSaveGame.correct[i][j]){
				[aGrid runAction:[CCMoveTo actionWithDuration:0 position:inHere.here]];
				
			
				aGridTemp = inHere.here;
			}
			canSketch = NO;
			
		}
	}
	else {
		//点了操作用数字？
		if (convertedStartPosition.y > 431 && convertedStartPosition.y < 466) {
			Numbers *firstGen = [Numbers node];
			array = [firstGen createNumbers];
			theSelectedNumber = convertedStartPosition.x / 35 + 1;	//选中的数字
			selectedNumberTemp = theSelectedNumber;
			
			CCSprite *one = [[array objectAtIndex:1] objectAtIndex:theSelectedNumber - 1];
			one.position = convertedStartPosition;
			one.scale = 2.0;
			[self addChild:one z:20];
			[one stopAllActions];
			//[one runAction:[CCScaleBy actionWithDuration:0 scale:2.0]];
			work = one;
			canSketch = NO;
		}
		//点的是可填写的空格？
		else if (convertedStartPosition.x >= 2.5 && convertedStartPosition.x <= 317.5
				 && convertedStartPosition.y >= 102.5 && convertedStartPosition.y <= 417.5)
		{
			inHere = theRealGridPosition(convertedStartPosition);
			
			
			//aGridTempActive = YES;
			j = (int)((inHere.here.x - 2.5)/35);
			i = (int)(9 - (inHere.here.y - 102.5)/35);
			//如果点选的是可以填写的格子
			if (gSaveGame.correct[i][j]){
				if (!aGridFlag) {
					aGrid = [CCSprite spriteWithFile:@"aGrid.png"];
					//[aGrid retain];
					aGrid.position = inHere.here;
					[self addChild:aGrid z:30];
					aGridFlag = 1;
				}
				else {
					[aGrid runAction:[CCMoveTo actionWithDuration:0 position:inHere.here]];
				
				}
				aGridTemp = inHere.here;
				
				canSketch = NO;

			}
			aGridisActive = YES;
		}
	}
		
}


- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	CGPoint currentPosition = [touch locationInView:[touch view]];
	CGPoint convertedPosition = [[CCDirector sharedDirector] convertToGL:currentPosition];
	if (pointInLeft || pointInRight) {
		return;
	}
	else if (work) {
		[work runAction:[CCMoveTo actionWithDuration:0 position:convertedPosition]];
	}
	
	
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	int i, j, a, b;
	//CGPoint inHere = CGPointMake(320, 480);	//最终落子点（修正）
	HereGridPosition here;
	UITouch *touch = [touches anyObject];
	
	CGPoint endLocation = [touch locationInView: [touch view]];
	CGPoint finalLocation = [[CCDirector sharedDirector] convertToGL: endLocation];
	
	i = isInLeft(finalLocation);
	j = isInRight(finalLocation);
	
	here = theRealGridPosition(finalLocation);
	
//	if (!(aGridTemp.x == here.here.x && aGridTemp.y == here.here.y)) {

//		aGridisActive = NO;

//	}
	if (i || j) {
		aGridisActive = NO;
		canSketch = NO;
	}
	
	
	if (aGridisActive == NO){
	//点击了按钮，则执行相应任务	
		if ((pointInLeft && i) || (pointInRight && j)) {
			//gSaveGame.gameActive = NO;
			SavePrefs();
			CCScene *selectDiff = [CCScene node];
			if (i) 
				
				[selectDiff addChild:[GameLayer node]];
			
			else 
				
				[selectDiff addChild:[MainMenu node]];
				
			clear();
			[[CCDirector sharedDirector] replaceScene:selectDiff];
			return;
		}
		else {
			//查询最近的位置，使数字自动落在网格的中间
			
			here = theRealGridPosition(finalLocation);
			//如果不是空格，数字不落下
			a = here.i;
			b = here.j;
			if (gSaveGame.correct[a][b] == 0) {
				[self removeChild:work cleanup:YES];
				work = nil;
			}
			else {
				//如果这个空格之前填了数字，先清除
				if (gridNumbers[a][b]) {
					[self removeChild:gridNumbers[a][b] cleanup:YES];
				}
				
				gSaveGame.doing[a][b] = selectedNumberTemp;
				gridNumbers[a][b] = work;
				//[work runAction:[CCScaleBy actionWithDuration:0 scale:0.5]];
				work.scale = 1.0;
				[work runAction:[CCMoveTo actionWithDuration:0 position:here.here]];
				work = nil;
				
				
				
			}
			
			SavePrefs();
			
			for (i = 0; i < 9; i++) 
				for (j = 0; j < 9; j++){
					printf("%d ", gSaveGame.doing[i][j]);
					if (j == 8) 
						printf("\n");
				}
			//如果玩家填的数字全部正确，则执行
			if (checkThemAll(gSaveGame.doing, gSaveGame.correct)) {
				NSLog(@"win");
				gSaveGame.gameActive = NO;
				CCSprite *win = [CCSprite spriteWithFile:@"gaoding.png"];
				win.positionInPixels = ccp(320, 480);
				win.rotation = -30;
				//[win runAction:[CCRotateBy actionWithDuration:0 angle:30]];
				[self addChild:win z:100];
				
			}
			
		
		}
	}
	//aGridisActive == YES情况
	else {
		//如果按了按钮
		if ((pointInLeft && i) || (pointInRight && j)) {
			//gSaveGame.gameActive = NO;
			SavePrefs();
			CCScene *selectDiff = [CCScene node];
			if (i) 
				
				[selectDiff addChild:[GameLayer node]];
			
			else 
				
				[selectDiff addChild:[MainMenu node]];
			
			clear();
			[[CCDirector sharedDirector] replaceScene:selectDiff];
			
			
			
		}
		else {
			
				//填写草稿数字
				CGPoint smallPoints[3][3];
				
				//如果可以填写草稿数字，则填写小数字
				if (canSketch == YES) {
					
					createPositionsInAGrid(aGridTemp, smallPoints);
					Numbers *sNumbers = [Numbers node];
					NSArray *smallNum;
					smallNum = [sNumbers createSmallNumbers];
					CCSprite *aSmall = [smallNum objectAtIndex:theSelectedNumber];
					aSmall.position = smallPoints[theSelectedNumber/3][theSelectedNumber%3 - 1];
					//CGPoint sppp = aSmall.position;
					//CGPoint sttt = aGridTemp;
					[self addChild:aSmall z:10];
					//lastGridTemp = aGridTemp;
					
				}
				
			theSelectedNumber = 0;
			
			
		}

	}

}

#pragma mark -
#pragma mark Do Checking

//查看完成的数组是否正确
BOOL checkThemAll(int user[9][9], int right[9][9])
{
	int i = 0, j = 0;
	BOOL win = YES;
	for (i = 0;	i < 9; i++) {
		for (j = 0; j < 9; j++) {
			if (right[i][j] == 0) 
				continue;
			else 
				if (user[i][j] != right[i][j]) {
					win = NO;
					break;
				}
		}
	}
	return win;
}

int isInLeft(CGPoint point)
{
	int flag = 0;
	if (point.y > 19 && point.y < 83 && point.x > 30 && point.x < 129) {
		flag = 1;
	}
	return flag;
}

int isInRight(CGPoint point)
{
	int flag = 0;
	if (point.y > 19 && point.y < 83 && point.x > 190 && point.x < 289) {
		flag = 1;
	}
	return flag;
}

//获取点选位置的格子的中心的实际坐标
HereGridPosition theRealGridPosition(CGPoint now)
{
	int i, j, a, b;
	int positionAbs = 800;
	HereGridPosition pos;
	for (i = 0; i < 9; i++) {
		for (j = 0; j < 9; j++) {
			if ((abs(everyPoint[i][j].x - now.x) + abs(everyPoint[i][j].y - now.y)) < positionAbs) {
				positionAbs = abs(everyPoint[i][j].x - now.x) + abs(everyPoint[i][j].y - now.y);
				pos.here = everyPoint[i][j];
				a = i;
				b = j;
			}
		}
		
	}
	pos.i = a;
	pos.j = b;
	return pos;
}

void createPositionsInAGrid(CGPoint pos, CGPoint work[3][3])
{
	int i, j;
	//HereGridPosition temp;
	//temp = theRealGridPosition(pos);
	//temp.here = pos;
	CGPoint zero = ccp(pos.x-35/2, pos.y+35/2);
	for (i = 0; i < 3; i++) {
		for (j = 0; j < 3; j++) {
			work[i][j] = ccp(zero.x + j * 11.5 + 11.5/2, zero.y - i * 11.5 - 11.5/2);
		}
	}
	
	
}

- (void) dealloc
{
	
	[super dealloc];
}
@end
