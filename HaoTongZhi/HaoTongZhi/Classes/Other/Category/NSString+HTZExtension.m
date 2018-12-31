//
//  NSString+HTZExtension.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/29.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import "NSString+HTZExtension.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (HTZExtension)
/**
 * 根据指定的size，字体大小计算宽高度
 */
- (CGSize)getRealSizeWithMaxSize:(CGSize)maxSize font:(UIFont *)font
{
    NSDictionary *dict = @{NSFontAttributeName:font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
}

/**
 * 根据给定的字体大小，range，颜色设置字符串
 */
- (NSAttributedString *)attributeStringWithFontOfSize:(CGFloat)fontSize range:(NSRange)range color:(UIColor *)color
{
    NSMutableAttributedString *attributeS = [[NSMutableAttributedString alloc] initWithString:self];
    NSDictionary *attributeD = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize],NSForegroundColorAttributeName:color};
    [attributeS setAttributes:attributeD range:range];
    return attributeS;
}

/**
 * 设置给定的某个子字符串，后面字符串的颜色
 */
- (NSAttributedString *)attributeStringWithTagString:(NSString *)tagString color:(UIColor *)color
{
    NSMutableAttributedString *attributeS = [[NSMutableAttributedString alloc] initWithString:self];
    NSRange tagRange = [self rangeOfString:tagString];
    
    NSDictionary *attributeD = @{NSForegroundColorAttributeName:color};
    [attributeS setAttributes:attributeD range:NSMakeRange(tagRange.location + tagRange.length, self.length - tagRange.location - tagRange.length)];
    return attributeS;
}

/**
 * 根据给定的range设置字符串的颜色
 */
- (NSAttributedString *)attributeStringWithRange:(NSRange)range color:(UIColor *)color
{
    NSMutableAttributedString *attributeS = [[NSMutableAttributedString alloc] initWithString:self];
    NSDictionary *attributeD = @{NSForegroundColorAttributeName:color};
    [attributeS setAttributes:attributeD range:range];
    return attributeS;
}

/**
 * 设置UILabel字体的行距
 */
- (NSAttributedString *)getAttributedStringWithLineSpace:(CGFloat)lSpace
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lSpace; // 调整行间距
    NSRange range = NSMakeRange(0, [self length]);
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    [attributedString addAttribute:NSKernAttributeName value:@0.1f range:range];
    return attributedString;
}

/**
 * 格式化时间格式 年月日
 */
- (NSString *)dateFormatYearMonthDate
{
    // 格式化时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[self doubleValue]];
    NSString *dateString = [formatter stringFromDate:date];
    return dateString;
}

/**
 * 格式化时间格式 年月日 时分秒
 */
- (NSString *)dateFormatYearMonthDateHoursMinutesSeconds
{
    // 格式化时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[self doubleValue]];
    NSString *dateString = [formatter stringFromDate:date];
    return dateString;
}

/**
 * MD5加密
 */
- (NSString *)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
@end
