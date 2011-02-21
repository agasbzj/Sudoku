//
//  LodingScene.h
//  Sokokus
//
//  Created by 卞 中杰 on 11-2-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef enum{
	TargetSceneINVALID = 0,
	TargetSceneGameScene,
	TargetSceneMax,
} TargetScenes;

@interface LodingScene : CCScene {
	TargetScenes target;
}

+(id) sceneWithTargetScene:(TargetScenes)targetScene;
-(id) initWithTargetScene:(TargetScenes)targetScene;
@end
