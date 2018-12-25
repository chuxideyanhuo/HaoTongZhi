//
//  HTZLoginView.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/25.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import "HTZLoginView.h"

@interface HTZLoginView()
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *appTitleLabel;
@property (nonatomic, strong) UITextField *mobileTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIImageView *eyeImageView;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UIButton *forgetPasswordButton;
@property (nonatomic, strong) UIButton *autoLoginButton;
@end

@implementation HTZLoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupLoginView];
    }
    return self;
}

- (void)setupLoginView
{
    [self addSubview:self.icon];
    [self addSubview:self.appTitleLabel];
    [self addSubview:self.mobileTextField];
    [self addSubview:self.passwordTextField];
    [self addSubview:self.eyeImageView];
    [self addSubview:self.loginButton];
    [self addSubview:self.registerButton];
    [self addSubview:self.forgetPasswordButton];
    [self addSubview:self.autoLoginButton];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self setupLayout];
}

- (void)setupLayout
{
    __weak typeof(self) weakSelf = self;
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(self) strongSelf = weakSelf;
    }];
    
    [self.appTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(self) strongSelf = weakSelf;
    }];
    
    [self.mobileTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(self) strongSelf = weakSelf;
    }];
    
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(self) strongSelf = weakSelf;
    }];
    
    [self.eyeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(self) strongSelf = weakSelf;
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(self) strongSelf = weakSelf;
    }];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(self) strongSelf = weakSelf;
    }];
    
    [self.forgetPasswordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(self) strongSelf = weakSelf;
    }];
    
    [self.autoLoginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(self) strongSelf = weakSelf;
    }];
}

#pragma mark - 懒加载
- (UIImageView *)icon
{
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
    }
    return _icon;
}

- (UILabel *)appTitleLabel
{
    if (!_appTitleLabel) {
        _appTitleLabel = [[UILabel alloc] init];
    }
    return _appTitleLabel;
}

- (UITextField *)mobileTextField
{
    if (!_mobileTextField) {
        _mobileTextField = [[UITextField alloc] init];
    }
    return _mobileTextField;
}

- (UITextField *)passwordTextField
{
    if (!_passwordTextField) {
        _passwordTextField = [[UITextField alloc] init];
    }
    return _passwordTextField;
}

- (UIImageView *)eyeImageView
{
    if (!_eyeImageView) {
        _eyeImageView = [[UIImageView alloc] init];
    }
    return _eyeImageView;
}

- (UIButton *)loginButton
{
    if (!_loginButton) {
        _loginButton = [[UIButton alloc] init];
    }
    return _loginButton;
}

- (UIButton *)registerButton
{
    if (!_registerButton) {
        _registerButton = [[UIButton alloc] init];
    }
    return _registerButton;
}

- (UIButton *)forgetPasswordButton
{
    if (!_forgetPasswordButton) {
        _forgetPasswordButton = [[UIButton alloc] init];
    }
    return _forgetPasswordButton;
}

- (UIButton *)autoLoginButton
{
    if (!_autoLoginButton) {
        _autoLoginButton = [[UIButton alloc] init];
    }
    return _autoLoginButton;
}


@end
