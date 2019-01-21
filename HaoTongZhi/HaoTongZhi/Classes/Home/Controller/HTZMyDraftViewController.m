//
//  HTZMyDraftViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/13.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZMyDraftViewController.h"
#import "HTZMyDraftCell.h"
#import "HTZMyDraftItem.h"
#import "HTZPlaceOrderViewController.h"

static NSString * const HTZMyDraftId = @"myDraft";

@interface HTZMyDraftViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HTZMyDraftViewController

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
    self.navigationItem.title = @"我的草稿";
    
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HTZMyDraftCell class]) bundle:nil] forCellReuseIdentifier:HTZMyDraftId];
    
    // 行高
    self.tableView.rowHeight = 125;
    self.tableView.backgroundColor = HTZGlobalBackgroundColor;
}
#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HTZMyDraftCell *cell = [tableView dequeueReusableCellWithIdentifier:HTZMyDraftId];
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
