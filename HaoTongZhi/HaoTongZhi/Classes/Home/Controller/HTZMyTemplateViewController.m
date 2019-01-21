//
//  HTZMyTemplateViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/13.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZMyTemplateViewController.h"
#import "HTZCreateTemplateViewController.h"
#import "HTZMyTemplateCell.h"
#import "HTZPlaceOrderViewController.h"

static NSString * const HTZMyTemplateId = @"myTemplate";

@interface HTZMyTemplateViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HTZMyTemplateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化子控件
    [self setupSubview];
    
    //初始化数据
    [self setupData];
}

#pragma mark - 初始化数据
- (void)setupData
{
    
}

#pragma mark - 初始化子控件
- (void)setupSubview
{
    // 设置导航栏标题
    self.navigationItem.title = @"我的模版";
    
    // 设置导航栏右边的按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"home_template_plus_sign" highImage:@"home_template_plus_sign" target:self action:@selector(createTemplateClick)];
    
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HTZMyTemplateCell class]) bundle:nil] forCellReuseIdentifier:HTZMyTemplateId];
    
    // 行高
    self.tableView.rowHeight = 125;
    self.tableView.backgroundColor = HTZGlobalBackgroundColor;
}

- (void)createTemplateClick
{
    HTZCreateTemplateViewController *createTemplateVC = [[HTZCreateTemplateViewController alloc] init];
    [self.navigationController pushViewController:createTemplateVC animated:YES];
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HTZMyTemplateCell *cell = [tableView dequeueReusableCellWithIdentifier:HTZMyTemplateId];
    //    cell.item = self.options[indexPath.row];
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HTZPlaceOrderViewController *placeOrderVC = [[HTZPlaceOrderViewController alloc] init];
    [self.navigationController pushViewController:placeOrderVC animated:YES];
}

@end
