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
#import "GameData.h"
#import "Game.h"
#import "AnimationNumber.h"
// MainMenu implementation
@implementation MainMenu

extern GameData gSaveGame;


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

- (void) loadGame:(id)sender{
	if (gSaveGame.gameActive == YES) {
		//CCScene *loadGameScene = [CCScene node];
		//[loadGameScene addChild:[Game node]];
		//CCTransitionPageTurn *turn = [CCTransitionPageTurn transitionWithDuration:1 scene:[Game scene]];
//		[[CCDirector sharedDirector] replaceScene:turn];
		
		LodingScene *load = [LodingScene sceneWithTargetScene:TargetSceneGameScene];
		[[CCDirector sharedDirector] replaceScene:load];
	}
}
- (void) newGame:(id)sender{
	//gSaveGame.gameActive = NO;
	//CCScene *newGameScene = [CCScene node];
	//[newGameScene addChild:[GameLayer node]];
	
	//切换效果
	CCTransitionFade *fade = [CCTransitionFade transitionWithDuration:0.5 scene:[GameLayer scene] withColor:ccWHITE];
	
	[[CCDirector sharedDirector] replaceScene:fade];
}

- (void) gameSettings:(id)sender{
	NSLog(@"Settings");
}

- (void) quitGame:(id) sender{
	NSLog(@"Quit!");
}



// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	
	if( (self=[super init] )) {
		
        //音乐加载
		//[[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"blues.mp3" loop:YES];
        
        //主菜单背景图加载
//		CCSprite *menuBackground = [CCSprite spriteWithFile:@"menuView.png"];
//		menuBackground.anchorPoint = CGPointZero;
//		[self addChild:menuBackground z:0 tag:1];
		
		[CCMenuItemFont setFontName:@"Heiti TC"];
		[CCMenuItemFont setFontSize:25];
		
		
		CCMenuItem *newGame = [CCMenuItemFont itemFromString:@"新游戏" target:self selector:@selector(newGame:)];
		CCMenuItem *loadGame = [CCMenuItemFont itemFromString:@"读取游戏" target:self selector:@selector(loadGame:)];
		CCMenuItem *gameSettings = [CCMenuItemFont itemFromString:@"游戏设置" target:self selector:@selector(gameSettings:)];
		CCMenuItem *quitGame = [CCMenuItemFont itemFromString:@"退出游戏" target:self selector:@selector(quitGame:)];
		
		CCMenu *mainMenu = [CCMenu menuWithItems:newGame, loadGame, gameSettings, quitGame, nil];
		[mainMenu alignItemsVertically];
		CGSize screenSize = [[CCDirector sharedDirector] winSize];
		mainMenu.position = ccp(screenSize.width * 0.5, screenSize.height * 0.2);
		[self addChild:mainMenu z:1 tag:2];
		
		AnimationNumber *num = [AnimationNumber Gen];
		num.position = ccp(screenSize.width*0.5, screenSize.height*0.5);
		[self addChild:num z:1];
		
	}
	return self;
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
	[super dealloc];
}


@end


