//
//  Game.h
//  Sokokus
//
//  Created by 卞 中杰 on 11-1-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Numbers.h"

typedef struct{
	CGPoint here;
	int i, j;
}HereGridPosition;

@interface Game : CCLayer {

}

BOOL checkThemAll(int user[9][9], int right[9][9]);
int isInLeft(CGPoint point);
int isInRight(CGPoint point);
void createNewSodoku();
void createCorrectMatrix(int difficulty);
HereGridPosition theRealGridPosition(CGPoint now);
void createPositionsInAGrid(CGPoint pos, CGPoint work[3][3]);
@end
