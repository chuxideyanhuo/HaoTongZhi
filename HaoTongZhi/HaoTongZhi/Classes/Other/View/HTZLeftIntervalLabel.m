//
//  HTZLeftIntervalLabel.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/22.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZLeftIntervalLabel.h"

@implementation HTZLeftIntervalLabel

- (void)drawRect:(CGRect)rect
{
    UIEdgeInsets insets = {0, 5, 0, 0};
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
