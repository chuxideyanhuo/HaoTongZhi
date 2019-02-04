//
//  HTZHomeTableViewHeader.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/2/2.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZHomeTableViewHeader.h"
#import "HTZHomeTableViewHeaderItem.h"

@interface HTZHomeTableViewHeader ()
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *titleL;
@property (nonatomic, strong) UIButton *moreButton;
@end

@implementation HTZHomeTableViewHeader

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

#pragma mark - 初始化子视图
- (void)setupSubviews
{
    self.backgroundColor = [UIColor clearColor];
    [self addSubview:self.bgView];
    [self.bgView addSubview:self.moreButton];
    [self.bgView addSubview:self.titleL];
}

#pragma mark - 布局子控件
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(HTZMargin);
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-HTZMargin);
        make.right.mas_equalTo(self.mas_right).offset(0);
    }];
    
    [self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bgView.mas_top).offset(0);
        make.bottom.mas_equalTo(self.bgView.mas_bottom).offset(0);
        make.right.mas_equalTo(self.bgView.mas_right).offset(-HTZMargin);
        make.width.mas_equalTo(HTZMargin * 4);
    }];
    
    [self.titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bgView.mas_top).offset(0);
        make.left.mas_equalTo(self.bgView.mas_left).offset(HTZMargin);
        make.bottom.mas_equalTo(self.bgView.mas_bottom).offset(0);
        make.right.mas_equalTo(self.moreButton.mas_left).offset(0);
    }];
}

#pragma mark - 重写item的set方法
- (void)moreButtonClick:(UIButton *)btn
{
    !self.moreClickBlock ? : self.moreClickBlock(self.item);
}

#pragma mark - 重写item的set方法
- (void)setItem:(HTZHomeTableViewHeaderItem *)item
{
    _item = item;
    _titleL.text = item.name;
    if ([item.showMore integerValue]) {
        self.moreButton.hidden = NO;
    }else{
        self.moreButton.hidden = YES;
    }
}

#pragma mark - 懒加载
- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}

- (UILabel *)titleL
{
    if (!_titleL) {
        _titleL = [[UILabel alloc] init];
        _titleL.font = [UIFont boldSystemFontOfSize:16];
        _titleL.textColor = HTZBlackFontColor;
    }
    return _titleL;
}

- (UIButton *)moreButton
{
    if (!_moreButton) {
        _moreButton = [[UIButton alloc] init];
        _moreButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        _moreButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_moreButton setTitle:@"..." forState:UIControlStateNormal];
        [_moreButton setTitleColor:HTZBlackFontColor forState:UIControlStateNormal];
        [_moreButton addTarget:self action:@selector(moreButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreButton;
}

@end
