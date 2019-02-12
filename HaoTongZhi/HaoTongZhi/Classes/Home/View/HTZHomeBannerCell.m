//
//  HTZHomeBannerCell.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/2/7.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZHomeBannerCell.h"
#import "HTZHomeBannerItem.h"

@interface HTZHomeBannerCell ()
@property (nonatomic, strong) UIImageView *icon;
@end

@implementation HTZHomeBannerCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}


#pragma mark - 初始化子视图
- (void)setupSubviews
{
    [self addSubview:self.icon];
}

#pragma mark - 布局子控件
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
    }];
}

- (void)setItem:(HTZHomeBannerItem *)item
{
    _item = item;
    // 下载图片
//    [self.icon sd_setImageWithURL:[NSURL URLWithString:item.name]];
}

#pragma mark - 懒加载
- (UIImageView *)icon
{
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _icon;
}
@end
