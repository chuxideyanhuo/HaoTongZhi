//
//  UIBarButtonItem+HTZExtension.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/23.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import "UIBarButtonItem+HTZExtension.h"

@implementation UIBarButtonItem (HTZExtension)
/**
 * 设置导航条图片按钮
 * image:图片
 * highImage:高亮图片
 * target:响应对象
 * action:响应对象方法
 */
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
//    button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -10);
//    button.backgroundColor = [UIColor greenColor];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
}

/**
 * 设置导航条文字按钮
 * title:文字
 * titleColor:文字颜色
 * highTitle:高亮文字
 * highTitleColor:高亮文字颜色
 * target:响应对象
 * action:响应对象方法
 */
+ (instancetype)itemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor highTitle:(NSString *)highTitle highTitleColor:(UIColor *)highTitleColor target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button setTitle:highTitle forState:UIControlStateHighlighted];
    [button setTitleColor:highTitleColor forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -10);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
}

@end
