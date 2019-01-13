//
//  HTZPlaceOrderViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/11.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZPlaceOrderViewController.h"
#import "HTZMyTemplateViewController.h"

@interface HTZPlaceOrderViewController ()

@end

@implementation HTZPlaceOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航栏标题
    self.navigationItem.title = @"下单";
    
    // 设置导航栏右边的按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemRightWithTitle:@"选择模版下单" titleColor:[UIColor redColor] highTitle:@"选择模版下单" highTitleColor:HTZMainColor target:self action:@selector(selectTemplateOrder)];
}

- (void)selectTemplateOrder
{
    HTZMyTemplateViewController *templateVC = [[HTZMyTemplateViewController alloc] init];
    [self.navigationController pushViewController:templateVC animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
