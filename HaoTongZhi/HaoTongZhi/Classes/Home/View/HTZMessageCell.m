//
//  HTZMessageCell.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/22.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZMessageCell.h"

@interface HTZMessageCell ()
/** 选中 */
@property (weak, nonatomic) IBOutlet UIButton *selectButton;
/** 图标 */
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
/** 标题 */
@property (weak, nonatomic) IBOutlet UILabel *titleL;
/** 内容 */
@property (weak, nonatomic) IBOutlet UILabel *contentL;
/** 时间 */
@property (weak, nonatomic) IBOutlet UILabel *timeL;
@end

@implementation HTZMessageCell

#pragma mark - view生命周期
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark - 重写item的set方法
- (void)setItem:(HTZMessageItem *)item
{
    _item = item;
//    self.titleL.text = ;
//    self.contentL.text = ;
//    self.timeL.text = ;
}

#pragma mark - 选择按钮点击
- (IBAction)selectButtonClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    !self.selectBlock ? : self.selectBlock(self.item);
}

#pragma mark - 删除按钮点击
- (IBAction)deleteButtonClick:(UIButton *)sender
{
    !self.deleteBlock ? : self.deleteBlock(self.item);
}

@end
