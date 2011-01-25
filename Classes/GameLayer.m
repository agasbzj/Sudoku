//
//  GameLayer.m
//  Sokokus
//
//  Created by 卞 中杰 on 11-1-24.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameLayer.h"
#import "MainMenu.h"

@implementation GameLayer

- (id) init{

	if ((self = [super init])) {
		CCSprite *gameBackground = [CCSprite spriteWithFile:@"gameBackground.png"];
		gameBackground.anchorPoint = CGPointZero;
		
		[self addChild:gameBackground z:0 tag:1];
		
		[CCMenuItemFont setFontName:@"Heiti TC"];
		
		[CCMenuItemFont setFontSize:30];
		CCMenuItem *title = [CCMenuItemFont itemFromString:@"请选择难度：" target:self selector:nil];
		
		[CCMenuItemFont setFontSize:25];
		CCMenuItem *level1 = [CCMenuItemFont itemFromString:@"等级一" target:self selector:@selector(startGameLevel1:)];
		CCMenuItem *backToMain = [CCMenuItemFont itemFromString:@"回主菜单" target:self selector:@selector(backToMainTitle:)];
		
		CCMenu *selectDifficultyMenu = [CCMenu menuWithItems:title, level1, backToMain, nil];
		[selectDifficultyMenu alignItemsVertically];
		
		[self addChild:selectDifficultyMenu z:1 tag:2];
		
	}
	return self;
}

- (void) startGameLevel1:(id)sender{
	NSLog(@"Level1");
}

- (void) backToMainTitle:(id)sender{
	CCScene *mainTitleScene = [CCScene node];
	[mainTitleScene addChild:[MainMenu node]];
	[[CCDirector sharedDirector] replaceScene:mainTitleScene];
}
- (void)dealloc{
	[super dealloc];
}
@end
