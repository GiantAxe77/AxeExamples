//
//  UILabel+AXEVerticalAlign.m
//  AxeExamples
//
//  Created by GiantAxe on 16/9/7.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "UILabel+AXEVerticalAlign.h"

@implementation UILabel (AXEVerticalAlign)

- (void)alignTop
{
    CGSize fontSize = [self.text sizeWithAttributes:@{
                                                      NSFontAttributeName:self.font
                                                      }];
    double finalHeight = fontSize.height * self.numberOfLines;
    double finalWidth = self.frame.size.width;
    CGRect theStringRect = [self.text boundingRectWithSize:CGSizeMake(finalWidth, finalHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.font} context:nil];
    int newLinesToPad = (finalHeight - theStringRect.size.height) / fontSize.height;
    for (int i = 0; i < newLinesToPad; i++) {
        self.text = [self.text stringByAppendingString:@"\n "];
    
    }
    
}

- (void)alignBottom
{
    CGSize fontSize = [self.text sizeWithAttributes:@{
                                                      NSFontAttributeName:self.font
                                                      }];
    double finalHeight = fontSize.height * self.numberOfLines;
    double finalWidth = self.frame.size.width;
    CGRect theStringRect = [self.text boundingRectWithSize:CGSizeMake(finalWidth, finalHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.font} context:nil];
    int newLinesToPad = (finalHeight - theStringRect.size.height) / fontSize.height;
    for (int i = 0; i < newLinesToPad; i++) {
        self.text = [NSString stringWithFormat:@" \n%@", self.text];
    }
}

@end
