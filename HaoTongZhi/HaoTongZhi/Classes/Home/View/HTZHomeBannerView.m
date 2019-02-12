//
//  HTZHomeBannerView.m
//  HaoTongZhi
//
//  Created by liuzhiyong on 2019/1/29.
//  Copyright © 2019年 com.cscec.xbjs. All rights reserved.
//

#import "HTZHomeBannerView.h"
#import "HTZHomeBannerCell.h"
#import "HTZWeakTimerTarget.h"

static NSString * const HTZHomeBannerId = @"homeBanner";

@interface HTZHomeBannerView ()<UICollectionViewDataSource,UICollectionViewDelegate>
/** collectionView */
@property (nonatomic, strong) UICollectionView *collectionView;
/** 定时器 */
@property (nonatomic, strong) NSTimer *timer;
@end;

@implementation HTZHomeBannerView

#pragma mark - 初始化对象
//- (instancetype)initWithItems:(NSArray *)items
//{
//    if (self = [super initWithFrame:CGRectZero]) {
//        self.items = items;
//        [self setupSubviews];
//    }
//    return self;
//}



#pragma mark - view生命周期
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:CGRectZero]) {
        [self setupSubviews];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupSubviews];
}

- (void)dealloc
{
    [self removeTimer];
}

#pragma mark - 初始化子视图
- (void)setupSubviews
{
    self.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.collectionView];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        // 在主线程空闲时候执行block里面的代码
//        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.items.count inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
//
//        // 添加定时器，每隔2秒切换下一张图片
//        [self addTimer];
//    });
}

#pragma mark - 布局子控件
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
    return self.items.count * 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HTZHomeBannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HTZHomeBannerId forIndexPath:indexPath];
    cell.item = self.items[indexPath.item];
    
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    HTZHomeOptionBarItem *selectedItem = self.items[indexPath.item];
//    !self.selectedOptionBlock ? : self.selectedOptionBlock(selectedItem);
}

/**
 *  当用户开始拖拽时调用
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 移除定时器
    [self removeTimer];
}

/**
 *  当自动播放停止滚动动画时调用
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self scrollViewDidEndDecelerating:scrollView];
}

/**
 *  当滚动减速时调用
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 获得偏移量
    CGFloat offsetX = scrollView.contentOffset.x;
    // 计算当前显示的页号
    NSInteger page = offsetX / scrollView.bounds.size.width;
    
    if (page == 0) { // 滚动到第0张图片
        // 修改collectionView的偏移量
        page = self.items.count;
        self.collectionView.contentOffset = CGPointMake(page *self.collectionView.frame.size.width , 0);
    } else if (page == [self.collectionView numberOfItemsInSection:0] - 1) { // 滚动到最后一张了
        // 修改collectionView的偏移量
        page = self.items.count - 1;
        self.collectionView.contentOffset = CGPointMake(page *self.collectionView.frame.size.width , 0);
    }
    [self addTimer];
}

#pragma mark - 添加定时器方法
- (void)addTimer {
    // 创建定时器
    if (self.timer) return;
    self.timer = [HTZWeakTimerTarget scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

#pragma mark - 移除定时器
- (void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark - 定时器回调方法
- (void)nextImage
{
    // 获得偏移量
    CGFloat offsetX = self.collectionView.contentOffset.x;
    // 计算当前显示的页号
    NSInteger page = offsetX / self.collectionView.bounds.size.width;
    // 设置偏移量
    [self.collectionView setContentOffset:CGPointMake((page + 1) * self.collectionView.bounds.size.width , 0) animated:YES];
}



#pragma mark - 懒加载
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        // 流水布局:调整cell尺寸
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        // 设置item尺寸
        CGFloat itemW = HTZSCREENW;
        CGFloat itemH = 160;
        layout.itemSize = CGSizeMake(itemW, itemH);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        // 设置最小行间距
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        
        // 创建UICollectionView
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        // 设置数据源
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        // 设置分页
        _collectionView.pagingEnabled = YES;
        
        // 注册cell
        [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([HTZHomeBannerCell class]) bundle:nil] forCellWithReuseIdentifier:HTZHomeBannerId];
    }
    return _collectionView;
}

@end
