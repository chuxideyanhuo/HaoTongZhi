//
//  HTZMessageDetailViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/13.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZMessageDetailViewController.h"

@interface HTZMessageDetailViewController ()
/** 标题 */
@property (weak, nonatomic) IBOutlet UILabel *titleL;
/** 内容 */
@property (weak, nonatomic) IBOutlet UILabel *contentL;

@end

@implementation HTZMessageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置导航栏标题
    self.navigationItem.title = @"消息详情";
}

- (void)setItem:(HTZMessageItem *)item
{
    _item = item;
//    self.titleL.text = ;
//    self.contentL.text = ;
}

@end
