//
//  HTZModifyPasswordViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/2.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZModifyPasswordViewController.h"

@interface HTZModifyPasswordViewController ()

@end

@implementation HTZModifyPasswordViewController
#pragma mark - 控制器生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改密码";
}

#pragma mark - 提交按钮点击
- (IBAction)submitButtonClick:(UIButton *)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
