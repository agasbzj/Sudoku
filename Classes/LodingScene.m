//
//  LodingScene.m
//  Sokokus
//
//  Created by 卞 中杰 on 11-2-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LodingScene.h"
#import "Game.h"

@interface LodingScene (PrivateMethods)

-(void) update:(ccTime)delta;

@end


@implementation LodingScene

+(id) sceneWithTargetScene:(TargetScenes)targetScene
{
	CCLOG(@"===========================================");
	CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
	
	return [[[self alloc] initWithTargetScene:targetScene] autorelease];
}

-(id) initWithTargetScene:(TargetScenes)targetScene
{
	if ((self = [super init])) 
	{
		target = targetScene;
		
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Loading ..." fontName:@"Marker Felt" fontSize:64];
		
		CGSize size = [[CCDirector sharedDirector] winSize];
		label.position = CGPointMake(size.width / 2, size.height / 2);
		[self addChild:label];
		
		// Must wait one frame before loading the target scene!
		// Two reasons: first, it would crash if not. Second, the Loading label wouldn't be displayed.
	
		[self scheduleUpdate];
	}
	return self;
}

-(void) update:(ccTime)delta
{
	[self unscheduleAllSelectors];
	
	switch (target) {
		case TargetSceneGameScene:
		{
			CCTransitionFade *trans = [CCTransitionFade transitionWithDuration:3 scene:[Game scene] withColor:ccWHITE];
			[[CCDirector sharedDirector] replaceScene:trans];
			break;
		}
		default:
			// Always warn if an unspecified enum value was used. It's a reminder for yourself to update the switch
			// whenever you add more enum values.
			NSAssert2(nil, @"%@: unsupported TargetScene %i", NSStringFromSelector(_cmd), target);
			break;
	}
	
	for (TargetScenes i = TargetSceneINVALID + 1; i < TargetSceneMax; i++) {
		
	}
}

-(void) dealloc
{
	[super dealloc];
}
@end
