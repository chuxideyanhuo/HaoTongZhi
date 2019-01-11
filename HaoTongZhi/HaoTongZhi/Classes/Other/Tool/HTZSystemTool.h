//
//  HTZSystemTool.h
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/11.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    Unknown = 0,
    iPhone5,
    iPhone5c,
    iPhone5s,
    iPhone6,
    iPhone6Plus,
    iPhone6s,
    iPhone6sPlus,
    iPhoneSE,
    iPhone7,
    iPhone7Plus,
    iPhone8,
    iPhone8Plus,
    iPhoneX,
    iPhoneXR,
    iPhoneXS,
    iPhoneXSMax,
} DeviceType;

@interface HTZSystemTool : NSObject
/**
 *  设备类型
 */
+ (DeviceType)deviceType;
@end
