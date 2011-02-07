//
//  Numbers.h
//  Sokokus
//
//  Created by 卞 中杰 on 11-1-28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Numbers : CCLayer {
	NSMutableArray *grayNumbers;
	NSMutableArray *greenNumbers;
	NSMutableArray *redNumbers;
	NSArray *temp1;
	NSMutableArray *controlNumbers;
	NSArray *smallNumbers;
}
@property (nonatomic, retain) NSMutableArray *grayNumbers;
@property (nonatomic, retain) NSMutableArray *greenNumbers;
@property (nonatomic, retain) NSMutableArray *redNumbers;
@property (nonatomic, retain) NSMutableArray *controlNumbers;
@property (nonatomic, retain) NSArray *temp1;
@property (nonatomic, retain) NSArray *smallNumbers;

- (NSMutableArray *) createNumbers;
- (NSArray *) createSmallNumbers;
@end
