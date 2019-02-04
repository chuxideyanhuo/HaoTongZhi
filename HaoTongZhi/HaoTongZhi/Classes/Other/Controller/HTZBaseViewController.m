//
//  HTZBaseViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/29.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import "HTZBaseViewController.h"

@interface HTZBaseViewController ()

@end

@implementation HTZBaseViewController
#pragma mark - 控制器生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HTZGlobalBackgroundColor;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSInteger type = [HTZSystemTool deviceType];
    // 判断是不是iPhoneX，设置tabBar高度
    if ((type == iPhoneX  || type == Unknown) && self.navigationController.childViewControllers.count > 1) {
        self.tabBarController.tabBar.frame = CGRectMake(0, HTZSCREENH - HTZIPhoneXTabbarHeight, HTZSCREENW, HTZIPhoneXTabbarHeight);
    }
}
@end
