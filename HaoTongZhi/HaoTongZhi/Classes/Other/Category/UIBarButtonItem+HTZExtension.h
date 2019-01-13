//
//  UIBarButtonItem+HTZExtension.h
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/23.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HTZExtension)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
+ (instancetype)itemRightWithTitle:(NSString *)title titleColor:(UIColor *)titleColor highTitle:(NSString *)highTitle highTitleColor:(UIColor *)highTitleColor target:(id)target action:(SEL)action;

@end
