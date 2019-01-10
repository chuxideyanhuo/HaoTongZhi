//
//  HTZPerfectInformationViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/3.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZPerfectInformationViewController.h"
#import "HTZRegisterSuccessViewController.h"

@interface HTZPerfectInformationViewController ()

@end

@implementation HTZPerfectInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"完善资料";
    
}

- (IBAction)submitButtonClick:(UIButton *)sender
{
    HTZRegisterSuccessViewController *registerSuccessVC = [[HTZRegisterSuccessViewController alloc] init];
    [self.navigationController pushViewController:registerSuccessVC animated:YES];
}
@end
