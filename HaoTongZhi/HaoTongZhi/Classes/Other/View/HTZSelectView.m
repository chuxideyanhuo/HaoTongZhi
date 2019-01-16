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

#pragma mark - 懒加载
- (UITextField *)contentTextField
{
    if (!_contentTextField) {
        _contentTextField = [[UITextField alloc] init];
        _contentTextField.font = [UIFont systemFontOfSize:14];
        _contentTextField.textColor = HTZBlackFontColor;
        _contentTextField.borderStyle = UITextBorderStyleNone;
        
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HTZMargin * 0.5, 0)];
        leftView.backgroundColor = [UIColor redColor];
        _contentTextField.leftView = leftView;
        _contentTextField.leftViewMode = UITextFieldViewModeAlways;
        
        UIImage *image = [UIImage imageNamed:@"order_select_triangle"];
        UIImageView *rightView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 9, HTZMargin * 2, 18)];
        rightView.image = [UIImage imageNamed:@"order_select_triangle"];
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

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupLayer];
        [self setupSubviews];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupLayer];
    [self setupSubviews];
}

- (void)setupSubviews
{
    [self addSubview:self.contentTextField];
    [self addSubview:self.selectButton];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
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

- (void)selectButtonClick:(UIButton *)sender
{
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    HTZLogFunc;
}

@end
