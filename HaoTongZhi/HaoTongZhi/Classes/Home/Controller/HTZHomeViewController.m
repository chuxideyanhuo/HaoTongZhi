//
//  HTZHomeViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/29.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import "HTZHomeViewController.h"

@interface HTZHomeViewController ()

@end

@implementation HTZHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [HTZNetworkTool getUrl:@"" params:@{} success:^(id responseObj) {
        
    } failure:^(NSError *error) {
        
    }];
}
@end
