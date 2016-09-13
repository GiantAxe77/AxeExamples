//
//  UIButton+AXEClickBlock.m
//  AxeExamples
//
//  Created by GiantAxe on 16/8/9.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "UIButton+AXEClickBlock.h"
#import <objc/runtime.h>

@implementation UIButton (AXEClickBlock)

static const char clickBtnFlag;

- (void)handleWithBlock:(clickBlock)clickBlock
{
    if(clickBlock)
    {
        objc_setAssociatedObject(self, &clickBtnFlag, clickBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
    }
    [self addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
}

- (void)click
{
    clickBlock block = objc_getAssociatedObject(self, &clickBtnFlag);
    block();
}


@end
