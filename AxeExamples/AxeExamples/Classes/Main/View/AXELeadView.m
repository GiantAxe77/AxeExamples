//
//  AXELeadView.m
//  AxeExamples
//
//  Created by GiantAxe on 16/8/6.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "AXELeadView.h"

//view
#import "AXELeadCollectionViewCell.h"

//controller
#import "AXEMainViewController.h"
#import "AXEMainNavigationController.h"

@interface AXELeadView () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UIButton *startBtn;

///  title label
@property (nonatomic, strong) NSArray *titleArr;

///  stay time for each label
@property (nonatomic, assign) CGFloat skipTime;

@end

@implementation AXELeadView

AXEDefineCellID(AXELeadCollectionViewCellID, @"AXELeadCollectionViewCell");

- (AXELeadView *)initWithFrame:(CGRect)frame skipTime:(CGFloat)skipTime titleArr:(NSArray *)titleArr
{
    AXELeadView *leadView = [[AXELeadView alloc] initWithFrame:frame];
    leadView.titleArr = titleArr;
    leadView.skipTime = skipTime;
    leadView.pageControl.numberOfPages = titleArr.count;
    leadView.pageControl.currentPage = 0;

    [leadView startTimer];
    
    return leadView;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self setupCollectionView];
        
        [self setupPageControl];
        
        [self setupStartBtn];
        
        [self setupMainLabel];
    }
    return self;
}

#pragma mark - setup

- (void)setupCollectionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumInteritemSpacing = AXE_SCREEN_HEIGHT;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.itemSize = CGSizeMake(self.frame.size.width, 50);
    flowLayout.sectionInset = UIEdgeInsetsMake(420, 0, 0, 0);
    
    CGRect frame = self.bounds;
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
    
    collectionView.backgroundColor = [UIColor clearColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.pagingEnabled = YES;
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([AXELeadCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:AXELeadCollectionViewCellID];
    
    self.collectionView = collectionView;
    [self addSubview:collectionView];
}

- (void)setupPageControl
{
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.width = 100;
    pageControl.height = 20;
    pageControl.centerX = self.centerX;
    pageControl.y = AXE_SCREEN_HEIGHT - 100;
    
    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    
    self.pageControl = pageControl;
    [self addSubview:pageControl];

}

- (void)setupStartBtn
{
    AXEWeakSelf;
    UIButton *startBtn = [[UIButton alloc] init];
    [startBtn setTitle:@"Go For Try" forState:UIControlStateNormal];
    [startBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    startBtn.width = AXE_SCREEN_WIDTH - 40;
    startBtn.height = 48;
    startBtn.y = AXE_SCREEN_HEIGHT - 70;
    startBtn.centerX = self.centerX;
    [startBtn.layer setCornerRadius:8.0];
    [startBtn.layer setMasksToBounds:YES];
    startBtn.titleLabel.font = AXEFont(21.0);
    startBtn.backgroundColor = AXEColor(86, 159, 40);
    [startBtn handleWithBlock:^{
        
        if(_jumpBlock)
        {
            _jumpBlock();
        }
        
    }];
    
    self.startBtn = startBtn;
    [self addSubview:startBtn];

}

- (void)setupMainLabel
{
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor whiteColor];
    label.text = @"AXE";
    label.font = AXEFont(45.0);
    [label sizeToFit];
    label.centerX = self.centerX;
    label.y = 200;
    [self addSubview:label];
}

- (void)goForTry
{
    AXEMainViewController *mainVC = [[AXEMainViewController alloc] init];
    AXEMainNavigationController *nav = [[AXEMainNavigationController alloc] initWithRootViewController:mainVC];
    self.window.rootViewController = nav;
}

- (void)startTimer
{
    self.timer = [NSTimer timerWithTimeInterval:self.skipTime target:self selector:@selector(move) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)move
{
    UICollectionViewCell *currentCell = [self.collectionView visibleCells].firstObject;
    NSIndexPath *currentIndexPath = [self.collectionView indexPathForCell:currentCell];
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:currentIndexPath.item + 1 inSection:currentIndexPath.section];
    
    [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:kNilOptions animated:YES];
}

- (void)dealloc
{
    [self removeTimer];
}

- (void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1000000;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AXELeadCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:AXELeadCollectionViewCellID forIndexPath:indexPath];
    NSInteger index = indexPath.item % self.titleArr.count;
    cell.leadTitle = self.titleArr[index];
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(100, 100, 100, 100);
//}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    
    //指示器下标
    CGFloat indexFloat = offsetX / scrollView.frame.size.width;
    
    //刚好等于整数
    if (indexFloat == (NSInteger)indexFloat)
    {
        self.pageControl.currentPage = ((NSInteger)indexFloat) % self.titleArr.count;
    }
    
    //不等于整数
    else
    {
        NSInteger minIndex = ((NSInteger)indexFloat);
        NSInteger maxIndex = ((NSInteger)indexFloat) + 1;

        if (ABS(indexFloat - minIndex) >= ABS(indexFloat - maxIndex))
        {
            self.pageControl.currentPage = maxIndex % self.titleArr.count;
        }
        
        else
        {
            self.pageControl.currentPage = minIndex % self.titleArr.count;
        }
    }

}

@end
