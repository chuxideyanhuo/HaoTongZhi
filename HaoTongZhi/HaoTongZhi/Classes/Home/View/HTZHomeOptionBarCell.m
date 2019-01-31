//
//  HTZHomeOptionBarCell.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/29.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZHomeOptionBarCell.h"
#import "HTZHomeOptionBarItem.h"
#import "HTZHomeVerticalButton.h"

@interface HTZHomeOptionBarCell ()
@property (weak, nonatomic) IBOutlet HTZHomeVerticalButton *optionButton;

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
    //注意不能直接使用titleLabel.frame.size.width,原因为有时候获取到0值
//    CGFloat labelWidth = self.optionButton.titleLabel.intrinsicContentSize.width;
//    CGFloat labelHeight = self.optionButton.titleLabel.intrinsicContentSize.height;
//    CGFloat imageWidth = self.optionButton.imageView.frame.size.width;
//    CGFloat imageHeight = self.optionButton.imageView.frame.size.height;
//    [self.optionButton setImageEdgeInsets:UIEdgeInsetsMake(0, labelWidth * 0.5, labelHeight, 0)];
//    [self.optionButton setTitleEdgeInsets:UIEdgeInsetsMake(imageHeight, 0, 0, imageWidth * 0.5)];
    self.badgeLabel.text = item.badge;
}

@end
