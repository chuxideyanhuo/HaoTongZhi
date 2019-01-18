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

@interface HTZPlaceOrderViewController ()
/** 厂站 */
@property (weak, nonatomic) IBOutlet HTZSelectView *stationView;
/** 合同编号 */
@property (weak, nonatomic) IBOutlet HTZSelectView *contractNoView;
/** 工程名称 */
@property (weak, nonatomic) IBOutlet HTZTextField *projectNameTextField;
/** 日期 */
/** 运距 */
/** 施工部位 */
/** 方量 */
/** 标号 */
/** 泵送要求transportDemand */
/** 泵车类型pumperType */
/** 泵浆数量cementMortarCount */
/** 坍落度slump */
/** 抗滲等级imperviousLevel */
/** 抗冻等级antifreezeLevel */
/** 抗折等级flexuralLevel */
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

@end
