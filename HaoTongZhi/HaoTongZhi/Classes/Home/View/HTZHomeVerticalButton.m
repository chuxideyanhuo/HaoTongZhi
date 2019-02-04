//
//  HTZHomeVerticalButton.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/31.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZHomeVerticalButton.h"

@implementation HTZHomeVerticalButton

#pragma mark - view生命周期
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupSubviews];
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

#pragma mark - 初始化子控件
- (void)setupSubviews
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
