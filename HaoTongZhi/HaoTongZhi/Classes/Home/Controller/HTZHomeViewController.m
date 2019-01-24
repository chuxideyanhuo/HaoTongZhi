//
//  HTZHomeViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/29.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import "HTZHomeViewController.h"
#import "HTZPlaceOrderViewController.h"
#import "HTZMyDraftViewController.h"
#import "HTZMyTemplateViewController.h"
#import "HTZProductionPlanViewController.h"
#import "HTZMessageCenterViewController.h"

static NSString * const HTZHomeId = @"home";
static CGFloat const HTZCellHeight = 110;
static CGFloat const HTZSectionHeaderHeight = 100;

@interface HTZHomeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UIScrollView *bgScrollView;

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation HTZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubviews];
}

- (void)setupSubviews
{
    [self.view addSubview:self.bgScrollView];
    
//    [self.bgScrollView addSubview:self.tableView];
    [self.tableView registerClass:NSClassFromString(@"UITableViewCell") forCellReuseIdentifier:HTZHomeId];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.bgScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top).offset(0);
        make.left.mas_equalTo(self.view.mas_left).offset(0);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(0);
        make.right.mas_equalTo(self.view.mas_right).offset(0);
    }];
    
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.view.mas_top).offset(0);
//        make.left.mas_equalTo(self.view.mas_left).offset(0);
//        make.bottom.mas_equalTo(self.view.mas_bottom).offset(0);
//        make.right.mas_equalTo(self.view.mas_right).offset(0);
//    }];
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

#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    HTZProductionPlanCell *cell = [tableView dequeueReusableCellWithIdentifier:HTZProductionPlanId];
//    //    cell.item = self.options[indexPath.row];
//    return cell;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HTZHomeId];
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//    HTZMessageDetailViewController *messageDetailVC = [[HTZMessageDetailViewController alloc] init];
//    //messageDetailVC.item = self.messages[indexPath.row];
//    [self.navigationController pushViewController:messageDetailVC animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HTZCellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return HTZSectionHeaderHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor lightGrayColor];
    return view;
}

#pragma mark - 懒加载
- (UIScrollView *)bgScrollView
{
    if (!_bgScrollView) {
        _bgScrollView = [[UIScrollView alloc] init];
        _bgScrollView.backgroundColor = [UIColor blueColor];
    }
    return _bgScrollView;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.backgroundColor = [UIColor redColor];
        _tableView.delegate   = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    HTZMessageCenterViewController *messageCenterVC = [[HTZMessageCenterViewController alloc] init];
    [self.navigationController pushViewController:messageCenterVC animated:YES];
    
//    HTZMyDraftViewController *myDraftVC = [[HTZMyDraftViewController alloc] init];
//    [self.navigationController pushViewController:myDraftVC animated:YES];
    
//    HTZProductionPlanViewController *productionPlanVC = [[HTZProductionPlanViewController alloc] init];
//    [self.navigationController pushViewController:productionPlanVC animated:YES];
    
//    HTZPlaceOrderViewController *placeOrderVC = [[HTZPlaceOrderViewController alloc] init];
//    [self.navigationController pushViewController:placeOrderVC animated:YES];
}


@end
