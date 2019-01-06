//
//  HTZMeViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/29.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import "HTZMeViewController.h"
#import "HTZMeCell.h"
#import "HTZMeItem.h"
#import "HTZMeTableViewHeader.h"

static NSString * const HTZMeId = @"me";
typedef enum : NSUInteger {
    HTZMeOptionTypeMyInformation = 0,
    HTZMeOptionTypeModifyPassword = 1,
    HTZMeOptionTypeInviteFriends = 2,
    HTZMeOptionTypeAdviceFeedback = 3,
    HTZMeOptionTypeSetting = 4,
} HTZMeOptionType;

@interface HTZMeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *options;
@end

@implementation HTZMeViewController

- (NSMutableArray *)options
{
    if (!_options) {
        _options = [NSMutableArray array];
    }
    return _options;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化数据
    [self setupData];
    
    //初始化子控件
    [self setupSubview];
}

#pragma mark - 初始化数据
- (void)setupData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"HTZMeData" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    self.options = [HTZMeItem mj_objectArrayWithKeyValuesArray:array];
}

#pragma mark - 初始化子控件
- (void)setupSubview
{
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HTZMeCell class]) bundle:nil] forCellReuseIdentifier:HTZMeId];
    
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
    HTZMeCell *cell = [tableView dequeueReusableCellWithIdentifier:HTZMeId];
    cell.item = self.options[indexPath.row];
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HTZMeItem *item = self.options[indexPath.row];
    
    switch ([item.type integerValue]) {
        case HTZMeOptionTypeMyInformation:
            [self jumpViewControllerWithClass:@"HTZPersonalInformationViewController"];
            break;
        case HTZMeOptionTypeModifyPassword:
            [self jumpViewControllerWithClass:@"HTZOriginalModifyPasswordViewController"];
            break;
        case HTZMeOptionTypeInviteFriends:
            [self jumpViewControllerWithClass:@"HTZInviteFriendsViewController"];
            break;
        case HTZMeOptionTypeAdviceFeedback:
            [self jumpViewControllerWithClass:@"HTZAdviceFeedbackViewController"];
            break;
        case HTZMeOptionTypeSetting:
            [self jumpViewControllerWithClass:@"HTZSettingViewController"];
            break;
    }
}

- (void)jumpViewControllerWithClass:(NSString *)class
{
    UIViewController *vc = [[NSClassFromString(class) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    HTZMeTableViewHeader *header = [[[NSBundle mainBundle] loadNibNamed:@"HTZMeTableViewHeader" owner:nil options:nil] firstObject];
    return header;
}


@end
