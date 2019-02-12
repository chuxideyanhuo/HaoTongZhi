//
//  HTZWeakTimerTarget.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/2/7.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZWeakTimerTarget.h"

@interface HTZWeakTimerTarget()
@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;
@end

@implementation HTZWeakTimerTarget

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo
{
    // 创建当前类的对象
    HTZWeakTimerTarget *object = [[HTZWeakTimerTarget alloc] init];
    object.target = aTarget;
    object.selector = aSelector;
    
    return  [NSTimer scheduledTimerWithTimeInterval:ti target:object selector:@selector(fire:) userInfo:userInfo repeats:yesOrNo];
}

- (void)fire:(id)obj
{
    [self.target performSelector:self.selector withObject:obj];
}
@end
