//
//  UIImage+Extension.m
//  AxeExamples
//
//  Created by GiantAxe on 16/8/15.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "UIImage+Extension.h"


@implementation UIImage (Extension)

///  根据颜色返回一张纯色图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

@end
