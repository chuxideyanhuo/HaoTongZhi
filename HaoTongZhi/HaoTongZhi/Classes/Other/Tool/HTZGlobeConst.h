//
//  HTZGlobeConst.h
//  HaoTongZhi
//
//  Created by liuzhiyong on 2018/12/29.
//  Copyright © 2018年 com.cscec.xbjs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "UIView+HTZFrame.h"
#import "UIBarButtonItem+HTZExtension.h"
#import "UIColor+HTZHex.h"
#import "NSString+HTZExtension.h"
#import <Masonry/Masonry.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import <MJRefresh/MJRefresh.h>
#import <MJExtension/MJExtension.h>
#import <AFNetworking/AFNetworking.h>
#import "HTZNetworkTool.h"


#ifdef DEBUG
#define HTZLog(...) NSLog(__VA_ARGS__)
#else
#define HTZLog(...)
#endif

#define HTZLogFunc HTZLog(@"%s", __func__)

#define HTZRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

//#define HTZGlobalBg HTZRGBColor(223, 223, 223)

#define HTZMainColor [UIColor colorWithHexString:@"0180CD"]
#define HTZGlobalBackgroundColor [UIColor colorWithHexString:@"F4F3F8"]
#define HTZBlackFontColor [UIColor colorWithHexString:@"303030"]
#define HTZActivityAreaBackgroundColor [UIColor colorWithHexString:@"FFFFFF"]
#define HTZBadgeColor [UIColor colorWithHexString:@"E70014"]
