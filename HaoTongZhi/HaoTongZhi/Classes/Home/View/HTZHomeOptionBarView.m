//
//  HTZHomeOptionBarView.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/29.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZHomeOptionBarView.h"
#import "HTZHomeOptionBarCell.h"
#import "HTZHomeOptionBarItem.h"

static NSString * const HTZHomeOptionBarId = @"homeOptionBar";

@interface HTZHomeOptionBarView ()<UICollectionViewDataSource,UICollectionViewDelegate>
/** collectionView */
@property (nonatomic, strong) UICollectionView *collectionView;
/** 模型数组 */
@property (nonatomic, strong) NSArray *items;

@end

@implementation HTZHomeOptionBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupSubviews];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupSubviews];
}

#pragma mark - 初始化子视图
- (void)setupSubviews
{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.collectionView];
//    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([HTZHomeOptionBarCell class]) bundle:nil] forCellWithReuseIdentifier:HTZHomeOptionBarId];
    
}

#pragma mark - 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.bottom.mas_equalTo(self.mas_bottom).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
    }];
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HTZHomeOptionBarCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HTZHomeOptionBarId forIndexPath:indexPath];
    cell.item = self.items[indexPath.item];
    
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    HTZHomeOptionBarItem *selectedItem = self.items[indexPath.item];
    !self.selectedOptionBlock ? : self.selectedOptionBlock(selectedItem);
}

#pragma mark - 懒加载
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        // 流水布局:调整cell尺寸
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        CGFloat itemW = HTZSCREENW / self.items.count * 1.0;
        CGFloat itemH = 90;
        layout.itemSize = CGSizeMake(itemW, itemH);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        // 设置最小行间距
        layout.minimumLineSpacing = 0;
        
        // 创建UICollectionView
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        // 设置数据源
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        // 注册cell
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([HTZHomeOptionBarCell class]) bundle:nil] forCellWithReuseIdentifier:HTZHomeOptionBarId];
    }
    return _collectionView;
}

- (NSArray *)items
{
    if (!_items) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"HTZHomeData" ofType:@"plist"];
        NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
        NSDictionary *roleDict = dict[kHTZCustomerRole];
        _items = [HTZHomeOptionBarItem mj_objectArrayWithKeyValuesArray:roleDict[@"option"]];
    }
    return _items;
}
@end
