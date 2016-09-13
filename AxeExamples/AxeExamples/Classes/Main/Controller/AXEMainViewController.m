//
//  AXEMainViewController.m
//  AxeExamples
//
//  Created by GiantAxe on 16/8/6.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "AXEMainViewController.h"

//cell
#import "AXEMainVCCell.h"

//view
#import "AXEUpdateView.h"
#import "AXEBlackHUDView.h"

//controller
#import "AXEParticleViewController.h"
#import "AXEUMengSocialViewController.h"
#import "AXECollectionViewController.h"
#import "AXEPhotoViewController.h"
#import "AXEIconFontsViewController.h"
#import "AXEWKWebViewController.h"
#import "AXEScratchTicketViewController.h"

@interface AXEMainViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *titleArr;

@property (nonatomic, strong) AXEUpdateView *updateView;

@property (nonatomic, strong) AXEBlackHUDView *hudView;

@end

@implementation AXEMainViewController

static NSString * const AXEMainVCCellID = @"AXEMainVCCellID";

#pragma mark - lazy

- (UITableView *)tableView
{
    if(!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, AXE_SCREEN_WIDTH, AXE_SCREEN_HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:NSStringFromClass([AXEMainVCCell class]) bundle:nil] forCellReuseIdentifier:AXEMainVCCellID];
        
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (NSArray *)titleArr
{
    if(!_titleArr)
    {
        _titleArr = @[
                      @"particle effect",
                      @"lottery Scratch-off ticket",
                      @"collectionView",
                      @"cell slide-anim",
                      @"iconFonts",
                      @"UMengSocial",
                      @"take photo",
                      @"WKWebView"
                      ];
    }
    return _titleArr;
}

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setup];
    
    [self tableView];
    
    AXEWeakSelf;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        weakSelf.hudView = [[AXEBlackHUDView alloc] initWithFrame:CGRectZero];
        [weakSelf.view addSubview:weakSelf.hudView];
        
        weakSelf.updateView = [[AXEUpdateView alloc] initWithFrame:CGRectZero];
        weakSelf.updateView.center = weakSelf.view.center;
        [weakSelf.view addSubview:weakSelf.updateView];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [weakSelf.tableView.mj_header endRefreshing];
            [weakSelf.updateView removeFromSuperview];
            [weakSelf.hudView removeFromSuperview];
        });
    }];
    
//    [self.tableView.mj_header beginRefreshing];
    

}

#pragma mark - setup

- (void)setup
{
    self.navigationItem.title = @"Welcome To AXE";
    self.view.backgroundColor = AXENormalColor;
    //AXEColor(60, 116, 242)
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AXEMainVCCell *cell = [tableView dequeueReusableCellWithIdentifier:AXEMainVCCellID];
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setupCellWithTitleStr:self.titleArr[indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if(indexPath.row == 0)
    {
        AXEParticleViewController *vc = [[AXEParticleViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if(indexPath.row == 1)
    {
        AXEScratchTicketViewController *vc = [[AXEScratchTicketViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if(indexPath.row == 2)
    {
        AXECollectionViewController *vc = [[AXECollectionViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if(indexPath.row == 4)
    {
        AXEIconFontsViewController *vc = [[AXEIconFontsViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if(indexPath.row == 5)
    {
        AXEUMengSocialViewController *vc = [[AXEUMengSocialViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if(indexPath.row == 6)
    {
        AXEPhotoViewController *vc = [[AXEPhotoViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if(indexPath.row == 7)
    {
        AXEWKWebViewController *vc = [[AXEWKWebViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
