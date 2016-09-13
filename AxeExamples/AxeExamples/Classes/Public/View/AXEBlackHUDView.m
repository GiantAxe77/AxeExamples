//
//  AXEBlackHUDView.m
//  AxeExamples
//
//  Created by GiantAxe on 16/8/17.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "AXEBlackHUDView.h"

@implementation AXEBlackHUDView

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:CGRectMake(0, 0, AXE_SCREEN_WIDTH, AXE_SCREEN_HEIGHT)])
    {
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.7f;
    }
    return self;
}

@end
