//
//  HTZMessageBar.h
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/23.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HTZMessageCategoryItem;
typedef void (^SelectedMessageCategoryBlock)(HTZMessageCategoryItem *item);
typedef void (^AllSelectedMessagesBlock)(void);
typedef void (^ReverseSelectedMessagesBlock)(void);
typedef void (^DeleteSelectedMessagesBlock)(void);
typedef void (^MarkedMessagesReadBlock)(void);

@interface HTZMessageBar : UIView
/** 选中消息类别Bolck */
@property (nonatomic, copy) SelectedMessageCategoryBlock selectedCategoryBlock;
/** 全选消息Bolck */
@property (nonatomic, copy) AllSelectedMessagesBlock allSelectedBlock;
/** 反选消息Bolck */
@property (nonatomic, copy) ReverseSelectedMessagesBlock reverseSelectedBlock;
/** 删除消息Bolck */
@property (nonatomic, copy) DeleteSelectedMessagesBlock deleteSelectedBlock;
/** 标记消息为已读Bolck */
@property (nonatomic, copy) MarkedMessagesReadBlock markedReadBlock;
@end
