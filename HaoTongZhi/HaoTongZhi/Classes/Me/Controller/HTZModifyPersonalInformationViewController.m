//
//  HTZModifyPersonalInformationViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/10.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZModifyPersonalInformationViewController.h"

@interface HTZModifyPersonalInformationViewController ()
/** 头像 */
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
/** 昵称 */
@property (weak, nonatomic) IBOutlet UITextField *nicknameTextField;
/** 姓名 */
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
/** 男 */
@property (weak, nonatomic) IBOutlet UIButton *manButton;
/** 女 */
@property (weak, nonatomic) IBOutlet UIButton *womanButton;
/** 手机 */
@property (weak, nonatomic) IBOutlet UITextField *mobileTextField;
/** 单位 */
@property (weak, nonatomic) IBOutlet UILabel *companyLabel;
/** 科室 */
@property (weak, nonatomic) IBOutlet UILabel *departmentLabel;
/** 邮箱 */
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@end

@implementation HTZModifyPersonalInformationViewController
#pragma mark - 控制器生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航栏标题
    self.navigationItem.title = @"修改信息";
    self.navigationController.navigationBar.translucent = NO;
    
}

#pragma mark - 确认修改按钮点击
- (IBAction)confirmModifyButtonClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - view点击
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 取消第一响应者
    [self.view endEditing:YES];
}

#pragma mark - 选中男
- (IBAction)manButtonClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    self.womanButton.selected = NO;
}

#pragma mark - 选中女
- (IBAction)womanButtonClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    self.manButton.selected = NO;
}
@end
