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

@implementation Game
@synthesize numberArray;
@synthesize allData;

int correct[9][9]; //空格处正确的数字，其余为0
int level = 4;	//难度

CGPoint everyPoint[9][9];

CCSprite *work;


- (id) init {
	if ((self = [super init])) {
		Numbers *firstGen = [Numbers node];
		self.isTouchEnabled = YES;
		int i = 0, j = 0, k = 0, m = 0, temp = 0;
		int x = 0, y = 0;
		int flag = 0;
		int rand9[9];
	
	

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
	

	
//生成数独阵
	
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
//打印	
		for (i = 0; i < 9; i++) 
			for (j = 0; j < 9; j++){
				printf("%d ", seedList[i][j]);
				if (j == 8) 
					printf("\n");
			}
//按难度挖孔	
		int a = 0, b = 0;
	
		for (i = 0; i < 9; i++) 
			for (j = 0; j < 9; j++)
				correct[i][j] = 0;
	
//每行不超过level个孔	
		for (i = 0; i < 9 ; i++) {
			for (k = 0; k < level; k++) {
				a = i;
				b = arc4random()%9;
				correct[a][b] = seedList[a][b];
			
			}
		}
	
//加载背景图案	
		CCSprite *gameBack = [CCSprite spriteWithFile:@"gameBack.png"];
		//gameBack.anchorPoint = CGPointZero;
		gameBack.position = ccp(160, 240);
		[self addChild:gameBack z:-100];
//加载网格		
		CCSprite *gameGrid = [CCSprite spriteWithFile:@"gridStyle2.png"];
		gameGrid.positionInPixels = ccp(320, 520);
		[self addChild:gameGrid z:-50];		
		

		
		x = 40;
		y = 800;
		
		CCSprite *one;
		

//正式加载游戏		
		for (i = 0; i < 9; i++) {
			for (j = 0; j < 9; j++) {
				everyPoint[i][j] = ccp(x/2, y/2);//获取坐标
				if (correct[i][j]) {x += 70; continue;}
				one = [[firstGen.grayNumbers objectAtIndex:i] objectAtIndex:(seedList[i][j] - 1)];
				one.positionInPixels = ccp(x, y);
				[self addChild:one z:k+1];
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
			[self addChild:one z:3 tag:i+1];
			x += 70;
		}
//底部的按钮		
		CCSprite *renewButton = [CCSprite spriteWithFile:@"new.png"];
		renewButton.positionInPixels = ccp(160, 102);
		[self addChild:renewButton z:3 tag:13];
		CCSprite *loseButton = [CCSprite spriteWithFile:@"lose.png"];
		loseButton.positionInPixels = ccp(480, 102);
		[self addChild:loseButton z:3 tag:14];
		
		
	}
	return self;
}
/*
 int checkOne(int one[][])
 {
 int i, j, m, n, flag;
 for (m = i, n = 0; n < 9 ; n++) 
 {
 if (n == j) continue;
 else if (temp == origin[m][n])
 {
 flag = 1;
 break;
 }
 }
 
 if (!flag) 
 {
 for (n = j, m = 0; m < 9; m++) 
 {
 if (m == i) continue;
 else if (temp == origin[m][n])
 {
 flag = 1;
 break;
 }
 }
 }
 
 if (!flag) 
 {
 
 }
 }
 */
#pragma mark -
#pragma mark Touches
- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

	int theSelectedNumber;	//选中的数字
	NSMutableArray *array;
	UITouch *touch = [touches anyObject];
	
	CGPoint startPositon = [touch locationInView:[touch view]];
	CGPoint convertedStartPosition = [[CCDirector sharedDirector] convertToGL:startPositon];
	
	if (convertedStartPosition.y > 431 && convertedStartPosition.y < 466) {
		Numbers *firstGen = [Numbers node];
		array = [firstGen createNumbers];
		theSelectedNumber = convertedStartPosition.x / 35 + 1;
		CCSprite *one = [[array objectAtIndex:1] objectAtIndex:theSelectedNumber - 1];
		one.position = convertedStartPosition;
		[self addChild:one];
		[one stopAllActions];
		[one runAction:[CCScaleBy actionWithDuration:0 scale:2.0]];
		work = one;
		
	}
	else {
		return;
	}

		
}


- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	CGPoint currentPosition = [touch locationInView:[touch view]];
	CGPoint convertedPosition = [[CCDirector sharedDirector] convertToGL:currentPosition];
	//[selectedNumber stopAllActions];
	//[selectedNumber runAction:[CCScaleBy actionWithDuration:0.1 scale:2.0]];
	[work runAction:[CCMoveTo actionWithDuration:0 position:convertedPosition]];
	
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	int i, j;
	CGPoint inHere = CGPointMake(320, 480);
	int positionAbs = 800;
	UITouch *touch = [touches anyObject];
	
	CGPoint endLocation = [touch locationInView: [touch view]];
	CGPoint finalLocation = [[CCDirector sharedDirector] convertToGL: endLocation];
	
	for (i = 0; i < 9; i++) {
		for (j = 0; j < 9; j++) {
			if ((abs(everyPoint[i][j].x - finalLocation.x) + abs(everyPoint[i][j].y - finalLocation.y)) < positionAbs) {
				positionAbs = abs(everyPoint[i][j].x - finalLocation.x) + abs(everyPoint[i][j].y - finalLocation.y);
				inHere = everyPoint[i][j];
			}
		}
	}
	[work runAction:[CCScaleBy actionWithDuration:0 scale:0.5]];
	[work runAction:[CCMoveTo actionWithDuration:0 position:inHere]];
	work = nil;
	
}


- (void) dealloc
{
	[super dealloc];
}
@end
