//
//  HTZHomeTableViewHeader.h
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/2/2.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HTZHomeTableViewHeaderItem;
typedef void (^MoreButtonClickBlock)(HTZHomeTableViewHeaderItem *item);

@interface HTZHomeTableViewHeader : UIView
/** 模型 */
@property (nonatomic, strong) HTZHomeTableViewHeaderItem *item;

/** 更多按钮点击Bolck */
@property (nonatomic, copy) MoreButtonClickBlock moreClickBlock;
@end
