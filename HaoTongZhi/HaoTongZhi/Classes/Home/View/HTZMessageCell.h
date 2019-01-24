//
//  HTZMessageCell.h
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/22.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HTZMessageItem;
typedef void (^SelectMessageBlock)(HTZMessageItem *item);
typedef void (^DeleteMessageBlock)(HTZMessageItem *item);

@interface HTZMessageCell : UITableViewCell
/** 模型 */
@property (nonatomic, strong) HTZMessageItem *item;
/** 选中消息block */
@property (nonatomic, strong) SelectMessageBlock selectBlock;
/** 删除消息block */
@property (nonatomic, strong) DeleteMessageBlock deleteBlock;
@end
