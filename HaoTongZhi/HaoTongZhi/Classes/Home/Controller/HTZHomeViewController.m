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

@interface HTZHomeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation HTZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    HTZProductionPlanCell *cell = [tableView dequeueReusableCellWithIdentifier:HTZProductionPlanId];
//    //    cell.item = self.options[indexPath.row];
//    return cell;
    return nil;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    HTZMyDraftViewController *myDraftVC = [[HTZMyDraftViewController alloc] init];
    [self.navigationController pushViewController:myDraftVC animated:YES];
    
//    HTZProductionPlanViewController *productionPlanVC = [[HTZProductionPlanViewController alloc] init];
//    [self.navigationController pushViewController:productionPlanVC animated:YES];
    
//    HTZPlaceOrderViewController *placeOrderVC = [[HTZPlaceOrderViewController alloc] init];
//    [self.navigationController pushViewController:placeOrderVC animated:YES];
}
@end
