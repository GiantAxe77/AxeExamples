//
//  CBCustomAlertView.h
//  test
//
//  Created by 橘小佳77 on 16/8/31.
//  Copyright © 2016年 Ryokaa77. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBCustomAlertView : UIView

- (instancetype)initWithMessage:(NSString *)message buttonTextArr:(NSArray <NSString *> *)btnTextArr btnCallBlockArr:(NSArray *)btnCallBlockArr infoImageName:(NSString *)infoImageName;

- (void)show;


@end
