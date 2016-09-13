//
//  AXEMainNavigationController.m
//  AxeExamples
//
//  Created by GiantAxe on 16/8/6.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "AXEMainNavigationController.h"

@interface AXEMainNavigationController ()

@end

@implementation AXEMainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setup];
}

#pragma mark - setup

- (void)setup
{
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    

    [navigationBar setBackgroundImage:[UIImage imageWithColor:AXEColor(254, 197, 54) size:CGSizeMake(AXE_SCREEN_WIDTH, 64)] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    
    self.navigationBar.translucent = NO;
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if(self.childViewControllers.count >= 1)
    {
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [backBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [backBtn setImage:[UIImage imageNamed:@"title_back"] forState:UIControlStateNormal];
        [backBtn setImage:[UIImage imageNamed:@"title_back"] forState:UIControlStateHighlighted];
        [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        [backBtn sizeToFit];
        
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        viewController.navigationItem.leftBarButtonItem = backItem;
        
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

@end
