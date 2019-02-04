//
//  HTZForgetPasswordViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/1.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZForgetPasswordViewController.h"
#import "HTZModifyPasswordViewController.h"

@interface HTZForgetPasswordViewController ()
/** 手机号 */
@property (weak, nonatomic) IBOutlet UITextField *mobileTextField;
/** 获取验证码 */
@property (weak, nonatomic) IBOutlet UIButton *verificationCodeButton;
/** 验证码 */
@property (weak, nonatomic) IBOutlet UITextField *verificationCodeTextField;

@end

@implementation HTZForgetPasswordViewController
#pragma mark - 控制器生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"找回密码";
//    self.navigationController.navigationBar.translucent = NO;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
}

#pragma mark - 获取验证码
- (IBAction)verificationCodeButtonClick:(UIButton *)sender
{
    
}

#pragma mark - 立即验证
- (IBAction)verificationButtonClick:(UIButton *)sender
{
    HTZModifyPasswordViewController *modifyPaaswordVC = [[HTZModifyPasswordViewController alloc] init];
    [self.navigationController pushViewController:modifyPaaswordVC animated:YES];
}

@end
