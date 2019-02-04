//
//  HTZMyDraftCell.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/21.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZMyDraftCell.h"

@interface HTZMyDraftCell ()
/** 部位 */
@property (weak, nonatomic) IBOutlet UILabel *regionContentLabel;
/** 方量 */
@property (weak, nonatomic) IBOutlet UILabel *capacityContentLabel;
/** 时间 */
@property (weak, nonatomic) IBOutlet UILabel *dateContentLabel;

@end

@implementation HTZMyDraftCell
#pragma mark - view生命周期
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark - 重写item的set方法
- (void)setItem:(HTZMyDraftItem *)item
{
    _item = item;
//    self.regionContentLabel.text = ;
//    self.capacityContentLabel.text = ;
//    self.dateContentLabel.text = ;
}

@end
