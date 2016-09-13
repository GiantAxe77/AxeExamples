//
//  AXEBackToTopManager.m
//  AxeExamples
//
//  Created by GiantAxe on 16/9/12.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "AXEBackToTopManager.h"

@implementation AXEBackToTopManager

static UIWindow *topWindow;

+ (void)backToTopEnabled
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        topWindow = [[UIWindow alloc] init];
        topWindow.frame = [UIApplication sharedApplication].statusBarFrame;
        topWindow.backgroundColor = [UIColor clearColor];
        topWindow.windowLevel = UIWindowLevelAlert;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
        [[tap rac_gestureSignal] subscribeNext:^(id x) {
            
            UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
            [self searchAllScrollViews:keyWindow];
            
        }];
        [topWindow addGestureRecognizer:tap];
        topWindow.hidden = NO;

    });
}

+ (void)searchAllScrollViews:(UIView *)view
{
    for (UIView *subView in view.subviews)
    {
        // 递归遍历
        [self searchAllScrollViews:subView];
        if(![subView isKindOfClass:[UIScrollView class]])
        {
            return;
        }
        UIScrollView *scrollView = (UIScrollView *)subView;
        CGRect scrollViewRect = [scrollView convertRect:scrollView.frame toView:nil];
        CGRect keyWindowRect = view.bounds;
        if(!CGRectIntersectsRect(scrollViewRect, keyWindowRect))
        {
            return;
        }
        [scrollView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];

    }
}

+ (void)backToTopDisEnabled
{
    topWindow.hidden = YES;
}

@end
