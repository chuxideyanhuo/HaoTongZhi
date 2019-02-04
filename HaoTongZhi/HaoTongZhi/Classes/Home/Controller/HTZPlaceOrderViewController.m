//
//  HTZPlaceOrderViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/11.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZPlaceOrderViewController.h"
#import "HTZMyTemplateViewController.h"
#import "HTZSelectView.h"
#import "HTZTextField.h"
#import "HTZLeftIntervalLabel.h"
#import "HTZPlaceOrderPreviewViewController.h"

@interface HTZPlaceOrderViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
/** 厂站 */
@property (weak, nonatomic) IBOutlet HTZSelectView *stationView;
/** 合同编号 */
@property (weak, nonatomic) IBOutlet HTZSelectView *contractNoView;
/** 工程名称 */
@property (weak, nonatomic) IBOutlet HTZTextField *projectNameTextField;
/** 日期 */
@property (weak, nonatomic) IBOutlet HTZLeftIntervalLabel *dateLabel;
/** 运距 */
@property (weak, nonatomic) IBOutlet HTZTextField *haulDistanceTextField;
/** 施工部位 */
@property (weak, nonatomic) IBOutlet HTZTextField *constructionSiteTextField;
/** 方量 */
@property (weak, nonatomic) IBOutlet HTZTextField *capacityTextField;
/** 标号 */
@property (weak, nonatomic) IBOutlet HTZSelectView *cementGradeView;
/** 泵送要求 */
@property (weak, nonatomic) IBOutlet HTZSelectView *transportDemandView;
/** 泵车类型 */
@property (weak, nonatomic) IBOutlet HTZSelectView *pumperTypeView;
/** 泵浆数量 */
@property (weak, nonatomic) IBOutlet HTZTextField *cementMortarCountTextField;
/** 坍落度 */
@property (weak, nonatomic) IBOutlet HTZSelectView *slumpView;
/** 抗滲等级 */
@property (weak, nonatomic) IBOutlet HTZSelectView *imperviousLevelView;
/** 抗冻等级 */
@property (weak, nonatomic) IBOutlet HTZSelectView *antifreezeLevelView;
/** 抗折等级 */
@property (weak, nonatomic) IBOutlet HTZSelectView *flexuralLevelView;
/** 特殊要求 */
@property (weak, nonatomic) IBOutlet HTZSelectView *specialDemandView;
/** 提交 */
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
/** 取消 */
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@end

@implementation HTZPlaceOrderViewController
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
    self.navigationItem.title = @"下单";
    
    // 设置导航栏右边的按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"选择模版下单" titleColor:[UIColor redColor] highTitle:@"选择模版下单" highTitleColor:HTZMainColor target:self action:@selector(selectTemplateOrder)];
    
    // scrollView添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewClick)];
    [self.scrollView addGestureRecognizer:tap];
    self.scrollView.delegate = self;
    
    // 日期控件
    self.dateLabel.layer.cornerRadius = HTZLayerCornerRadius;
    self.dateLabel.layer.borderWidth = HTZLayerBorderWidth;
    self.dateLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    // 取消按钮
    self.cancelButton.layer.cornerRadius = HTZLayerCornerRadius;
    self.cancelButton.layer.borderWidth = HTZLayerBorderWidth;
    self.cancelButton.layer.borderColor = HTZMainColor.CGColor;
}

#pragma mark - 选择订单模版
- (void)selectTemplateOrder
{
    HTZMyTemplateViewController *templateVC = [[HTZMyTemplateViewController alloc] init];
    [self.navigationController pushViewController:templateVC animated:YES];
}

#pragma mark - crollView点击
- (void)scrollViewClick
{
    // 取消第一响应者
    [self.view endEditing:YES];
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self scrollViewClick];
}

#pragma mark - 提交按钮点击
- (IBAction)submitButtonClick:(UIButton *)sender
{
    HTZPlaceOrderPreviewViewController *previewVC = [[HTZPlaceOrderPreviewViewController alloc] init];
    [self.navigationController pushViewController:previewVC animated:YES];
}

#pragma mark - 取消按钮点击
- (IBAction)cancelButtonClick:(UIButton *)sender
{
    HTZLogFunc;
}

@end
