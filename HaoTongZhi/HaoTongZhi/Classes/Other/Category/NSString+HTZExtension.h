//
//  NSString+HTZExtension.h
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/29.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (HTZExtension)
/**
 * 根据指定的size，字体大小计算宽高度
 */
- (CGSize)getRealSizeWithMaxSize:(CGSize)maxSize font:(UIFont *)font;

/**
 * 根据给定的字体大小，range，颜色设置字符串
 */
- (NSAttributedString *)attributeStringWithFontOfSize:(CGFloat)fontSize range:(NSRange)range color:(UIColor *)color;

/**
 * 设置给定的某个子字符串，后面字符串的颜色
 */
- (NSAttributedString *)attributeStringWithTagString:(NSString *)tagString color:(UIColor *)color;

/**
 * 根据给定的range设置字符串的颜色
 */
- (NSAttributedString *)attributeStringWithRange:(NSRange)range color:(UIColor *)color;

/**
 * 设置UILabel字体的行距
 */
- (NSAttributedString *)getAttributedStringWithLineSpace:(CGFloat)lSpace;

/**
 * 格式化时间格式 年月日
 */
- (NSString *)dateFormatYearMonthDate;

/**
 * 格式化时间格式 年月日 时分秒
 */
- (NSString *)dateFormatYearMonthDateHoursMinutesSeconds;

/**
 * MD5加密
 */
- (NSString *)md5;
@end
