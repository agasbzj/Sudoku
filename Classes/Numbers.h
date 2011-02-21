//
//  Numbers.h
//  Sokokus
//
//  Created by 卞 中杰 on 11-1-28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Numbers : CCLayer {
	CCArray *grayNumbers;
	CCArray *greenNumbers;
	CCArray *redNumbers;
	NSArray *temp1;
	CCArray *controlNumbers;
	NSArray *smallNumbers;
}
@property (nonatomic, retain) CCArray *grayNumbers;
@property (nonatomic, retain) CCArray *greenNumbers;
@property (nonatomic, retain) CCArray *redNumbers;
@property (nonatomic, retain) CCArray *controlNumbers;
@property (nonatomic, retain) NSArray *temp1;
@property (nonatomic, retain) NSArray *smallNumbers;

- (CCArray *) createNumbers;
- (NSArray *) createSmallNumbers;
@end
