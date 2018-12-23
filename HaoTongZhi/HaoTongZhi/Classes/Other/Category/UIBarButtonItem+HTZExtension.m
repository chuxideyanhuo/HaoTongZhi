//
//  UIBarButtonItem+HTZExtension.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/23.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import "UIBarButtonItem+HTZExtension.h"

@implementation UIBarButtonItem (HTZExtension)

+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    button.size = button.currentBackgroundImage.size;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[self alloc] initWithCustomView:button];
}

@end
