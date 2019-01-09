//
//  HTZOrderViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/29.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import "HTZOrderViewController.h"
#import "HTZOrderCategoryCell.h"
#import "HTZOrderCell.h"
#import "HTZOrderCategoryItem.h"
#import "HTZOrderItem.h"

#define HTZSelectedCategory self.categories[self.categoryTableView.indexPathForSelectedRow.row]
static NSString * const HTZCategoryId = @"category";
static NSString * const HTZOrderId = @"order";

@interface HTZOrderViewController ()
/** 左边的类别表格 */
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
/** 右边的订单表格 */
@property (weak, nonatomic) IBOutlet UITableView *orderTableView;
/** 请求工具对象 */
@property (nonatomic, strong) HTZNetworkTool *networkTool;
/** 左边的类别数据 */
@property (nonatomic, strong) NSArray *categories;
/** 请求参数 */
@property (nonatomic, strong) NSMutableDictionary *params;
@end

@implementation HTZOrderViewController

#pragma mark - 懒加载
- (HTZNetworkTool *)networkTool
{
    if (!_networkTool) {
        _networkTool = [HTZNetworkTool sharedNetworkTool];
    }
    return _networkTool;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //初始化子控件
    [self setupSubview];
    
    // 添加刷新控件
    [self setupRefresh];
    
    // 加载左侧的类别数据
    [self loadCategories];
}

#pragma mark - 初始化子控件
- (void)setupSubview
{
    // 注册
    [self.categoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([HTZOrderCategoryCell class]) bundle:nil] forCellReuseIdentifier:HTZCategoryId];
    [self.orderTableView registerNib:[UINib nibWithNibName:NSStringFromClass([HTZOrderCell class]) bundle:nil] forCellReuseIdentifier:HTZOrderId];
    
    // 设置inset
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.categoryTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.orderTableView.contentInset = self.categoryTableView.contentInset;
    self.orderTableView.rowHeight = 70;
}

#pragma mark - 添加刷新控件
- (void)setupRefresh
{
    self.orderTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewUsers)];
    
    self.orderTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];
}

#pragma mark - 加载左侧的类别数据
- (void)loadCategories
{
    // 显示指示器
    [HTZProgressHUD showDefaultHUD];
    
    // 发送请求
    NSString *urlString = [NSString stringWithFormat:@"%@%@",HTZDomainString,HTZOrderListInterface];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [self.networkTool postUrl:urlString params:params success:^(id responseObject) {
        
        // 隐藏指示器
        [HTZProgressHUD dismissHUD];
        
        // 服务器返回的JSON数据
        self.categories = [HTZOrderCategoryItem mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        // 刷新表格
        [self.categoryTableView reloadData];
        
        // 默认选中首行
        [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionTop];
        
        // 让用户表格进入下拉刷新状态
        [self.orderTableView.mj_header beginRefreshing];
        
    } failure:^(NSError *error) {
        // 显示失败信息
        [HTZProgressHUD showErrorHUDWithStatus:@"加载信息失败!"];
    }];
}

#pragma mark - 加载用户数据
- (void)loadNewUsers
{
    HTZOrderCategoryItem *item = HTZSelectedCategory;
    
    // 设置当前页码为1
    item.currentPage = 1;
    
    // 请求参数
    NSString *urlString = [NSString stringWithFormat:@"%@%@",HTZDomainString,HTZOrderListInterface];
    
    // 请求参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"category_id"] = @(item.id);
    params[@"page"] = @(item.currentPage);
    self.params = params;
    
    // 发送请求给服务器, 加载右侧的数据
    [self.networkTool postUrl:urlString params:params success:^(id responseObject) {
        // 字典数组 -> 模型数组
        NSArray *orders = [HTZOrderItem mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        // 清除所有旧数据
        [item.orders removeAllObjects];
        
        // 添加到当前类别对应的用户数组中
        [item.orders addObjectsFromArray:orders];
        
        // 保存总数
        item.total = [responseObject[@"total"] integerValue];
        
        // 不是最后一次请求
        if (self.params != params) return;
        
        // 刷新右边的表格
        [self.orderTableView reloadData];
        
        // 结束刷新
        [self.orderTableView.mj_header endRefreshing];
        
        // 让底部控件结束刷新
        [self checkFooterState];
    } failure:^(NSError *error) {
        if (self.params != params) return;
        
        // 提醒
        [HTZProgressHUD showErrorHUDWithStatus:@"加载数据失败"];
        
        // 结束刷新
        [self.orderTableView.mj_header endRefreshing];
    }];
    
}

- (void)loadMoreUsers
{
    HTZOrderCategoryItem *item = HTZSelectedCategory;
    
    // 发送请求给服务器, 加载右侧的数据
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"category_id"] = @(item.id);
    params[@"page"] = @(++item.currentPage);
    self.params = params;
    
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        // 字典数组 -> 模型数组
        NSArray *users = [XMGRecommendUser objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        // 添加到当前类别对应的用户数组中
        [category.users addObjectsFromArray:users];
        
        // 不是最后一次请求
        if (self.params != params) return;
        
        // 刷新右边的表格
        [self.userTableView reloadData];
        
        // 让底部控件结束刷新
        [self checkFooterState];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (self.params != params) return;
        
        // 提醒
        [SVProgressHUD showErrorWithStatus:@"加载用户数据失败"];
        
        // 让底部控件结束刷新
        [self.userTableView.footer endRefreshing];
    }];
}

/**
 * 时刻监测footer的状态
 */
- (void)checkFooterState
{
    XMGRecommendCategory *rc = XMGSelectedCategory;
    
    // 每次刷新右边数据时, 都控制footer显示或者隐藏
    self.userTableView.footer.hidden = (rc.users.count == 0);
    
    // 让底部控件结束刷新
    if (rc.users.count == rc.total) { // 全部数据已经加载完毕
        [self.userTableView.footer noticeNoMoreData];
    } else { // 还没有加载完毕
        [self.userTableView.footer endRefreshing];
    }
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 左边的类别表格
    if (tableView == self.categoryTableView) return self.categories.count;
    
    // 监测footer的状态
    [self checkFooterState];
    
    // 右边的用户表格
    return [XMGSelectedCategory users].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.categoryTableView) { // 左边的类别表格
        XMGRecommendCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:XMGCategoryId];
        cell.category = self.categories[indexPath.row];
        return cell;
    } else { // 右边的用户表格
        XMGRecommendUserCell *cell = [tableView dequeueReusableCellWithIdentifier:XMGUserId];
        cell.user = [XMGSelectedCategory users][indexPath.row];
        return cell;
    }
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 结束刷新
    [self.userTableView.header endRefreshing];
    [self.userTableView.footer endRefreshing];
    
    XMGRecommendCategory *c = self.categories[indexPath.row];
    if (c.users.count) {
        // 显示曾经的数据
        [self.userTableView reloadData];
    } else {
        // 赶紧刷新表格,目的是: 马上显示当前category的用户数据, 不让用户看见上一个category的残留数据
        [self.userTableView reloadData];
        
        // 进入下拉刷新状态
        [self.userTableView.header beginRefreshing];
    }
}

#pragma mark - 控制器的销毁
- (void)dealloc
{
    // 停止所有操作
    [self.manager.operationQueue cancelAllOperations];
}


@end
