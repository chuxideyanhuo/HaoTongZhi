//
//  HTZMessageDetailViewController.h
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/13.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZBaseViewController.h"

@class HTZMessageItem;
@interface HTZMessageDetailViewController : HTZBaseViewController
/** 模型 */
@property (nonatomic, strong) HTZMessageItem *item;
@end
