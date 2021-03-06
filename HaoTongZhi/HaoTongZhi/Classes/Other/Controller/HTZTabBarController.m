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
@property (nonatomic, strong) NSArray *names;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *selectImages;
@property (nonatomic, strong) NSArray *normalImages;
@property (nonatomic, strong) NSMutableArray *controllers;
@end

@implementation HTZTabBarController
#pragma mark - 控制器生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tabBar.barTintColor = [UIColor whiteColor];
    // 通过appearance统一设置所有UITabBarItem的文字属性,后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = HTZMainColor;
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    [self setupData:kHTZCustomerRole];
    
    [self addChildController];
    // 注册监听者
    [HTZNotificationCenter addObserver:self selector:@selector(modifyChildController:) name:HTZModifyTabBarChildController object:nil];
    
}

#pragma mark - 初始化数据
- (void)setupData:(NSString *)roleString
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"HTZTabBarData" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    NSDictionary *customerDict = dict[roleString];
    self.names = customerDict[@"names"];
    self.titles = customerDict[@"titles"];
    self.normalImages = customerDict[@"normalImages"];
    self.selectImages = customerDict[@"selectImages"];
}


#pragma mark - 添加子控制器
- (void)addChildController
{
    for (NSInteger i = 0; i < self.names.count; i++) {
        Class class = NSClassFromString(self.names[i]);
        NSString *title = self.titles[i];
        NSString *normalImageString = self.normalImages[i];
        NSString *selectImageString = self.selectImages[i];
        [self setupChildVc:[[class alloc] init] title:title image:normalImageString selectedImage:selectImageString];
    }
}

#pragma mark - 初始化子控制器
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 包装一个导航控制器, 添加导航控制器为tabbarcontroller的子控制器
    HTZNavigationController *nav = [[HTZNavigationController alloc] initWithRootViewController:vc];
//    [nav.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    [self addChildViewController:nav];
    [self.controllers addObject:nav];
}

#pragma mark - 监听通知回调
- (void)modifyChildController:(NSNotification *)note
{
    NSString *roleString = note.userInfo[kHTZRole];
    [self resetTabBarContents:roleString];
}

#pragma mark - 重置TabBar内容
- (void)resetTabBarContents:(NSString *)roleString
{
    if (![roleString isEqualToString:kHTZCustomerRole] && ![roleString isEqualToString:kHTZPlantRole] && ![roleString isEqualToString:kHTZExpressRole] && ![roleString isEqualToString:kHTZDriverRole]) {
        return;
    }
    [self.controllers removeAllObjects];
    [self setupData:roleString];
    [self addChildController];
    self.viewControllers = self.controllers;
}

#pragma mark - 移除监听者
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:HTZModifyTabBarChildController object:nil];
}

#pragma mark - 懒加载
//- (NSArray *)names
//{
//    if (!_names) {
//        _names = @[@"HTZHomeViewController",@"HTZOrderViewController",@"HTZPlatformViewController",@"HTZMeViewController"];
//    }
//    return _names;
//}
//
//- (NSArray *)titles
//{
//    if (!_titles) {
//        _titles = @[@"首页",@"订单管理",@"工作台",@"我的"];
//    }
//    return _titles;
//}
//
//- (NSArray *)normalImages
//{
//    if (!_normalImages) {
//        _normalImages = @[@"tabBar_home_icon",@"tabBar_order_icon",@"tabBar_platform_icon",@"tabBar_me_icon"];
//    }
//    return _normalImages;
//}
//
//- (NSArray *)selectImages
//{
//    if (!_selectImages) {
//        _selectImages = @[@"tabBar_home_click_icon",@"tabBar_order_click_icon",@"tabBar_platform_click_icon",@"tabBar_me_click_icon"];
//    }
//    return _selectImages;
//}

- (NSMutableArray *)controllers
{
    if (!_controllers) {
        _controllers = [NSMutableArray array];
    }
    return _controllers;
}
//- (void)viewDidLayoutSubviews
//{
//    [super viewDidLayoutSubviews];
//    HTZLog(@"tabbar---------%@",NSStringFromCGRect(self.tabBarController.tabBar.frame));
//    NSInteger type = [HTZSystemTool deviceType];
//    if (type == iPhoneX || type == Unknown) {
//        self.tabBarController.tabBar.frame = CGRectMake(0, HTZSCREENH - HTZIPhoneXTabbarHeight, HTZSCREENW, HTZIPhoneXTabbarHeight);
//    }
//}
@end
