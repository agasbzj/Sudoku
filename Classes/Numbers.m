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
@synthesize temp1;
@synthesize controlNumbers;
@synthesize smallNumbers;
- (NSMutableArray *) createNumbers
{
	NSArray *temp;
	NSMutableArray *numbers = [NSMutableArray arrayWithCapacity:3];
		
	
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
	[numbers addObject:temp];
	
	
	CCSprite *num11 = [CCSprite spriteWithFile:@"num1b.png"];
	CCSprite *num22 = [CCSprite spriteWithFile:@"num2b.png"];
	CCSprite *num33 = [CCSprite spriteWithFile:@"num3b.png"];
	CCSprite *num44 = [CCSprite spriteWithFile:@"num4b.png"];
	CCSprite *num55 = [CCSprite spriteWithFile:@"num5b.png"];
	CCSprite *num66 = [CCSprite spriteWithFile:@"num6b.png"];
	CCSprite *num77 = [CCSprite spriteWithFile:@"num7b.png"];
	CCSprite *num88 = [CCSprite spriteWithFile:@"num8b.png"];
	CCSprite *num99 = [CCSprite spriteWithFile:@"num9b.png"];
	
	temp = [NSArray arrayWithObjects:num11, num22, num33, num44, num55, num66, num77, num88, num99, nil];
	[numbers addObject:temp];
	
	CCSprite *num111 = [CCSprite spriteWithFile:@"num1c.png"];
	CCSprite *num222 = [CCSprite spriteWithFile:@"num2c.png"];
	CCSprite *num333 = [CCSprite spriteWithFile:@"num3c.png"];
	CCSprite *num444 = [CCSprite spriteWithFile:@"num4c.png"];
	CCSprite *num555 = [CCSprite spriteWithFile:@"num5c.png"];
	CCSprite *num666 = [CCSprite spriteWithFile:@"num6c.png"];
	CCSprite *num777 = [CCSprite spriteWithFile:@"num7c.png"];
	CCSprite *num888 = [CCSprite spriteWithFile:@"num8c.png"];
	CCSprite *num999 = [CCSprite spriteWithFile:@"num9c.png"];
	
	temp = [NSArray arrayWithObjects:num111, num222, num333, num444, num555, num666, num777, num888, num999, nil];
	[numbers addObject:temp];
	
	controlNumbers = numbers;
	return controlNumbers;
}

- (NSArray *)createSmallNumbers
{
	CCSprite *num1 = [CCSprite spriteWithFile:@"num1s.png"];
	CCSprite *num2 = [CCSprite spriteWithFile:@"num2s.png"];
	CCSprite *num3 = [CCSprite spriteWithFile:@"num3s.png"];
	CCSprite *num4 = [CCSprite spriteWithFile:@"num4s.png"];
	CCSprite *num5 = [CCSprite spriteWithFile:@"num5s.png"];
	CCSprite *num6 = [CCSprite spriteWithFile:@"num6s.png"];
	CCSprite *num7 = [CCSprite spriteWithFile:@"num7s.png"];
	CCSprite *num8 = [CCSprite spriteWithFile:@"num8s.png"];
	CCSprite *num9 = [CCSprite spriteWithFile:@"num9s.png"];
	CCSprite *num0 = [CCSprite spriteWithFile:@"num0s.png"];
	
	smallNumbers = [NSArray arrayWithObjects:num0, num1, num2, num3, num4, num5, num6, num7, num8, num9, nil];
	
	return smallNumbers;
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
			
				temp1 = [NSArray arrayWithObjects:num1, num2, num3, num4, num5, num6, num7, num8, num9, nil];
				[grayNumbers addObject:temp1];
			
	
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
			
				temp1 = [NSArray arrayWithObjects:num1, num2, num3, num4, num5, num6, num7, num8, num9, nil];
				[greenNumbers addObject:temp1];
			
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
			
				temp1 = [NSArray arrayWithObjects:num1, num2, num3, num4, num5, num6, num7, num8, num9, nil];
				[redNumbers addObject:temp1];
			
		}
		
		
	}
	
	return self;
}

@end
