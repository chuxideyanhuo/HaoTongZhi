//
//  HTZHomeViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/29.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import "HTZHomeViewController.h"
#import "HTZPlaceOrderViewController.h"

@interface HTZHomeViewController ()

@end

@implementation HTZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *bt = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    bt.backgroundColor = [UIColor redColor];
    [self.view addSubview:bt];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    HTZPlaceOrderViewController *placeOrderVC = [[HTZPlaceOrderViewController alloc] init];
    [self.navigationController pushViewController:placeOrderVC animated:YES];
}
@end
