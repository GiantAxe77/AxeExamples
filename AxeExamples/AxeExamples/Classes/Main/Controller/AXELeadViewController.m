//
//  AXELeadViewController.m
//  AxeExamples
//
//  Created by GiantAxe on 16/8/6.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "AXELeadViewController.h"

//system
#import <MediaPlayer/MediaPlayer.h>

//view
#import "AXELeadView.h"

//controller
#import "AXEMainViewController.h"
#import "AXEMainNavigationController.h"

@interface AXELeadViewController ()

@property (nonatomic, strong) MPMoviePlayerController *moviePlayerVC;

@property (nonatomic, strong) AXELeadView *leadView;

@end

@implementation AXELeadViewController

#pragma mark - lazy

- (MPMoviePlayerController *)moviePlayerVC
{
    if(!_moviePlayerVC)
    {
        _moviePlayerVC = [[MPMoviePlayerController alloc] init];
        
        [_moviePlayerVC setShouldAutoplay:YES];
        [_moviePlayerVC setFullscreen:YES];
        [_moviePlayerVC setRepeatMode:MPMovieRepeatModeOne];
        _moviePlayerVC.movieSourceType = MPMovieSourceTypeFile;
        _moviePlayerVC.controlStyle = MPMovieControlStyleNone;
        _moviePlayerVC.view.frame = AXEScreenBounds;
        [self.view addSubview:_moviePlayerVC.view];
        
        [AXENC addObserver:self selector:@selector(playbackStateChanged) name:MPMoviePlayerLoadStateDidChangeNotification object:nil];
    }
    return _moviePlayerVC;
}

- (AXELeadView *)leadView
{
    AXEWeakSelf;
    if(!_leadView)
    {
        _leadView = [[AXELeadView alloc] initWithFrame:CGRectMake(0, 0, AXE_SCREEN_WIDTH, AXE_SCREEN_HEIGHT) skipTime:2.0 titleArr:@[@"Try everything", @"Try nothing", @"No try", @"No gain"]];
        
        _leadView.jumpBlock = ^{
            
            AXEMainViewController *mainVC = [[AXEMainViewController alloc] init];
            AXEMainNavigationController *nav = [[AXEMainNavigationController alloc] initWithRootViewController:mainVC];
            [weakSelf presentViewController:nav animated:YES completion:nil];
        };
        [self.moviePlayerVC.view addSubview:_leadView];
    }
    return _leadView;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *moviePath = [[NSBundle mainBundle] pathForResource:@"keep.mp4" ofType:nil];
    self.moviePlayerVC.contentURL = [[NSURL alloc] initFileURLWithPath:moviePath];
    
    [self.moviePlayerVC.view bringSubviewToFront:self.leadView];
    [self.moviePlayerVC play];

    
}

- (void)playbackStateChanged
{
    MPMoviePlaybackState playbackState = [self.moviePlayerVC playbackState];
    
    if(playbackState == MPMoviePlaybackStateStopped || playbackState == MPMoviePlaybackStatePaused)
    {
        [self.moviePlayerVC play];
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


@end
