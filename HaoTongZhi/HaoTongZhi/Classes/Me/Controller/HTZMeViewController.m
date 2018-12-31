//
//  HTZMeViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/29.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import "HTZMeViewController.h"
#import "HTZLoginViewController.h"

@interface HTZMeViewController ()

@end

@implementation HTZMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    HTZLoginViewController *loginVC = [[HTZLoginViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:nil];
}

@end
