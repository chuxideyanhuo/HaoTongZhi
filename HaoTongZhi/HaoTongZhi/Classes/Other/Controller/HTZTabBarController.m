//
//  HTZTabBarController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/23.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import "HTZTabBarController.h"
#import "HTZNavigationController.h"
#import "HTZHomeViewController.h"
#import "HTZOrderViewController.h"
#import "HTZPlatformViewController.h"
#import "HTZMeViewController.h"

@interface HTZTabBarController ()

@end

@implementation HTZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 通过appearance统一设置所有UITabBarItem的文字属性,后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    
    // 添加子控制器
    [self setupChildVc:[[HTZHomeViewController alloc] init] title:@"首页" image:@"tabBar_home_icon" selectedImage:@"tabBar_home_click_icon"];
    
    [self setupChildVc:[[HTZOrderViewController alloc] init] title:@"订单管理" image:@"tabBar_order_icon" selectedImage:@"tabBar_order_click_icon"];
    
    [self setupChildVc:[[HTZPlatformViewController alloc] init] title:@"工作台" image:@"tabBar_platform_icon" selectedImage:@"tabBar_platform_click_icon"];
    
    [self setupChildVc:[[HTZMeViewController alloc] init] title:@"我的" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
}

/**
 * 初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
    HTZNavigationController *nav = [[HTZNavigationController alloc] initWithRootViewController:vc];
    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    [self addChildViewController:nav];
}


@end
