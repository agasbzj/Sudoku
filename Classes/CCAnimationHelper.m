//
//  CCAnimationHelper.m
//  Sokokus
//
//  Created by 卞 中杰 on 11-2-27.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "CCAnimationHelper.h"


@implementation CCAnimation(Helper)

+(CCAnimation *) animationWithFile:(NSString *)name frameCount:(int)frameCount delay:(float)delay
{
    NSMutableArray *frames = [NSMutableArray arrayWithCapacity:frameCount];
    for (int i = 1; i < frameCount+1; i++) {
        NSString *file = [NSString stringWithFormat:@"%@%ib.png", name, i];
        CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addImage:file];
        
        CGSize texSize = texture.contentSize;
        CGRect texRect = CGRectMake(0, 0, texSize.width, texSize.height);
        CCSpriteFrame *frame = [CCSpriteFrame frameWithTexture:texture rect:texRect];
        
        [frames addObject:frame];
    }
    return [CCAnimation animationWithFrames:frames delay:delay];
}

+(CCAnimation *) animationWithFrame:(NSString *)frame frameCount:(int)frameCount delay:(float)delay
{
    NSMutableArray *frames = [NSMutableArray arrayWithCapacity:frameCount];
    
    for (int i = 1; i < frameCount+1; i++) {
        NSString *file = [NSString stringWithFormat:@"%@%ib.png", frame, i];
        CCSpriteFrameCache *frameChe = [CCSpriteFrameCache sharedSpriteFrameCache];
        CCSpriteFrame *frame = [frameChe spriteFrameByName:file];
        [frames addObject:frame];
    }
    
    return [CCAnimation animationWithFrames:frames delay:delay];
    
}


@end
