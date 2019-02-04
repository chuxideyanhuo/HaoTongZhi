//
//  HTZOrderCategoryItem.h
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/9.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTZOrderCategoryItem : NSObject
/** id */
@property (nonatomic, assign) NSInteger id;
/** 总数 */
@property (nonatomic, assign) NSInteger count;
/** 名字 */
@property (nonatomic, copy) NSString *name;

/** 这个类别对应的订单数据 */
@property (nonatomic, strong) NSMutableArray *orders;
/** 总数 */
@property (nonatomic, assign) NSInteger total;
/** 当前页码 */
@property (nonatomic, assign) NSInteger currentPage;
@end
