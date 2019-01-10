//
//  HTZOrderCell.h
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/8.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HTZOrderItem;

@interface HTZOrderCell : UITableViewCell
/** 类别模型 */
@property (nonatomic, strong) HTZOrderItem *orderItem;
@end
