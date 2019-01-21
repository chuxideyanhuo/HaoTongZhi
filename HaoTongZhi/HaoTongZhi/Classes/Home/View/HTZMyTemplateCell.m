//
//  HTZMyTemplateCell.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/13.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZMyTemplateCell.h"
#import "HTZMyTemplateItem.h"

@interface HTZMyTemplateCell()
/** 部位 */
@property (weak, nonatomic) IBOutlet UILabel *regionContentLabel;
/** 方量 */
@property (weak, nonatomic) IBOutlet UILabel *capacityContentLabel;
/** 时间 */
@property (weak, nonatomic) IBOutlet UILabel *dateContentLabel;

@end

@implementation HTZMyTemplateCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setItem:(HTZMyTemplateItem *)item
{
    _item = item;
//    self.regionContentLabel.text = ;
//    self.capacityContentLabel.text = ;
//    self.dateContentLabel.text = ;
}


@end
