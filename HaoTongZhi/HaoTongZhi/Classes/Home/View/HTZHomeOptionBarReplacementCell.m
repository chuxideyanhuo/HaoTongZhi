//
//  HTZHomeOptionBarReplacementCell.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/2/2.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZHomeOptionBarReplacementCell.h"
#import "HTZHomeOptionBarItem.h"

@interface HTZHomeOptionBarReplacementCell ()
@property (weak, nonatomic) IBOutlet UIButton *optionButton;
@end

@implementation HTZHomeOptionBarReplacementCell
#pragma mark - view生命周期
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark - 重写item的set方法
- (void)setItem:(HTZHomeOptionBarItem *)item
{
    _item = item;
    [self.optionButton setTitle:item.name forState:UIControlStateNormal];
}

@end
