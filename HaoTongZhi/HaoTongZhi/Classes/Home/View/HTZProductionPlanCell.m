//
//  HTZProductionPlanCell.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/19.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZProductionPlanCell.h"

@interface HTZProductionPlanCell ()
/** 工程名称 */
@property (weak, nonatomic) IBOutlet UILabel *projectNameLabel;
/** 部位 */
@property (weak, nonatomic) IBOutlet UILabel *regiontLabel;
/** 标号 */
@property (weak, nonatomic) IBOutlet UILabel *cementGradeLabel;
/** 方式 */
@property (weak, nonatomic) IBOutlet UILabel *wayLabel;
/** 方量 */
@property (weak, nonatomic) IBOutlet UILabel *capacityLabel;
/** 日期 */
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation HTZProductionPlanCell
#pragma mark - view生命周期
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark - 重写item的set方法
- (void)setItem:(HTZProductionPlanItem *)item
{
    _item = item;
//    self.projectNameLabel.text = ;
//    self.regiontLabel.text = ;
//    self.cementGradeLabel.text = ;
//    self.wayLabel.text = ;
//    self.capacityLabel.text = ;
//    self.dateLabel.text = ;
}

@end
