//
//  HTZProgressHUD.h
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/7.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTZProgressHUD : NSObject

/** 显示默认图的HUD */
+ (void)showDefaultHUD;
/** 显示默认图文的HUD */
+ (void)showDefaultHUDWithStatus:(NSString *)status;
/** 显示自定义图文的HUD */
+ (void)showHUDImage:(UIImage*)image status:(NSString*)status;
/** 只显示文字的HUD */
+ (void)showTextHUDWithStatus:(NSString *)status;
/** 销毁HUD */
+ (void)dismissHUD;
/** 延迟销毁HUD */
+ (void)dismissHUDWithDelay:(NSTimeInterval)delay;
/** 设置HUD显示的动画时间 */
+ (void)setHUDFadeInAnimationDuration:(NSTimeInterval)delay;
/** 设置HUD销毁的动画时间 */
+ (void)setHUDFadeOutAnimationDuration:(NSTimeInterval)delay;
@end
