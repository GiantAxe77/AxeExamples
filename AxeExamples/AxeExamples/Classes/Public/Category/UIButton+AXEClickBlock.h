//
//  UIButton+AXEClickBlock.h
//  AxeExamples
//
//  Created by GiantAxe on 16/8/9.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^clickBlock)();

@interface UIButton (AXEClickBlock)

- (void)handleWithBlock:(clickBlock)clickBlock;

@end
