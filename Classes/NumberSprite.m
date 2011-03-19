//
//  NumberSprite.m
//  Sokokus
//
//  Created by 卞 中杰 on 11-2-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NumberSprite.h"
#import "CCTouchDispatcher.h"

@implementation NumberSprite

+(id) aNumberWithParentNode:(CCNode *)parentNode
{
	return [[[self alloc] initWithParentNode:parentNode] autorelease];
}

-(id) initWithParentNode:(CCNode *)parentNode
{
	if ((self = [super init])) {
		CGSize screenSize = [[CCDirector sharedDirector] winSize];
		
		_numberSprite = [CCSprite spriteWithFile:@"num8c.png"];
		_numberSprite.position = CGPointMake(CCRANDOM_0_1() * screenSize.width,
											CCRANDOM_0_1() * screenSize.height);
		[parentNode addChild:_numberSprite z:10];
		
		[[CCScheduler sharedScheduler] scheduleUpdateForTarget:self priority:0 paused:NO];
		
		[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:-1 swallowsTouches:YES];
		
	}
	return self;
}



-(void) update:(ccTime)delta
{
	_numUpdates++;
	if (_numUpdates > 50) {
		_numUpdates = 0;
		[_numberSprite stopAllActions];
		
		CGPoint moveTo = CGPointMake(CCRANDOM_0_1() * 100 - 50, 
									 CCRANDOM_0_1() * 200 - 100);
		
		CCMoveBy *move = [CCMoveBy actionWithDuration:1 position:moveTo];
		[_numberSprite runAction:move];
	}
}

-(void) dealloc
{
	[[CCScheduler sharedScheduler] unscheduleUpdateForTarget:self];
	[[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
	
	[super dealloc];
}
-(void) moveAway:(float)duration position:(CGPoint)moveTo
{
	[_numberSprite stopAllActions];
	CCMoveBy *move = [CCMoveBy actionWithDuration:duration position:moveTo];
	[_numberSprite runAction:move];
}
-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	
	
}
@end
