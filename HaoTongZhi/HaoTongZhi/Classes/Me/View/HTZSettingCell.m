//
//  HTZSettingCell.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/19.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZSettingCell.h"
#import "HTZSettingItem.h"

@interface HTZSettingCell ()
@property (weak, nonatomic) IBOutlet UILabel *optionLabel;

@end

@implementation HTZSettingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setItem:(HTZSettingItem *)item
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
