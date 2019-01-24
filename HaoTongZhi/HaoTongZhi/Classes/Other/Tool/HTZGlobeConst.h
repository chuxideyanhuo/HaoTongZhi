//
//  HTZGlobeConst.h
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/29.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HTZNavigationController.h"
#import "UIView+HTZFrame.h"
#import "UIBarButtonItem+HTZExtension.h"
#import "UIColor+HTZHex.h"
#import "NSString+HTZExtension.h"
#import <Masonry.h>
#import <SVProgressHUD.h>
#import <MJRefresh.h>
#import <MJExtension.h>
#import <AFNetworking.h>
#import "HTZNetworkTool.h"
#import "HTZProgressHUD.h"
#import "HTZSystemTool.h"

/** 打印 */
#ifdef DEBUG
#define HTZLog(...) NSLog(__VA_ARGS__)
#else
#define HTZLog(...)
#endif

#define HTZLogFunc HTZLog(@"%s", __func__)

/** 颜色 */
#define HTZMainColor [UIColor colorWithHexString:@"0180CD"]
#define HTZGlobalBackgroundColor [UIColor colorWithHexString:@"F4F3F8"]
#define HTZBlackFontColor [UIColor colorWithHexString:@"303030"]
#define HTZActivityAreaBackgroundColor [UIColor colorWithHexString:@"FFFFFF"]
#define HTZBadgeColor [UIColor colorWithHexString:@"E70014"]
#define HTZRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

/** 屏幕宽高 */
#define HTZSCREENW [UIScreen mainScreen].bounds.size.width
#define HTZSCREENH [UIScreen mainScreen].bounds.size.height

/** 偏好设置对象 */
#define HTZUserDefaults [NSUserDefaults standardUserDefaults]

/** 通知对象 */
#define HTZNotificationCenter [NSNotificationCenter defaultCenter]

/** 域名 */
UIKIT_EXTERN NSString * const HTZDomainString;

/***************************************用户模块******************************************/
/** 登录接口 */
UIKIT_EXTERN NSString * const HTZUserLoginInterface;
/** 注册接口 */
UIKIT_EXTERN NSString * const HTZUserRegisterInterface;
/** 找回密码接口 */
UIKIT_EXTERN NSString * const HTZUserFindPasswordSecurityCodeInterface;
/** 找回密码-重置密码接口 */
UIKIT_EXTERN NSString * const HTZUserFindPasswordResetInterface;
/** 更新密码接口 */
UIKIT_EXTERN NSString * const HTZUserResetPasswordInterface;
/** 用户详情接口 */
UIKIT_EXTERN NSString * const HTZUserDetailInterface;

/***************************************订单模块******************************************/
/** 创建订单接口 */
UIKIT_EXTERN NSString * const HTZOrderCreateInterface;
/** 订单详情接口 */
UIKIT_EXTERN NSString * const HTZOrderDetailInterface;
/** 订单列表接口 */
UIKIT_EXTERN NSString * const HTZOrderListInterface;
/** 删除订单接口 */
UIKIT_EXTERN NSString * const HTZOrderDeleteInterface;

/***************************************物流模块******************************************/
/** 创建物流单接口 */
UIKIT_EXTERN NSString * const HTZExpressCreateInterface;
/** 物流单详情接口 */
UIKIT_EXTERN NSString * const HTZExpressDetailInterface;
/** 物流单信息同步接口 */
UIKIT_EXTERN NSString * const HTZExpressInformationSyncInterface;
/** 物流单状态变更接口 */
UIKIT_EXTERN NSString * const HTZExpressStateInterface;

/***************************************物流模块******************************************/
/** 订单评价接口 */
UIKIT_EXTERN NSString * const HTZCommentOrderInterface;
/** 物流评价接口 */
UIKIT_EXTERN NSString * const HTZCommentExpressInterface;
/** 客户评价接口 */
UIKIT_EXTERN NSString * const HTZCommentCustomerInterface;
/** 搅拌厂评价接口 */
UIKIT_EXTERN NSString * const HTZCommentMixPlantInterface;

/***************************************数据常量******************************************/
/** 边缘距离 */
UIKIT_EXTERN CGFloat const HTZMargin;
/** iPhoneX Tabbar的高度 */
UIKIT_EXTERN CGFloat const HTZIPhoneXTabbarHeight;
/** Layer边宽宽度 */
UIKIT_EXTERN CGFloat const HTZLayerBorderWidth;
/** Layer圆角 */
UIKIT_EXTERN CGFloat const HTZLayerCornerRadius;

/***************************************通知******************************************/
/** 修改TabBar子控制器 */
UIKIT_EXTERN NSString * const HTZModifyTabBarChildController;

/** 自动登录key */
UIKIT_EXTERN NSString * const HTZAutomaticLoginKey;

/** 角色key */
UIKIT_EXTERN NSString * const kHTZRole;

/** 客户角色key */
UIKIT_EXTERN NSString * const kHTZCustomerRole;
/** 搅拌厂角色key */
UIKIT_EXTERN NSString * const kHTZPlantRole;
/** 物流公司角色key */
UIKIT_EXTERN NSString * const kHTZExpressRole;
/** 司机角色key */
UIKIT_EXTERN NSString * const kHTZDriverRole;

/***************************************枚举******************************************/
/**
 * 用户角色枚举
 * HTZUserRoleTypeCustomer 客户
 * HTZUserRoleTypePlant 搅拌厂
 * HTZUserRoleTypeExpress 物流公司
 * HTZUserRoleTypeDriver 司机
 */
typedef enum : NSUInteger {
    HTZUserRoleTypeCustomer,
    HTZUserRoleTypePlant,
    HTZUserRoleTypeExpress,
    HTZUserRoleTypeDriver,
} HTZUserRoleType;
