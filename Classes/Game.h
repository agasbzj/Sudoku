//
//  Game.h
//  Sokokus
//
//  Created by 卞 中杰 on 11-1-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Game : CCLayer {
	NSArray *numberArray;
	NSMutableArray *allData;

	
}

@property (nonatomic, retain) NSArray *numberArray;
@property (nonatomic, retain) NSMutableArray *allData;

@end
