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

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = HTZGlobalBackgroundColor;
}

- (void)setCategoryItem:(HTZOrderCategoryItem *)categoryItem
{
    _categoryItem = categoryItem;
    self.categoryNameLabel.text = categoryItem.name;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    self.categoryNameLabel.textColor = selected ? HTZMainColor : HTZBlackFontColor;
}

@end
