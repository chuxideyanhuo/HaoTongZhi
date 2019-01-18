//
//  HTZTextField.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/13.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZTextField.h"

@implementation HTZTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupLayer];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupLayer];
}

- (void)setupLayer
{
    self.layer.cornerRadius = HTZLayerCornerRadius;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = HTZLayerBorderWidth;
    
    CGFloat viewH = self.frame.size.height;
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HTZMargin * 0.5, 0)];
//    leftView.backgroundColor = [UIColor redColor];
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
    
//    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HTZMargin * 2, viewH)];
//    rightView.backgroundColor = HTZMainColor;
//    self.rightView = rightView;
//    self.rightViewMode = UITextFieldViewModeAlways;
}


@end
