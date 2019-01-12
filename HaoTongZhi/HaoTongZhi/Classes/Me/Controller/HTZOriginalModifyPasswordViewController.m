//
//  HTZOriginalModifyPasswordViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/6.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZOriginalModifyPasswordViewController.h"
#import "HTZLoginViewController.h"

@interface HTZOriginalModifyPasswordViewController ()
/** 原密码 */
@property (weak, nonatomic) IBOutlet UITextField *originalPasswordTextField;
/** 新密码 */
@property (weak, nonatomic) IBOutlet UITextField *nPasswordTextField;
/** 重复新密码 */
@property (weak, nonatomic) IBOutlet UITextField *repeatNewPasswordTextField;

@end

@implementation HTZOriginalModifyPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改密码";
    self.navigationController.navigationBar.translucent = NO;
}

- (IBAction)confirmSubmitButtonClick:(UIButton *)sender
{
    HTZNavigationController *nav = [[HTZNavigationController alloc] initWithRootViewController:[HTZLoginViewController new]];
    [self presentViewController:nav animated:YES completion:^{
        self.tabBarController.selectedIndex = 0;
        [self.navigationController popToRootViewControllerAnimated:NO];
        
    }];
}
@end
