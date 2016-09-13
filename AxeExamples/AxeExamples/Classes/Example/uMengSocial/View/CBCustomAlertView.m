//
//  CustomAlertView.m
//  test
//
//  Created by 橘小佳77 on 16/8/30.
//  Copyright © 2016年 Ryokaa77. All rights reserved.
//

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS

#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height

#import "CBCustomAlertView.h"

#import <Masonry.h>

@interface CBCustomAlertView ()

/** 回调block数组 */
@property (strong,nonatomic) NSArray *btnCallBlockArr;

/** 按钮文字 */
@property (strong,nonatomic) NSArray<NSString *> *btnTextArr;

/** <#name#> */
@property (strong,nonatomic) UIView *baseView;

@end

@implementation CBCustomAlertView

- (instancetype)initWithMessage:(NSString *)message buttonTextArr:(NSArray <NSString *> *)btnTextArr btnCallBlockArr:(NSArray *)btnCallBlockArr infoImageName:(NSString *)infoImageName {
    
    if (self = [super init]) {
        
        self.btnCallBlockArr = btnCallBlockArr;
        self.frame = [UIApplication sharedApplication].keyWindow.bounds;
        
        UIView *whiteView = [[UIView alloc] init];
        [whiteView setBackgroundColor:[UIColor whiteColor]];
        whiteView.layer.masksToBounds = YES;
        whiteView.layer.cornerRadius = 7;
        [self addSubview:whiteView];
        [whiteView makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.width.equalTo(320);
            make.height.equalTo(233);
        }];
        
        
        //按钮
        for (int i = 0; i < btnTextArr.count; i++) {
        
            NSString *btnTitle = btnTextArr[i];
            UIButton *btn = [UIButton new];
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:17];
            btn.tag = i;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [btn setTitle:btnTitle forState:UIControlStateNormal];
            
            [whiteView addSubview:btn];
            
            // 分割线
            UIView *fengeView = [[UIView alloc] init];
            fengeView.backgroundColor = [self colorFromHexRGB:@"e5e5e5"];
            [whiteView addSubview:fengeView];
            
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                
                if(btn.tag == 0) {
                    make.bottom.equalTo(whiteView.mas_bottom);
                } else {
                    make.bottom.equalTo(self.baseView.mas_bottom);
                }
                
                make.left.right.equalTo(whiteView);
                make.height.equalTo(47);
            }];
            
            [fengeView makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(btn.mas_top);
                make.right.equalTo(self).offset(-20);
                make.left.equalTo(self).offset(20);
                make.height.equalTo(1);
            }];
            
            self.baseView = fengeView;
           
        }
        
        // 提示label
        UILabel *label = [[UILabel alloc] init];
        label.text = message;
        label.textColor = [self colorFromHexRGB:@"333333"];
        label.numberOfLines = 0;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont boldSystemFontOfSize:18.0];
        [label sizeToFit];
        [whiteView addSubview:label];
        
        CGFloat labelHeight = [self boundingRectHeightWithText:message font:[UIFont systemFontOfSize:18]];
        
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.baseView.mas_top).offset(-20);
            make.left.equalTo(whiteView.mas_left).offset(16);
            make.right.equalTo(whiteView.mas_right).offset(-16);
            make.height.mas_equalTo(labelHeight);
        }];
        
        // 叉号图片
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.contentMode = UIViewContentModeScaleAspectFill;
        imgView.image = [UIImage imageNamed:infoImageName];
        [whiteView addSubview:imgView];
        
        CGFloat h = (233 - 48 * btnTextArr.count- labelHeight - 20 - 43)/2.0;
        
        
        [imgView makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(43);
            make.centerX.equalTo(whiteView);
            make.top.equalTo(whiteView).offset(h);
            make.bottom.equalTo(label.mas_top).offset(-h);
        }];   
    }
    
    return self;
    
}

- (void)show {
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    [keyWindow addSubview:self];
}

- (void)btnClick:(UIButton *)btn {
    if (btn.tag > self.btnCallBlockArr.count - 1) {
        return;
    }

    void (^block)() = self.btnCallBlockArr[btn.tag];

    if (block) {
        block();
        [self removeFromSuperview];
    }
}


- (CGFloat)boundingRectHeightWithText:(NSString *)text font:(UIFont *)font {
    CGSize maximumSize = CGSizeMake(270, CGFLOAT_MAX);
    CGRect boundingRect = [text boundingRectWithSize:maximumSize
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:@{ NSFontAttributeName : font} context:nil];
    return boundingRect.size.height;
}

- (UIColor *) colorFromHexRGB:(NSString *) inColorString
{
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString)
    {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:1.0];
    return result;
}

+ (UIColor *) colorFromHexRGB:(NSString *) inColorString alpha:(CGFloat)colorAlpha {
    UIColor *result = nil;
    unsigned int colorCode = 0;
    unsigned char redByte, greenByte, blueByte;
    
    if (nil != inColorString)
    {
        NSScanner *scanner = [NSScanner scannerWithString:inColorString];
        (void) [scanner scanHexInt:&colorCode]; // ignore error
    }
    redByte = (unsigned char) (colorCode >> 16);
    greenByte = (unsigned char) (colorCode >> 8);
    blueByte = (unsigned char) (colorCode); // masks off high bits
    result = [UIColor
              colorWithRed: (float)redByte / 0xff
              green: (float)greenByte/ 0xff
              blue: (float)blueByte / 0xff
              alpha:colorAlpha];
    return result;
}



@end
