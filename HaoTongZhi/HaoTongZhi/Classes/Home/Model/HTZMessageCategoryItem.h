//
//  HTZMessageCategoryItem.h
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/22.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTZMessageCategoryItem : NSObject
/** 名字 */
@property (nonatomic, copy) NSString *name;
/** 类型 */
@property (nonatomic, copy) NSString *type;
/** 这个类别对应的消息数据 */
@property (nonatomic, strong) NSMutableArray *messages;
@end
