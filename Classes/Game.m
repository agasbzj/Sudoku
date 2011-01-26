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
int origin[9][9];
- (id) init {
	
	int i = 0, j = 0, m = 0, temp = 0;
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
	
//	for (i = 0; i < 9; i++)
//		printf("%d ", rand9[i]);
	
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
	
	if ((self = [super init])) {
		CCSprite *gameBack = [CCSprite spriteWithFile:@"gameBack.png"];
		//gameBack.anchorPoint = CGPointZero;
		gameBack.position = ccp(160, 240);
		[self addChild:gameBack z:0 tag:1];
		CCSprite *gameGrid = [CCSprite spriteWithFile:@"gridBlue.png"];
		gameGrid.positionInPixels = ccp(320, 520);
		[self addChild:gameGrid z:1 tag:2];
		
//把每个数字做成sprite放到一个array中		
		CCSprite *num1 = [CCSprite spriteWithFile:@"num1a.png"];
		CCSprite *num2 = [CCSprite spriteWithFile:@"num2a.png"];
		CCSprite *num3 = [CCSprite spriteWithFile:@"num3a.png"];
		CCSprite *num4 = [CCSprite spriteWithFile:@"num4a.png"];
		CCSprite *num5 = [CCSprite spriteWithFile:@"num5a.png"];
		CCSprite *num6 = [CCSprite spriteWithFile:@"num6a.png"];
		CCSprite *num7 = [CCSprite spriteWithFile:@"num7a.png"];
		CCSprite *num8 = [CCSprite spriteWithFile:@"num8a.png"];
		CCSprite *num9 = [CCSprite spriteWithFile:@"num9a.png"];
		numberArray = [NSArray arrayWithObjects:num1, num2, num3, num4, num5, num6, num7, num8, num9, nil];
//Pixels		
		x = 40;
		y = 800;
		
		CCSprite *one = [numberArray objectAtIndex:seedList[0][0]];
		
//根据数独阵取array中的sprit，并放到当前layer上。
//这里最多只能到如此，内存不够？？？
//		for (i = 0; i < 1; i++) {
//			for (j = 0; j < 5; j++) {
//
		for (i = 0; i < 9; i++) {
			for (j = 0; j < 9; j++) {
				one = [numberArray objectAtIndex:(seedList[i][j] - 1)];
				one.positionInPixels = ccp(x, y);
				[self addChild:one z:3];
				x += 70;
			}
			x = 40;
			y -= 70;
		}
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
- (void) dealloc
{
	[super dealloc];
}
@end
