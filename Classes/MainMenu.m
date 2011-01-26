//
//  MainMenu.m
//  Sokokus
//
//  Created by 卞 中杰 on 11-1-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//





//游戏主菜单

// Import the interfaces
#import "MainMenu.h"
#import "GameLayer.h"

// MainMenu implementation
@implementation MainMenu

+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainMenu *layer = [MainMenu node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		CCSprite *menuBackground = [CCSprite spriteWithFile:@"menuView.png"];
		menuBackground.anchorPoint = CGPointZero;
		
		[self addChild:menuBackground z:0 tag:1];
		
		[CCMenuItemFont setFontName:@"Heiti TC"];
		[CCMenuItemFont setFontSize:25];
		
		CCMenuItem *newGame = [CCMenuItemFont itemFromString:@"新游戏" target:self selector:@selector(newGame:)];
		CCMenuItem *loadGame = [CCMenuItemFont itemFromString:@"读取游戏" target:self selector:nil];
		CCMenuItem *gameSettings = [CCMenuItemFont itemFromString:@"游戏设置" target:self selector:@selector(gameSettings:)];
		CCMenuItem *quitGame = [CCMenuItemFont itemFromString:@"退出游戏" target:self selector:@selector(quitGame:)];
		
		CCMenu *mainMenu = [CCMenu menuWithItems:newGame, loadGame, gameSettings, quitGame, nil];
		[mainMenu alignItemsVertically];
		mainMenu.position = ccp(160, 100);
		[self addChild:mainMenu z:1 tag:2];
		
	}
	return self;
}

- (void) newGame:(id)sender{
	CCScene *newGameScene = [CCScene node];
	[newGameScene addChild:[GameLayer node]];
	[[CCDirector sharedDirector] replaceScene:newGameScene];
}

- (void) gameSettings:(id)sender{
	NSLog(@"Settings");
}

- (void) quitGame:(id) sender{
	NSLog(@"Quit!");
}
// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end


