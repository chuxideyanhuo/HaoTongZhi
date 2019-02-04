//
//  HTZAboutUsViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/10.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZAboutUsViewController.h"

@interface HTZAboutUsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleL;
@property (weak, nonatomic) IBOutlet UILabel *contentL;

@end

@implementation HTZAboutUsViewController
#pragma mark - 控制器生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航栏标题
    self.navigationItem.title = @"关于我们";
    self.navigationController.navigationBar.translucent = NO;
}

@end
