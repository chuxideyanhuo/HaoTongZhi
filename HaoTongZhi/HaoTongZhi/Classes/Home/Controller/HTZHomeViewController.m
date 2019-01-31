//
//  HTZHomeViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/29.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import "HTZHomeViewController.h"
#import "UIImage+HTZExtension.h"
#import "HTZPlaceOrderViewController.h"
#import "HTZMyDraftViewController.h"
#import "HTZMyTemplateViewController.h"
#import "HTZProductionPlanViewController.h"
#import "HTZMessageCenterViewController.h"
#import "HTZHomeOptionBarView.h"
#import "HTZHomeBannerView.h"
#import "HTZHomeTableView.h"
#import "HTZHomeOptionBarItem.h"

static NSString * const HTZHomeId = @"home";
static CGFloat const HTZOptionBarHeight = 90;
static CGFloat const HTZBannerHeight = 160;
static CGFloat const HTZCellHeight = 60;
static CGFloat const HTZSectionHeaderHeight = 30;
static NSInteger const HTZTableViewSections = 2;

/** ScrollView偏移类型 */
typedef enum : NSInteger {
    HTZHomeScrollViewOffsetTypeMin,
    HTZHomeScrollViewOffsetTypeCenter,
    HTZHomeScrollViewOffsetTypeMax,
} HTZHomeScrollViewOffsetType;

@interface HTZHomeViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
/** 背景ScrollView */
@property (nonatomic, strong) UIScrollView *bgScrollView;
/** 选项条 */
@property (nonatomic, strong) HTZHomeOptionBarView *optionBarView;
/** 轮播图 */
@property (nonatomic, strong) HTZHomeBannerView *bannerView;
/** 内容tableView */
@property (nonatomic, strong) HTZHomeTableView *tableView;
/** ScrollView偏移类型 */
@property (nonatomic, assign) HTZHomeScrollViewOffsetType sOffsetType;
/** TableView偏移类型 */
@property (nonatomic, assign) HTZHomeScrollViewOffsetType tOffsetType;


@end

@implementation HTZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubviews];
}

- (void)setupSubviews
{
//    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
//    redView.backgroundColor = [UIColor redColor];
//    [self.bgScrollView addSubview:redView];
//    // 设置inset
//    if (@available(iOS 11.0, *)) {
//        self.bgScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//
//        NSInteger type = [HTZSystemTool deviceType];
//        if (type == iPhoneX) {
//            self.bgScrollView.contentInset = UIEdgeInsetsMake(HTZIPhoneXNavigationBarHeight, 0, 0, 0);
//        }else{
//            self.bgScrollView.contentInset = UIEdgeInsetsMake(HTZNotIPhoneNavigationBarHeight, 0, 0, 0);
//        }
//    }else{
//        self.automaticallyAdjustsScrollViewInsets = NO;
//        self.bgScrollView.contentInset = UIEdgeInsetsMake(HTZNotIPhoneNavigationBarHeight, 0, 0, 0);
//    }
    self.navigationController.navigationBar.translucent = NO;
    
    //添加控件
    [self.view addSubview:self.bgScrollView];
    [self.bgScrollView addSubview:self.optionBarView];
    [self.bgScrollView addSubview:self.bannerView];
    [self.bgScrollView addSubview:self.tableView];
    
    //设置contentSize
    self.bgScrollView.contentSize = CGSizeMake(HTZSCREENW, HTZSCREENH + HTZOptionBarHeight + HTZBannerHeight);
    
    //注册TableViewCell
    [self.tableView registerClass:NSClassFromString(@"UITableViewCell") forCellReuseIdentifier:HTZHomeId];
    self.tableView.sectionFooterHeight = 0.01;
    
    __weak typeof(self)weakSelf = self;
    self.optionBarView.selectedOptionBlock = ^(HTZHomeOptionBarItem *item) {
        //跳转相应的控制器
        if ([item.type isEqualToString:@"HTZPlaceOrderViewController"]) {
            [weakSelf.navigationController pushViewController:[NSClassFromString(item.type) new] animated:YES];
        }else if ([item.type isEqualToString:@"HTZOrderViewController"]) {
            weakSelf.tabBarController.selectedIndex = 1;
        }else if ([item.type isEqualToString:@"HTZOrderViewController"]) {
            weakSelf.tabBarController.selectedIndex = 1;
        }else if ([item.type isEqualToString:@"HTZMessageCenterViewController"]) {
            [weakSelf.navigationController pushViewController:[NSClassFromString(item.type) new] animated:YES];
        }
    };
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
    
    [self.optionBarView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bgScrollView.mas_top).offset(0);
        make.left.mas_equalTo(self.bgScrollView.mas_left).offset(0);
        make.width.mas_equalTo(HTZSCREENW);
        make.height.mas_equalTo(HTZOptionBarHeight);
    }];

    [self.bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bgScrollView.mas_top).offset(HTZOptionBarHeight);
        make.left.mas_equalTo(self.bgScrollView.mas_left).offset(0);
        make.width.mas_equalTo(HTZSCREENW);
        make.height.mas_equalTo(HTZBannerHeight);
    }];
    
    CGFloat nH = self.navigationController.navigationBar.y + self.navigationController.navigationBar.height;
    CGFloat tH = self.tabBarController.tabBar.height;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bannerView.mas_bottom).offset(0);
        make.left.mas_equalTo(self.view.mas_left).offset(0);
        make.right.mas_equalTo(self.view.mas_right).offset(0);
        make.height.mas_equalTo(HTZSCREENH - nH - tH);
//        make.height.mas_equalTo(HTZSCREENH);
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.barTintColor = HTZMainColor;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:HTZMainColor] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return HTZTableViewSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger rows;
    if (section == 0) {
        rows = 1;
    }else{
        rows = 10;
    }
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    HTZProductionPlanCell *cell = [tableView dequeueReusableCellWithIdentifier:HTZProductionPlanId];
//    //    cell.item = self.options[indexPath.row];
//    return cell;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HTZHomeId];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.bgScrollView) {
//        HTZLog(@"0-----%@",NSStringFromCGPoint(scrollView.contentOffset));
//        HTZLog(@"%lf, %lf, %@, %lf, %lf", scrollView.contentOffset.y, HTZOptionBarHeight + HTZBannerHeight, NSStringFromCGSize(scrollView.contentSize), HTZSCREENH, scrollView.height);
        
        if (scrollView.contentOffset.y >= (HTZOptionBarHeight + HTZBannerHeight)) {
            self.sOffsetType = HTZHomeScrollViewOffsetTypeMax;
        } else if (scrollView.contentOffset.y <= 0) {
            self.sOffsetType = HTZHomeScrollViewOffsetTypeMin;
        } else {
            self.sOffsetType = HTZHomeScrollViewOffsetTypeCenter;
        }
        
        if (scrollView.contentOffset.y >= HTZOptionBarHeight) {
            CGFloat nH = self.navigationController.navigationBar.y + self.navigationController.navigationBar.height;
            [self.view addSubview:self.optionBarView];
            [self.optionBarView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.view.mas_top).offset(nH);
                make.left.mas_equalTo(self.view.mas_left).offset(0);
                make.width.mas_equalTo(HTZSCREENW);
                make.height.mas_equalTo(HTZOptionBarHeight);
            }];
        }else{
            [self.bgScrollView addSubview:self.optionBarView];
            [self.optionBarView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.bgScrollView.mas_top).offset(0);
                make.left.mas_equalTo(self.bgScrollView.mas_left).offset(0);
                make.width.mas_equalTo(HTZSCREENW);
                make.height.mas_equalTo(HTZOptionBarHeight);
            }];
        }
        
        
        if (self.tOffsetType == HTZHomeScrollViewOffsetTypeCenter) {
            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, HTZOptionBarHeight + HTZBannerHeight);
        }
    }else if (scrollView == self.tableView) {
//        HTZLog(@"1-----%@",NSStringFromCGPoint(scrollView.contentOffset));
//        HTZLog(@"%lf, %lf, %@, %lf, %lf", scrollView.contentOffset.y, HTZOptionBarHeight + HTZBannerHeight, NSStringFromCGSize(scrollView.contentSize), HTZSCREENH, scrollView.height);
        if (scrollView.contentOffset.y <= 0) {
            self.tOffsetType = HTZHomeScrollViewOffsetTypeMin;
        } else {
            self.tOffsetType = HTZHomeScrollViewOffsetTypeCenter;
        }
        
        if (self.sOffsetType == HTZHomeScrollViewOffsetTypeMin || self.sOffsetType == HTZHomeScrollViewOffsetTypeCenter) {
            scrollView.contentOffset = CGPointZero;
        }
    }
}

#pragma mark - 懒加载
- (UIScrollView *)bgScrollView
{
    if (!_bgScrollView) {
        _bgScrollView = [[UIScrollView alloc] init];
        _bgScrollView.backgroundColor = [UIColor clearColor];
        _bgScrollView.scrollsToTop = YES;
        _bgScrollView.delegate = self;
    }
    return _bgScrollView;
}

- (HTZHomeOptionBarView *)optionBarView
{
    if (!_optionBarView) {
        _optionBarView = [[HTZHomeOptionBarView alloc] init];
        _optionBarView.backgroundColor = HTZMainColor;
    }
    return _optionBarView;
}

- (HTZHomeBannerView *)bannerView
{
    if (!_bannerView) {
        _bannerView = [[HTZHomeBannerView alloc] init];
        _bannerView.backgroundColor = [UIColor whiteColor];
    }
    return _bannerView;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[HTZHomeTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.alwaysBounceVertical = YES;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.backgroundColor = [UIColor clearColor];
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
