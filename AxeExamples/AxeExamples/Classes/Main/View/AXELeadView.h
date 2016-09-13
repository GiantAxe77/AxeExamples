//
//  AXELeadView.h
//  AxeExamples
//
//  Created by GiantAxe on 16/8/6.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^jumpMainVCBlock)();

@interface AXELeadView : UIView

- (AXELeadView *)initWithFrame:(CGRect)frame skipTime:(CGFloat)skipTime titleArr:(NSArray *)titleArr;

@property (nonatomic, copy) jumpMainVCBlock jumpBlock;

@end
