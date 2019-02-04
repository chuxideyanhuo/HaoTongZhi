//
//  HTZMessageCenterViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/13.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZMessageCenterViewController.h"
#import "HTZMessageCell.h"
#import "HTZMessageItem.h"
#import "HTZMessageDetailViewController.h"

static NSString * const HTZMessageCenterId = @"messageCenter";
static CGFloat const HTZCellHeight = 110;
//static CGFloat const HTZSectionHeaderHeight = 100;

@interface HTZMessageCenterViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** 数据 */
@property (nonatomic, strong) NSMutableArray *messages;
@end

@implementation HTZMessageCenterViewController
#pragma mark - 控制器生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化子控件
    [self setupSubview];
    
    // 初始化数据
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
    self.navigationItem.title = @"消息中心";
    self.navigationController.navigationBar.translucent = NO;
    
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HTZMessageCell class]) bundle:nil] forCellReuseIdentifier:HTZMessageCenterId];
    
    // 背景色
    self.tableView.backgroundColor = HTZGlobalBackgroundColor;
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HTZMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:HTZMessageCenterId];
//    cell.item = self.messages[indexPath.row];
    cell.selectBlock = ^(HTZMessageItem *item) {
        
    };
    cell.deleteBlock = ^(HTZMessageItem *item) {
        
    };
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    HTZMessageDetailViewController *messageDetailVC = [[HTZMessageDetailViewController alloc] init];
    //messageDetailVC.item = self.messages[indexPath.row];
    [self.navigationController pushViewController:messageDetailVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HTZCellHeight;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return HTZSectionHeaderHeight;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *view = [[UIView alloc] init];
//    view.backgroundColor = [UIColor lightGrayColor];
//    return view;
//}

////区头跟随移动
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    CGFloat sectionHeaderHeight = HTZSectionHeaderHeight;
//    if (scrollView.contentOffset.y <= sectionHeaderHeight && scrollView.contentOffset.y>=0) {
//        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
//    } else if (scrollView.contentOffset.y >= sectionHeaderHeight) {
//        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
//    }
//}

#pragma mark - 懒加载
- (NSMutableArray *)messages
{
    if (!_messages) {
        _messages = [NSMutableArray array];
    }
    return _messages;
}
@end
