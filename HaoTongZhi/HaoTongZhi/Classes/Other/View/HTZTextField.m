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
    self.layer.cornerRadius = 4.0;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 1;
}

@end
