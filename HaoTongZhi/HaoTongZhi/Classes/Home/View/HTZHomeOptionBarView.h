//
//  HTZHomeOptionBarView.h
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/29.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HTZHomeOptionBarItem;
typedef void (^SelectedOptionBlock)(HTZHomeOptionBarItem *item);

@interface HTZHomeOptionBarView : UIView
/** 选中消息类别Bolck */
@property (nonatomic, copy) SelectedOptionBlock selectedOptionBlock;
@end
