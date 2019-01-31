//
//  HTZLoginViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/30.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import "HTZLoginViewController.h"
#import "HTZRegisterViewController.h"
#import "HTZForgetPasswordViewController.h"

@interface HTZLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *mobileTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *automaticLoginButton;

@end

@implementation HTZLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    
    NSInteger automaticLogin = [HTZUserDefaults integerForKey:HTZAutomaticLoginKey];
    if (automaticLogin) {
        self.automaticLoginButton.selected = YES;
    }
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
    self.passwordTextField.secureTextEntry = sender.selected;
    sender.selected = !sender.selected;
}

#pragma mark - 登录
- (IBAction)loginButtonClick:(UIButton *)sender
{
    if (!self.mobileTextField.text.length || !self.passwordTextField.text.length) {
        return;
    }
    NSString *urlString = [NSString stringWithFormat:@"%@%@",HTZDomainString,HTZUserLoginInterface];
    NSDictionary *params = @{@"mobile":self.mobileTextField.text,@"password":self.passwordTextField.text};
    [HTZProgressHUD showDefaultHUD];
    [[HTZNetworkTool new] postUrl:urlString params:params success:^(NSDictionary *responseObj) {
        HTZLog(@"responseObj------%@",responseObj);
        [HTZProgressHUD dismissHUD];
        if ([responseObj[@"code"] integerValue] == 0) {
            NSDictionary *dict = @{kHTZRole:kHTZCustomerRole};
            [HTZNotificationCenter postNotificationName:HTZModifyTabBarChildController object:nil userInfo:dict];
            //需要存储用户信息
            [self dismissViewControllerAnimated:YES completion:nil];
        }else{
            [HTZProgressHUD showTextHUDWithStatus:responseObj[@"msg"]];
        }
    } failure:^(NSError *error) {
        [HTZProgressHUD showErrorHUDWithStatus:@"登录失败!"];
        HTZLog(@"error------%@",error);
    }];
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
    HTZForgetPasswordViewController *forgetPaaswordVC = [[HTZForgetPasswordViewController alloc] init];
    [self.navigationController pushViewController:forgetPaaswordVC animated:YES];
}

#pragma mark - 自动登录
- (IBAction)autoLoginButtonClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    if (sender.selected) {
        [HTZUserDefaults setInteger:1 forKey:HTZAutomaticLoginKey];
    }else{
        [HTZUserDefaults setInteger:0 forKey:HTZAutomaticLoginKey];
    }
    [HTZUserDefaults synchronize];
}



#pragma mark - 开始触摸调用
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
//    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
