//
//  HTZHomeVerticalButton.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/31.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZHomeVerticalButton.h"

@implementation HTZHomeVerticalButton

- (void)setup
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setup];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 调整图片
    self.imageView.x = (self.width - self.imageView.width) * 0.5;
    self.imageView.y = HTZMargin * 0.5;
    //    self.imageView.width = self.width;
    //    self.imageView.height = self.imageView.width;
    
    // 调整文字
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height + HTZMargin * 0.5;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
}

@end
