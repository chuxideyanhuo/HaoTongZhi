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
- (CGSize)getRealSizeWithMaxSize:(CGSize)maxSize font:(UIFont *)font;
- (NSAttributedString *)attributeStringWithFontOfSize:(CGFloat)fontSize range:(NSRange)range color:(UIColor *)color;
- (NSAttributedString *)attributeStringWithRange:(NSRange)range color:(UIColor *)color;
- (NSAttributedString *)attributeStringWithTagString:(NSString *)tagString color:(UIColor *)color;
- (NSAttributedString *)getAttributedStringWithLineSpace:(CGFloat)lSpace;
- (NSString *)dateFormatYearMonthDate;
- (NSString *)dateFormatYearMonthDateHoursMinutesSeconds;
- (NSString *)md5;
@end
