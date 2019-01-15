//
//  HTZHomeViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/29.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import "HTZHomeViewController.h"
#import "HTZPlaceOrderViewController.h"

@interface HTZHomeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation HTZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HTZSCREENW, 100)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = HTZMainColor;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    HTZPlaceOrderViewController *placeOrderVC = [[HTZPlaceOrderViewController alloc] init];
    [self.navigationController pushViewController:placeOrderVC animated:YES];
}
@end
