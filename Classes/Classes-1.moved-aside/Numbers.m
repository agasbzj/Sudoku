//
//  Numbers.m
//  Sokokus
//
//  Created by 卞 中杰 on 11-1-27.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Numbers.h"


@implementation Numbers
@synthesize grayNumbers;
@synthesize greenNumbers;
@synthesize redNumbers;
@synthesize temp;

-(void) registerWithTouchDispatcher
{
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}



-(id) init
{
	int i;
	grayNumbers = [NSMutableArray arrayWithCapacity:9];
	greenNumbers = [NSMutableArray arrayWithCapacity:9];
	redNumbers = [NSMutableArray arrayWithCapacity:9];
	if ((self = [super init])) {
//加载灰色数字		
		for (i = 0; i < 9; i++) {
			CCSprite *num1 = [CCSprite spriteWithFile:@"num1a.png"];
			CCSprite *num2 = [CCSprite spriteWithFile:@"num2a.png"];
			CCSprite *num3 = [CCSprite spriteWithFile:@"num3a.png"];
			CCSprite *num4 = [CCSprite spriteWithFile:@"num4a.png"];
			CCSprite *num5 = [CCSprite spriteWithFile:@"num5a.png"];
			CCSprite *num6 = [CCSprite spriteWithFile:@"num6a.png"];
			CCSprite *num7 = [CCSprite spriteWithFile:@"num7a.png"];
			CCSprite *num8 = [CCSprite spriteWithFile:@"num8a.png"];
			CCSprite *num9 = [CCSprite spriteWithFile:@"num9a.png"];
			
			temp = [NSArray arrayWithObjects:num1, num2, num3, num4, num5, num6, num7, num8, num9, nil];
			
			[grayNumbers addObject:temp];
		}
//加载绿色数字		
		for (i = 0; i < 9; i++) {
			CCSprite *num1 = [CCSprite spriteWithFile:@"num1b.png"];
			CCSprite *num2 = [CCSprite spriteWithFile:@"num2b.png"];
			CCSprite *num3 = [CCSprite spriteWithFile:@"num3b.png"];
			CCSprite *num4 = [CCSprite spriteWithFile:@"num4b.png"];
			CCSprite *num5 = [CCSprite spriteWithFile:@"num5b.png"];
			CCSprite *num6 = [CCSprite spriteWithFile:@"num6b.png"];
			CCSprite *num7 = [CCSprite spriteWithFile:@"num7b.png"];
			CCSprite *num8 = [CCSprite spriteWithFile:@"num8b.png"];
			CCSprite *num9 = [CCSprite spriteWithFile:@"num9b.png"];
			
			temp = [NSArray arrayWithObjects:num1, num2, num3, num4, num5, num6, num7, num8, num9, nil];
			
			[greenNumbers addObject:temp];
		}
//加载红色数字		
		for (i = 0; i < 9; i++) {
			CCSprite *num1 = [CCSprite spriteWithFile:@"num1c.png"];
			CCSprite *num2 = [CCSprite spriteWithFile:@"num2c.png"];
			CCSprite *num3 = [CCSprite spriteWithFile:@"num3c.png"];
			CCSprite *num4 = [CCSprite spriteWithFile:@"num4c.png"];
			CCSprite *num5 = [CCSprite spriteWithFile:@"num5c.png"];
			CCSprite *num6 = [CCSprite spriteWithFile:@"num6c.png"];
			CCSprite *num7 = [CCSprite spriteWithFile:@"num7c.png"];
			CCSprite *num8 = [CCSprite spriteWithFile:@"num8c.png"];
			CCSprite *num9 = [CCSprite spriteWithFile:@"num9c.png"];
			
			temp = [NSArray arrayWithObjects:num1, num2, num3, num4, num5, num6, num7, num8, num9, nil];
			
			[redNumbers addObject:temp];
		}
		
		
	}
	
	return self;
}

@end
