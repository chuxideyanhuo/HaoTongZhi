//
//  HTZSettingViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/6.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZSettingViewController.h"
#import "HTZMeCell.h"
#import "HTZMeItem.h"
#import "HTZLoginViewController.h"

static NSString * const HTZSettingId = @"setting";
typedef enum : NSUInteger {
    HTZSettingOptionTypeClearCache = 0,
    HTZSettingOptionTypeVersionUpdate = 1,
    HTZSettingOptionTypeAboutUs = 2,
} HTZSettingOptionType;

@interface HTZSettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *options;

@end

@implementation HTZSettingViewController

- (NSMutableArray *)options
{
    if (!_options) {
        _options = [NSMutableArray array];
    }
    return _options;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    self.navigationController.navigationBar.translucent = NO;
    //初始化数据
    [self setupData];
    
    //初始化子控件
    [self setupSubview];
}

#pragma mark - 初始化数据
- (void)setupData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"HTZSettingData" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    self.options = [HTZMeItem mj_objectArrayWithKeyValuesArray:array];
}

#pragma mark - 初始化子控件
- (void)setupSubview
{
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HTZMeCell class]) bundle:nil] forCellReuseIdentifier:HTZSettingId];
    
    // 设置代理
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // 设置inset
    //    self.automaticallyAdjustsScrollViewInsets = NO;
    //    self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.tableView.rowHeight = 50;
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.options.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HTZMeCell *cell = [tableView dequeueReusableCellWithIdentifier:HTZSettingId];
    cell.item = self.options[indexPath.row];
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HTZMeItem *item = self.options[indexPath.row];
    
    switch ([item.type integerValue]) {
        case HTZSettingOptionTypeClearCache:
//            [self jumpViewControllerWithClass:@""];
            [self clearCache];
            break;
        case HTZSettingOptionTypeVersionUpdate:
//            [self jumpViewControllerWithClass:@""];
            [self versionUpdate];
            break;
        case HTZSettingOptionTypeAboutUs:
            [self jumpViewControllerWithClass:@"HTZAboutUsViewController"];
            break;
    }
}

#pragma mark - 清除缓存
- (void)clearCache
{
    
}

#pragma mark - 版本更新
- (void)versionUpdate
{
    
}

#pragma mark - 跳转控制器
- (void)jumpViewControllerWithClass:(NSString *)class
{
    UIViewController *vc = [[NSClassFromString(class) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 退出登录
- (IBAction)exitLoginButtonClick:(UIButton *)sender
{
    HTZLoginViewController *loginVC = [[HTZLoginViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:^{
        self.tabBarController.selectedIndex = 0;
        [self.navigationController popToRootViewControllerAnimated:NO];
    }];
}

@end
