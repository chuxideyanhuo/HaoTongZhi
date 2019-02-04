//
//  HTZOrderCategoryCell.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/8.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZOrderCategoryCell.h"
#import "HTZOrderCategoryItem.h"

@interface HTZOrderCategoryCell()
@property (weak, nonatomic) IBOutlet UILabel *categoryNameLabel;

@end

@implementation HTZOrderCategoryCell
#pragma mark - view生命周期
- (void)awakeFromNib
{
    [super awakeFromNib];
    self.backgroundColor = HTZGlobalBackgroundColor;
}

#pragma mark - 重写item的set方法
- (void)setCategoryItem:(HTZOrderCategoryItem *)categoryItem
{
    _categoryItem = categoryItem;
    self.categoryNameLabel.text = categoryItem.name;
}

#pragma mark - cell选中调用
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    self.categoryNameLabel.textColor = selected ? HTZMainColor : HTZBlackFontColor;
}

@end
