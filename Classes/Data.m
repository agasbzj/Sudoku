//
//  Data.m
//  Sokokus
//
//  Created by 卞 中杰 on 11-1-31.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Data.h"


@implementation Data

- (int *) correct
{
	return correct;
}


- (int) correctAtI:(int)i andJ:(int)j
{
	return correct[i][j];
}

/*
 - (void) setCorrect:(int*)anArray
 {
	if (anArray) {
		for (int i = 0; i < 9; i++) {
			for (int j = 0; j < 9; j++) {
				correct[i][j] = anArray[i][j];
			}
		}
	}
 }
*/

- (void) setACorrect:(int)value at:(int)i and:(int)j
{
	correct[i][j] = value;
}




- (int *) originalGenerated
{
	return originalGenerated;
}


- (int) originalGeneratedAtI:(int)i andJ:(int)j
{
	return originalGenerated[i][j];
}

- (void) setAOriginalGenerated:(int)value at:(int)i and:(int)j
{
	originalGenerated[i][j] = value;
}



- (int *) doing
{
	return doing;
}


- (int) doingAtI:(int)i andJ:(int)j
{
	return doing[i][j];
}

- (void) setADoing:(int)value at:(int)i and:(int)j
{
	doing[i][j] = value;
}

- (id) init
{
	if ((self = [super init])){
		int i, j;
		for (i = 0; i < 9; i ++) {
			for (j = 0; j < 9; j++) {
				[self setADoing:0 at:i and:j];
				[self setAOriginalGenerated:0 at:i and:j];
				[self setACorrect:0 at:i and:j];
			}
		}
	}
	return self;
}


@end
