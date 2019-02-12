//
//  HTZHomeBannerView.h
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/29.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HTZHomeBannerView : UIView
///**
// *  初始化方法
// *  @param items 图片模型数组
// *  @return 轮播器对象
// */
//- (instancetype)initWithItems:(NSArray *)items;

/** 模型数组 */
@property (nonatomic, strong) NSArray *items;
@end
