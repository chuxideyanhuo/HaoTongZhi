//
//  HTZMeCell.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/5.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZMeCell.h"
#import "HTZMeItem.h"

@interface HTZMeCell()
@property (weak, nonatomic) IBOutlet UILabel *optionLabel;

@end

@implementation HTZMeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setItem:(HTZMeItem *)item
{
    _item = item;
    self.optionLabel.text = item.title;
}

- (void)setFrame:(CGRect)frame
{
    frame.origin.x = HTZMargin;
    frame.size.width -= 2 * HTZMargin;
    
    [super setFrame:frame];
}

@end
