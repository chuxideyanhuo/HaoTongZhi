//
//  UIColor+HTZHex.h
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/29.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HTZHex)
/**
 * 默认alpha为1
 */
+ (UIColor *)colorWithHexString:(NSString *)color;

/**
 * 从十六进制字符串获取颜色，
 * color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end
