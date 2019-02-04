//
//  HTZSelectView.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/16.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZSelectView.h"

@interface HTZSelectView ()
@property (nonatomic, strong) UITextField *contentTextField;
@property (nonatomic, strong) UIButton *selectButton;
@end

@implementation HTZSelectView

#pragma mark - view生命周期
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
        [self setupLayer];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupSubviews];
    [self setupLayer];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    // 布局子控件
    [self.contentTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
    }];
    
    [self.selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
    }];
}

#pragma mark - 初始化子控件
- (void)setupSubviews
{
    [self addSubview:self.contentTextField];
    [self addSubview:self.selectButton];
}

#pragma mark - 初始化layer
- (void)setupLayer
{
    self.layer.cornerRadius = HTZLayerCornerRadius;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = HTZLayerBorderWidth;
    
//    CGFloat viewH = self.frame.size.height;
//
//    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HTZMargin * 0.5, 0)];
//    leftView.backgroundColor = [UIColor redColor];
//    self.contentTextField.leftView = leftView;
//    self.contentTextField.leftViewMode = UITextFieldViewModeAlways;
//
//    UIImageView *rightView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, HTZMargin * 2, viewH)];
//    rightView.image = [UIImage imageNamed:@"order_select_triangle"];
//    rightView.backgroundColor = HTZMainColor;
//    self.contentTextField.rightView = rightView;
//    self.contentTextField.rightViewMode = UITextFieldViewModeAlways;
}

#pragma mark - 重写contentString的set方法
- (void)setContentString:(NSString *)contentString
{
    _contentString = contentString;
    self.contentTextField.text = contentString;
}

#pragma mark - 选择按钮点击
- (void)selectButtonClick:(UIButton *)sender
{
    HTZLogFunc;
}

#pragma mark - 懒加载
- (UITextField *)contentTextField
{
    if (!_contentTextField) {
        _contentTextField = [[UITextField alloc] init];
        _contentTextField.font = [UIFont systemFontOfSize:14];
        _contentTextField.textColor = HTZBlackFontColor;
        _contentTextField.borderStyle = UITextBorderStyleNone;
        _contentTextField.backgroundColor = HTZGlobalBackgroundColor;
        _contentTextField.text = @"点我选择";
        
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HTZMargin * 0.5, 0)];
        leftView.backgroundColor = [UIColor redColor];
        _contentTextField.leftView = leftView;
        _contentTextField.leftViewMode = UITextFieldViewModeAlways;
        
        CGFloat viewH = self.frame.size.height;
        UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HTZMargin * 1.5, viewH)];
        UIImageView *imgview = [[UIImageView alloc] initWithFrame:CGRectMake(0, 9, HTZMargin * 0.8, 18)];
        imgview.image = [UIImage imageNamed:@"order_select_triangle"];
        [rightView addSubview:imgview];
        self.contentTextField.rightView = rightView;
        self.contentTextField.rightViewMode = UITextFieldViewModeAlways;
    }
    return _contentTextField;
}

- (UIButton *)selectButton
{
    if (!_selectButton) {
        _selectButton = [[UIButton alloc] init];
        _selectButton.backgroundColor = [UIColor clearColor];
        [_selectButton addTarget:self action:@selector(selectButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _selectButton;
}

@end
