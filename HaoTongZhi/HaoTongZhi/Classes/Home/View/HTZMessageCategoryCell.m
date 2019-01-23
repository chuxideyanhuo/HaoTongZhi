//
//  HTZMessageCategoryCell.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/23.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZMessageCategoryCell.h"
#import "HTZMessageCategoryItem.h"

@interface HTZMessageCategoryCell ()
/** 名字 */
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation HTZMessageCategoryCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // 高亮颜色
    self.nameLabel.highlightedTextColor = HTZMainColor;
}

- (void)setItem:(HTZMessageCategoryItem *)item
{
    _item = item;
    self.nameLabel.text = item.name;
}

@end
