//
//  HTZProgressHUD.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/7.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZProgressHUD.h"

@implementation HTZProgressHUD

#pragma mark - 显示默认图的HUD
+ (void)showDefaultHUD
{
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
}

#pragma mark - 显示默认图文的HUD
+ (void)showDefaultHUDWithStatus:(NSString *)status
{
    [SVProgressHUD showWithStatus:status];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
}

#pragma mark - 显示自定义图文的HUD
+ (void)showHUDImage:(UIImage*)image status:(NSString*)status
{
    [SVProgressHUD showImage:image status:status];
}

#pragma mark - 只显示文字的HUD
+ (void)showTextHUDWithStatus:(NSString *)status
{
    [self setHUDFadeInAnimationDuration:0.5];
    [self showHUDImage:nil status:status];
    [self dismissHUDWithDelay:1.0];
}

#pragma mark - 销毁HUD
+ (void)dismissHUD
{
    [SVProgressHUD dismiss];
}

#pragma mark - 延迟销毁HUD
+ (void)dismissHUDWithDelay:(NSTimeInterval)delay
{
    [SVProgressHUD dismissWithDelay:delay];
}

#pragma mark - 设置HUD显示的动画时间
+ (void)setHUDFadeInAnimationDuration:(NSTimeInterval)delay
{
    [SVProgressHUD setFadeInAnimationDuration:delay];
}

#pragma mark - 设置HUD销毁的动画时间
+ (void)setHUDFadeOutAnimationDuration:(NSTimeInterval)delay
{
    [SVProgressHUD setFadeOutAnimationDuration:delay];
}
@end
