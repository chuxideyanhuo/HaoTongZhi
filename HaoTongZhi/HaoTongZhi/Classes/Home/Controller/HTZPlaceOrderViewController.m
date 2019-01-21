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
#import "HTZPlaceOrderPreviewViewController.h"

@interface HTZPlaceOrderViewController ()
/** 厂站 */
@property (weak, nonatomic) IBOutlet HTZSelectView *stationView;
/** 合同编号 */
@property (weak, nonatomic) IBOutlet HTZSelectView *contractNoView;
/** 工程名称 */
@property (weak, nonatomic) IBOutlet HTZTextField *projectNameTextField;
/** 日期date */
/** 运距haulDistance */
@property (weak, nonatomic) IBOutlet HTZTextField *haulDistanceTextField;
/** 施工部位construction region */
@property (weak, nonatomic) IBOutlet HTZTextField *constructionSiteTextField;
/** 方量capacity */
@property (weak, nonatomic) IBOutlet HTZTextField *capacityTextField;
/** 标号cementGrade */
@property (weak, nonatomic) IBOutlet HTZSelectView *cementGradeView;
/** 泵送要求transportDemand */
@property (weak, nonatomic) IBOutlet HTZSelectView *transportDemandView;
/** 泵车类型pumperType */
@property (weak, nonatomic) IBOutlet HTZSelectView *pumperTypeView;
/** 泵浆数量cementMortarCount */
@property (weak, nonatomic) IBOutlet HTZTextField *cementMortarCountTextField;
/** 坍落度slump */
@property (weak, nonatomic) IBOutlet HTZSelectView *slumpView;
/** 抗滲等级imperviousLevel */
@property (weak, nonatomic) IBOutlet HTZSelectView *imperviousLevelView;
/** 抗冻等级antifreezeLevel */
@property (weak, nonatomic) IBOutlet HTZSelectView *antifreezeLevelView;
/** 抗折等级flexuralLevel */
@property (weak, nonatomic) IBOutlet HTZSelectView *flexuralLevelView;
/** 特殊要求 */
@property (weak, nonatomic) IBOutlet HTZSelectView *specialDemandView;
/** 提交 */
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
/** 取消 */
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;

@end

@implementation HTZPlaceOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航栏标题
    self.navigationItem.title = @"下单";
    
    // 设置导航栏右边的按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemRightWithTitle:@"选择模版下单" titleColor:[UIColor redColor] highTitle:@"选择模版下单" highTitleColor:HTZMainColor target:self action:@selector(selectTemplateOrder)];
    
    //
    self.cancelButton.layer.cornerRadius = HTZLayerCornerRadius;
    self.cancelButton.layer.borderWidth = HTZLayerBorderWidth;
    self.cancelButton.layer.borderColor = HTZMainColor.CGColor;
}

- (void)selectTemplateOrder
{
    HTZMyTemplateViewController *templateVC = [[HTZMyTemplateViewController alloc] init];
    [self.navigationController pushViewController:templateVC animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (IBAction)submitButtonClick:(UIButton *)sender
{
    HTZPlaceOrderPreviewViewController *previewVC = [[HTZPlaceOrderPreviewViewController alloc] init];
    [self.navigationController pushViewController:previewVC animated:YES];
}

- (IBAction)cancelButtonClick:(UIButton *)sender
{
    HTZLogFunc;
}

@end
