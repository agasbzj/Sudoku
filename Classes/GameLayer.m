//
//  GameLayer.m
//  Sokokus
//
//  Created by 卞 中杰 on 11-1-24.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameLayer.h"
#import "MainMenu.h"
#import "Game.h"
#import "GameData.h"
#define WINDOWWIDTH		640
#define WINDOWHEIGHT	960
@implementation GameLayer

extern GameData gSaveGame;

- (void) startGameLevel1:(id)sender{
	//NSLog(@"Level1");
	gSaveGame.difficulty = 1;	//游戏难度
	//CCScene *level1 = [CCScene node];
	//[level1 addChild:[Game node]];
	[[CCDirector sharedDirector] replaceScene:[Game scene]];
}

- (void) backToMainTitle:(id)sender{
	//CCScene *mainTitleScene = [CCScene node];
	//[mainTitleScene addChild:[MainMenu node]];
	[[CCDirector sharedDirector] replaceScene:[MainMenu scene]];
}

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameLayer *layer = [GameLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}


- (id) init{

	if ((self = [super init])) {
		CCSprite *gameBackground = [CCSprite spriteWithFile:@"gameBackground.png"];
		gameBackground.anchorPoint = CGPointZero;
		[self addChild:gameBackground z:0 tag:1];
		
		[CCMenuItemFont setFontName:@"Heiti TC"];
		
		[CCMenuItemFont setFontSize:40];
		CCMenuItem *title = [CCMenuItemFont itemFromString:@"请选择难度：" target:self selector:nil];
		[title setIsEnabled:NO];
		
		
				
		[CCMenuItemFont setFontSize:25];
		CCMenuItem *level1 = [CCMenuItemFont itemFromString:@"等级一" target:self selector:@selector(startGameLevel1:)];
		CCMenuItem *backToMain = [CCMenuItemFont itemFromString:@"回主菜单" target:self selector:@selector(backToMainTitle:)];
		
		CCMenu *selectDifficultyMenu = [CCMenu menuWithItems:title, level1, backToMain, nil];
		selectDifficultyMenu.anchorPoint = ccp(0,0);
		title.position = ccp(20, 100);
		level1.position = ccp(0, 0);
		backToMain.position = ccp(0, -100);
		//[selectDifficultyMenu alignItemsVertically];
		
		[self addChild:selectDifficultyMenu z:1 tag:2];
		
	}
	return self;
}

- (void)dealloc{
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
	[super dealloc];
}
@end
