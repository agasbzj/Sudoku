//
//  AnimationNumber.m
//  Sokokus
//
//  Created by 卞 中杰 on 11-2-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AnimationNumber.h"

@interface AnimationNumber(PrivateMethods)


-(id) initWithNumImage;

@end

@implementation AnimationNumber
+(id) Gen
{
	return [[[self alloc] initWithNumImage] autorelease];
}

-(id) initWithNumImage
{
	CCSpriteFrameCache *frameCache = [CCSpriteFrameCache sharedSpriteFrameCache];
	[frameCache addSpriteFramesWithFile:@"Num.plist"];
	if ((self = [super initWithSpriteFrameName:@"num1c.png"]) ) {
		NSMutableArray *frames = [NSMutableArray arrayWithCapacity:9];
		for (int i = 1; i < 10; i++) {
			NSString *file = [NSString stringWithFormat:@"num%ic.png", i];
			CCSpriteFrame *frame = [frameCache spriteFrameByName:file];
			[frames addObject:frame];
		}
		CCAnimation *anim = [CCAnimation animationWithFrames:frames delay:0.05f];
		CCAnimate *animate = [CCAnimate actionWithAnimation:anim];
		CCRepeatForever *repeat = [CCRepeatForever actionWithAction:animate];
		[self runAction:repeat];
		
	}
	return self;
}

-(void) dealloc
{
	[super dealloc];
}
@end
