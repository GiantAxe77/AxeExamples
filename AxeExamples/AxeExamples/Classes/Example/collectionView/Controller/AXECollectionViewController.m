//
//  AXECollectionViewController.m
//  collectionview轮播
//
//  Created by GiantAxe on 16/8/5.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "AXECollectionViewController.h"

//cell
#import "AXECollectionIconCell.h"

@interface AXECollectionViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation AXECollectionViewController

static NSString *AXECollectionIconCellID = @"AXECollectionIconCell";

- (UICollectionView *)collectionView
{
    if(!_collectionView)
    {
        //布局
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(128, 128);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        CGRect frame = CGRectMake(100, 100, 128, 128);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.pagingEnabled = YES;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.userInteractionEnabled = NO;
        [self.collectionView registerClass:[AXECollectionIconCell class] forCellWithReuseIdentifier:AXECollectionIconCellID];
        
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];

    [self collectionView];
    
    [self startTimer];
    
}

- (void)setup
{
    self.navigationItem.title = @"collectionView";
    self.view.backgroundColor = AXENormalColor;
}

- (void)startTimer
{
    self.timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(scrollToNext) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)scrollToNext
{
    UICollectionViewCell *currentCell = [self.collectionView visibleCells].firstObject;
    NSIndexPath *currentIndexPath = [self.collectionView indexPathForCell:currentCell];
    NSIndexPath *nextIndexPath = [NSIndexPath indexPathForItem:currentIndexPath.item + 1 inSection:currentIndexPath.section];
    [self.collectionView scrollToItemAtIndexPath:nextIndexPath atScrollPosition:kNilOptions animated:YES];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10000000;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AXECollectionIconCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:AXECollectionIconCellID forIndexPath:indexPath];

    cell.iconImg = [NSString stringWithFormat:@"bennet%zd", (indexPath.item % 10) + 1];

    return cell;
}

@end
