//
//  HTZMyTemplateViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/13.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZMyTemplateViewController.h"
#import "HTZCreateTemplateViewController.h"

@interface HTZMyTemplateViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation HTZMyTemplateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航栏标题
    self.navigationItem.title = @"我的模版";
    
    // 设置导航栏右边的按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"home_template_plus_sign" highImage:@"home_template_plus_sign" target:self action:@selector(createTemplateClick)];
}

- (void)createTemplateClick
{
    HTZCreateTemplateViewController *createTemplateVC = [[HTZCreateTemplateViewController alloc] init];
    [self.navigationController pushViewController:createTemplateVC animated:YES];
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
