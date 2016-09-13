//
//  UIView+Extension_Frame.h
//  AxeExamples
//
//  Created by GiantAxe on 16/4/1.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  简化控件frame设置的分类
 */
@interface UIView (Extension_Frame)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;


+ (instancetype)viewFromXib;

@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat left;

@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat right;

-(UIViewController*)viewController;


@end
