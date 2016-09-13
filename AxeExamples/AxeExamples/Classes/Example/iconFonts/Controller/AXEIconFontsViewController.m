//
//  AXEIconFontsViewController.m
//  AxeExamples
//
//  Created by GiantAxe on 16/8/19.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "AXEIconFontsViewController.h"

#import "FontCodes.h"

@interface AXEIconFontsViewController ()

@end

@implementation AXEIconFontsViewController

//NSString *const iconFontsName = @"iconfonts";

//NSString *const fontName = @"\U0000E807";
//NSString *const fontName1 = @"\U0000E805";
//static NSString * const videoFont = @"\U0000E80A";

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setup];
    
    [self setupIconFonts];
}

- (void)setup
{
    self.navigationItem.title = @"iconFonts";
    self.view.backgroundColor = AXENormalColor;
}

- (void)setupIconFonts
{
//    UIButton *btn = [[UIButton alloc] init];
//    btn.frame = CGRectMake(199, 100, 100, 50);
//    btn.backgroundColor = [UIColor grayColor];
//    btn.titleLabel.font = [UIFont fontWithName:@"iconfonts" size:30];
//    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [btn setTitle:videoFont forState:UIControlStateNormal];
//    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
//    
//    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
//    
    
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont fontWithName:@"fontello" size:30];
    label.text = @"\U0000E805 \U0000F1D2 \U0000E801";
    label.center = self.view.center;
    [label sizeToFit];
    [self.view addSubview:label];
    
    // 打印已经注册过的字体类型
    for (NSString *family in [UIFont familyNames])
    {
        NSLog(@"family---%@", family);
        for (NSString *name in [UIFont fontNamesForFamilyName:family])
        {
            NSLog(@"  %@", name);
        } 
    }
    
}

- (void)btnClick
{
    AXELog(@"1");
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"clickToLabel";
    label.textColor = AXERandomColor;
}

@end
