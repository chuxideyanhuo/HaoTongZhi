//
//  UIView+HTZBezier.h
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/29.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HTZBezier)
/**
 * 设置圆角
 */
- (void)setupRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;
@end
