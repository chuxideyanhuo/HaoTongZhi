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

@end

@implementation HTZForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"找回密码";
//    self.navigationController.navigationBar.translucent = NO;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
}
- (IBAction)verificationButtonClick:(UIButton *)sender
{
    HTZModifyPasswordViewController *modifyPaaswordVC = [[HTZModifyPasswordViewController alloc] init];
    [self.navigationController pushViewController:modifyPaaswordVC animated:YES];
}

@end
