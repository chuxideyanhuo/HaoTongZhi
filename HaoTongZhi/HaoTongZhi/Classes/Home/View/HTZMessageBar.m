//
//  HTZMessageBar.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/23.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZMessageBar.h"
#import "HTZMessageCategoryItem.h"
#import "HTZMessageCategoryCell.h"

static NSString * const HTZMessageCategoryId = @"messageCategory";

@interface HTZMessageBar ()<UICollectionViewDataSource,UICollectionViewDelegate>
/** 模型数组 */
@property (nonatomic, strong) NSArray *items;
/** collectionView */
@property (nonatomic, strong) UICollectionView *collectionView;
/** 操作 */
@property (nonatomic, strong) UIView *operationView;
/** 全选消息 */
@property (nonatomic, copy) UIButton *allSelectedButton;
/** 反选消息 */
@property (nonatomic, copy) UIButton *reverseSelectedButton;
/** 删除消息 */
@property (nonatomic, copy) UIButton *deleteSelectedButton;
/** 标记消息为已读 */
@property (nonatomic, copy) UIButton *markedReadButton;
@end


@implementation HTZMessageBar

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
    [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionTop];
    [self addSubview:self.collectionView];
    [self addSubview:self.operationView];
    [self.operationView addSubview:self.allSelectedButton];
    [self.operationView addSubview:self.reverseSelectedButton];
    [self.operationView addSubview:self.deleteSelectedButton];
    [self.operationView addSubview:self.markedReadButton];
}

#pragma mark - 布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(HTZMargin);
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
        make.height.mas_equalTo(40);
    }];
    
    [self.operationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.collectionView.mas_bottom).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(0);
        make.right.mas_equalTo(self.mas_right).offset(0);
        make.height.mas_equalTo(40);
    }];
    
    CGFloat buttonW = self.frame.size.width / 4;
    
    [self.allSelectedButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.operationView.mas_top).offset(0);
        make.left.mas_equalTo(self.operationView.mas_left).offset(0);
        make.bottom.mas_equalTo(self.operationView.mas_bottom).offset(0);
        make.width.mas_equalTo(buttonW);
    }];
    
    [self.reverseSelectedButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.operationView.mas_top).offset(0);
        make.left.mas_equalTo(self.allSelectedButton.mas_right).offset(0);
        make.bottom.mas_equalTo(self.operationView.mas_bottom).offset(0);
        make.width.mas_equalTo(buttonW);
    }];
    
    [self.deleteSelectedButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.operationView.mas_top).offset(0);
        make.left.mas_equalTo(self.reverseSelectedButton.mas_right).offset(0);
        make.bottom.mas_equalTo(self.operationView.mas_bottom).offset(0);
        make.width.mas_equalTo(buttonW);
    }];
    
    [self.markedReadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.operationView.mas_top).offset(0);
        make.left.mas_equalTo(self.deleteSelectedButton.mas_right).offset(0);
        make.bottom.mas_equalTo(self.operationView.mas_bottom).offset(0);
        make.width.mas_equalTo(buttonW);
    }];
}

#pragma mark - <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HTZMessageCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HTZMessageCategoryId forIndexPath:indexPath];
    cell.item = self.items[indexPath.item];
    
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    HTZMessageCategoryItem *selectedItem = self.items[indexPath.item];
    !self.selectedCategoryBlock ? : self.selectedCategoryBlock(selectedItem);
}

#pragma mark - 全选按钮点击
- (void)allSelectedButtonClick:(UIButton *)btn
{
    !self.allSelectedBlock ? : self.allSelectedBlock();
}

#pragma mark - 反选按钮点击
- (void)reverseSelectedButtonClick:(UIButton *)btn
{
    !self.reverseSelectedBlock ? : self.reverseSelectedBlock();
}

#pragma mark - 删除按钮点击
- (void)deleteSelectedButtonClick:(UIButton *)btn
{
    !self.deleteSelectedBlock ? : self.deleteSelectedBlock();
}

#pragma mark - 标记为已读按钮点击
- (void)markedReadButtonClick:(UIButton *)btn
{
    !self.markedReadBlock ? : self.markedReadBlock();
}

#pragma mark - 懒加载
- (NSArray *)items
{
    if (!_items) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"HTZMessageCategoryData" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        _items = [HTZMessageCategoryItem mj_objectArrayWithKeyValuesArray:array];
    }
    return _items;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        // 流水布局:调整cell尺寸
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        CGFloat itemW = (HTZSCREENW - 2 * HTZMargin) / self.items.count * 1.0;
        CGFloat itemH = 35;
        layout.itemSize = CGSizeMake(itemW, itemH);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.sectionInset = UIEdgeInsetsMake(0, HTZMargin, 0, HTZMargin);
        // 设置最小行间距
        layout.minimumLineSpacing = 0;
        
        // 创建UICollectionView:黑色
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.layer.borderWidth = HTZLayerBorderWidth;
        _collectionView.layer.borderColor = HTZGlobalBackgroundColor.CGColor;
        
        // 设置数据源
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        // 注册cell
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([HTZMessageCategoryCell class]) bundle:nil] forCellWithReuseIdentifier:HTZMessageCategoryId];
    }
    return _collectionView;
}

- (UIView *)operationView
{
    if (!_operationView) {
        _operationView = [[UIView alloc] init];
        _operationView.backgroundColor = [UIColor clearColor];
    }
    return _operationView;
}

- (UIButton *)allSelectedButton
{
    if (!_allSelectedButton) {
        _allSelectedButton = [[UIButton alloc] init];
        _allSelectedButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_allSelectedButton setTitle:@"全选" forState:UIControlStateNormal];
        [_allSelectedButton setTitleColor:HTZBlackFontColor forState:UIControlStateNormal];
        [_allSelectedButton setTitleColor:HTZMainColor forState:UIControlStateHighlighted];
        [_allSelectedButton addTarget:self action:@selector(allSelectedButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _allSelectedButton;
}

- (UIButton *)reverseSelectedButton
{
    if (!_reverseSelectedButton) {
        _reverseSelectedButton = [[UIButton alloc] init];
        _reverseSelectedButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_reverseSelectedButton setTitle:@"反选" forState:UIControlStateNormal];
        [_reverseSelectedButton setTitleColor:HTZBlackFontColor forState:UIControlStateNormal];
        [_reverseSelectedButton setTitleColor:HTZMainColor forState:UIControlStateHighlighted];
        [_reverseSelectedButton addTarget:self action:@selector(reverseSelectedButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _reverseSelectedButton;
}

- (UIButton *)deleteSelectedButton
{
    if (!_deleteSelectedButton) {
        _deleteSelectedButton = [[UIButton alloc] init];
        _deleteSelectedButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_deleteSelectedButton setTitle:@"删除" forState:UIControlStateNormal];
        [_deleteSelectedButton setTitleColor:HTZBlackFontColor forState:UIControlStateNormal];
        [_deleteSelectedButton setTitleColor:HTZMainColor forState:UIControlStateHighlighted];
        [_deleteSelectedButton addTarget:self action:@selector(deleteSelectedButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteSelectedButton;
}

- (UIButton *)markedReadButton
{
    if (!_markedReadButton) {
        _markedReadButton = [[UIButton alloc] init];
        _markedReadButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [_markedReadButton setTitle:@"标记为已读" forState:UIControlStateNormal];
        [_markedReadButton setTitleColor:HTZBlackFontColor forState:UIControlStateNormal];
        [_markedReadButton setTitleColor:HTZMainColor forState:UIControlStateHighlighted];
        [_markedReadButton addTarget:self action:@selector(markedReadButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _markedReadButton;
}

@end
