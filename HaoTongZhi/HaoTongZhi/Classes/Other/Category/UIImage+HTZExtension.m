//
//  UIImage+HTZExtension.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/31.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "UIImage+HTZExtension.h"

@implementation UIImage (HTZExtension)

+ (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    return image;
}
@end
