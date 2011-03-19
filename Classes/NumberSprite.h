//
//  NumberSprite.h
//  Sokokus
//
//  Created by 卞 中杰 on 11-2-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Numbers.h"

@interface NumberSprite : NSObject <CCTargetedTouchDelegate>{
	CCSprite *_numberSprite;
	int _numUpdates;
}

+(id) aNumberWithParentNode:(CCNode *)parentNode;
-(id) initWithParentNode:(CCNode *)parentNode;

@end
