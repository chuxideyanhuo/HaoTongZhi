//
//  HTZInviteFriendsViewController.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/6.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZInviteFriendsViewController.h"

@interface HTZInviteFriendsViewController ()
/** 二维码 */
@property (weak, nonatomic) IBOutlet UIImageView *qrCodeImageView;

@end

@implementation HTZInviteFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"邀请好友";
    self.navigationController.navigationBar.translucent = NO;
}

@end
