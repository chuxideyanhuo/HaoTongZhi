//
//  CALayer+BorderColor.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/31.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import "CALayer+BorderColor.h"

@implementation CALayer (BorderColor)
- (void)setBorderColorWithUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}

- (UIColor *)borderColorWithUIColor
{
    return [UIColor blackColor];
}
@end
