//
//  HTZSystemTool.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/11.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZSystemTool.h"
#import <sys/utsname.h>

@implementation HTZSystemTool
/**
 *  设备类型
 */
+ (DeviceType)deviceType
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //iPhone
    if ([platform isEqualToString:@"iPhone5,1"])     return iPhone5;
    if ([platform isEqualToString:@"iPhone5,2"])     return iPhone5;
    if ([platform isEqualToString:@"iPhone5,3"])     return iPhone5c;
    if ([platform isEqualToString:@"iPhone5,4"])     return iPhone5c;
    if ([platform isEqualToString:@"iPhone6,1"])     return iPhone5s;
    if ([platform isEqualToString:@"iPhone6,2"])     return iPhone5s;
    if ([platform isEqualToString:@"iPhone7,1"])     return iPhone6Plus;
    if ([platform isEqualToString:@"iPhone7,2"])     return iPhone6;
    if ([platform isEqualToString:@"iPhone8,1"])     return iPhone6s;
    if ([platform isEqualToString:@"iPhone8,2"])     return iPhone6sPlus;
    if ([platform isEqualToString:@"iPhone8,4"])     return iPhoneSE;
    if ([platform isEqualToString:@"iPhone9,1"])     return iPhone7;
    if ([platform isEqualToString:@"iPhone9,3"])     return iPhone7;
    if ([platform isEqualToString:@"iPhone9,2"])     return iPhone7Plus;
    if ([platform isEqualToString:@"iPhone9,4"])     return iPhone7Plus;
    if ([platform isEqualToString:@"iPhone10,1"])    return iPhone8;
    if ([platform isEqualToString:@"iPhone10,4"])    return iPhone8;
    if ([platform isEqualToString:@"iPhone10,2"])    return iPhone8Plus;
    if ([platform isEqualToString:@"iPhone10,5"])    return iPhone8Plus;
    if ([platform isEqualToString:@"iPhone10,3"])    return iPhoneX;
    if ([platform isEqualToString:@"iPhone10,6"])    return iPhoneX;
    if ([platform isEqualToString:@"iPhone11,8"])    return iPhoneXR;
    if ([platform isEqualToString:@"iPhone11,2"])    return iPhoneXS;
    if ([platform isEqualToString:@"iPhone11,6"])    return iPhoneXSMax;
    if ([platform isEqualToString:@"iPhone11,4"])    return iPhoneXSMax;
    return Unknown;
}

@end
