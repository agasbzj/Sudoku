//
//  NumberSprite.m
//  Sokokus
//
//  Created by 卞 中杰 on 11-2-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NumberSprite.h"


@implementation NumberSprite

+(id) aNumberWithParentNode:(CCNode *)parentNode
{
	return [[[self alloc] initWithParentNode:parentNode] autorelease];
}

-(id) initWithParentNode:(CCNode *)parentNode
{
	if ((self = [super init])) {
		CGSize screenSize = [[CCDirector sharedDirector] winSize];
		
		numberSprite = [CCSprite spriteWithFile:@"num8c.png"];
		numberSprite.position = CGPointMake(CCRANDOM_0_1 * screenSize.width,
											CCRANDOM_0_1 * screenSize.height);
		[parentNode addChild:numberSprite z:10];
		
		[[CCScheduler sharedScheduler] scheduleUpdateForTarget:self priority:0 paused:NO];
		
	}
}

-(void) update:(ccTime)delta
{
	numUpdates++;
	if (numUpdates > 50) {
		numUpdates = 0;
		[numberSprite stopAllActions];
		
		CGPoint moveTo = CGPointMake(CCRANDOM_0_1 * 100 - 50, 
									 CCRANDOM_0_1 * 200 - 100);
		
		CCMoveBy *move = [CCMoveBy actionWithDuration:1 position:moveTo];
		[numberSprite runAction:move];
	}
}

-(void) dealloc
{
	[[CCScheduler sharedScheduler] unscheduleUpdateForTarget:self];
	[super dealloc];
}
@end
