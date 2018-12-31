//
//  HTZLoginViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/30.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import "HTZLoginViewController.h"
#import "HTZRegisterViewController.h"

@interface HTZLoginViewController ()

@end

@implementation HTZLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

#pragma mark - 显示密码
- (IBAction)showPassword:(UIButton *)sender
{
    HTZLogFunc;
}

#pragma mark - 登录
- (IBAction)loginButtonClick:(UIButton *)sender
{
    HTZLogFunc;
}

#pragma mark - 注册
- (IBAction)registerButtonClick:(UIButton *)sender
{
    HTZRegisterViewController *registerVC = [[HTZRegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVC animated:YES];
}

#pragma mark - 忘记密码
- (IBAction)forgetButtonClick:(UIButton *)sender
{
    HTZLogFunc;
}

#pragma mark - 自动登录
- (IBAction)autoLoginButtonClick:(UIButton *)sender
{
    HTZLogFunc;
}



#pragma mark - 开始触摸调用
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
