//
//  HTZPersonalInformationViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/6.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZPersonalInformationViewController.h"
#import "HTZModifyPersonalInformationViewController.h"

@interface HTZPersonalInformationViewController ()
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

@implementation HTZPersonalInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航栏标题
    self.navigationItem.title = @"个人信息";
    self.navigationController.navigationBar.translucent = NO;
    
    // 设置导航栏右边的按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"tabBar_home_icon" highImage:@"tabBar_home_click_icon" target:self action:@selector(modifyPersonalInformationClick)];
}

- (void)modifyPersonalInformationClick
{
    HTZModifyPersonalInformationViewController *modifyVC = [[HTZModifyPersonalInformationViewController alloc] init];
    [self.navigationController pushViewController:modifyVC animated:YES];
}
@end
