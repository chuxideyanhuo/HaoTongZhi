//
//  HTZHomeOptionBarCell.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/29.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZHomeOptionBarCell.h"
#import "HTZHomeOptionBarItem.h"

@interface HTZHomeOptionBarCell ()
@property (weak, nonatomic) IBOutlet UIButton *optionButton;
@property (weak, nonatomic) IBOutlet UILabel *badgeLabel;

@end

@implementation HTZHomeOptionBarCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.badgeLabel.layer.cornerRadius = HTZMargin;
    self.badgeLabel.layer.masksToBounds = YES;
}

- (void)setItem:(HTZHomeOptionBarItem *)item
{
    _item = item;
    [self.optionButton setTitle:item.name forState:UIControlStateNormal];
    
    [self.optionButton setImage:[UIImage imageNamed:item.imageName] forState:UIControlStateNormal];
    
    self.badgeLabel.text = item.badge;
}

@end
