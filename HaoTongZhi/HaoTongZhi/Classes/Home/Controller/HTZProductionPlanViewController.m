//
//  HTZProductionPlanViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/19.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZProductionPlanViewController.h"
#import "HTZProductionPlanCell.h"
#import "HTZProductionPlanItem.h"

static NSString * const HTZProductionPlanId = @"productionPlan";
@interface HTZProductionPlanViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HTZProductionPlanViewController

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
    self.navigationItem.title = @"生产计划";
    
    // 设置导航栏右边的按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"home_production_plan_calendar" highImage:@"home_production_plan_calendar" target:self action:@selector(selectCalendar)];
    
    // 注册
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HTZProductionPlanCell class]) bundle:nil] forCellReuseIdentifier:HTZProductionPlanId];
    
    // 行高
    self.tableView.rowHeight = 230;
    self.tableView.backgroundColor = HTZGlobalBackgroundColor;
}
#pragma mark - 选择日期
- (void)selectCalendar
{
    
}

#pragma mark - <UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HTZProductionPlanCell *cell = [tableView dequeueReusableCellWithIdentifier:HTZProductionPlanId];
//    cell.item = self.options[indexPath.row];
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HTZLogFunc;
}

@end
