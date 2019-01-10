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
