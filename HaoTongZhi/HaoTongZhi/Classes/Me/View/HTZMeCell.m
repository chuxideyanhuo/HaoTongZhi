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
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *optionLabel;

@end

@implementation HTZMeCell
#pragma mark - view生命周期
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark - 重写item的set方法
- (void)setItem:(HTZMeItem *)item
{
    _item = item;
    self.imgView.image = [UIImage imageNamed:item.imageName];
    self.optionLabel.text = item.title;
}

#pragma mark - 重写frame的set方法
- (void)setFrame:(CGRect)frame
{
    frame.origin.x = HTZMargin;
    frame.size.width -= 2 * HTZMargin;
    
    [super setFrame:frame];
}

@end
