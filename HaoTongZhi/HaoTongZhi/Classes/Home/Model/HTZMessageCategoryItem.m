//
//  HTZMessageCategoryItem.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/22.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZMessageCategoryItem.h"

@implementation HTZMessageCategoryItem

- (NSMutableArray *)messages
{
    if (!_messages) {
        _messages = [NSMutableArray array];
    }
    return _messages;
}

@end
