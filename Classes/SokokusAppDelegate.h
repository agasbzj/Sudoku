//
//  SokokusAppDelegate.h
//  Sokokus
//
//  Created by 卞 中杰 on 11-1-24.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameData.h"

@class RootViewController;

@interface SokokusAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
