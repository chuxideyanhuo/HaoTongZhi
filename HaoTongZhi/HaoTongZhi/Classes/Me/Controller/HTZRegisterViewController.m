//
//  HTZRegisterViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/31.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import "HTZRegisterViewController.h"
#import "HTZPerfectInformationViewController.h"

@interface HTZRegisterViewController ()

@end

@implementation HTZRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
//    self.navigationController.navigationBar.translucent = NO;
    //    self.edgesForExtendedLayout = UIRectEdgeNone;
//    self.view.layer.borderColor = [UIColor redColor].CGColor;
//    self.view.layer.borderWidth;
//    self.view.layer.cornerRadius = 3
//    self.view.layer.borderColor
//    self.view.layer.masksToBounds
}

- (IBAction)submitButtonClick:(UIButton *)sender
{
    HTZPerfectInformationViewController *perfectInfoVC = [[HTZPerfectInformationViewController alloc] init];
    [self.navigationController pushViewController:perfectInfoVC animated:YES];
    
}

@end
