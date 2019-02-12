//
//  HTZWeakTimerTarget.h
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/2/7.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTZWeakTimerTarget : NSObject
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

@end
