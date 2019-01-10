//
//  HTZAdviceFeedbackViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/6.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZAdviceFeedbackViewController.h"

@interface HTZAdviceFeedbackViewController ()
/** 问题描述 */
@property (weak, nonatomic) IBOutlet UITextView *issueTextView;
/** 手机 */
@property (weak, nonatomic) IBOutlet UITextField *mobileTextField;
@end

@implementation HTZAdviceFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"意见反馈";
    self.navigationController.navigationBar.translucent = NO;
}

- (IBAction)confirmSubmitButtonClick:(UIButton *)sender
{
    [HTZProgressHUD showTextHUDWithStatus:@"提交成功"];
//    [HTZProgressHUD showSuccessHUDWithStatus:@"提交成功"];
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
