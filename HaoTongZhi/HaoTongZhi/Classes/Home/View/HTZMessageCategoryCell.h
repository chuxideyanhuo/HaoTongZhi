//
//  HTZMessageCategoryCell.h
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/23.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HTZMessageCategoryItem;

@interface HTZMessageCategoryCell : UICollectionViewCell
/** 模型数据 */
@property (nonatomic, strong) HTZMessageCategoryItem *item;
@end
