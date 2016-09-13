//
//  AXEParticleViewController.m
//  AxeExamples
//
//  Created by GiantAxe on 16/8/11.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "AXEParticleViewController.h"

//view
#import "AXEParticleView.h"
#import "AXEEmitterLayerView.h"

@interface AXEParticleViewController ()

@property (nonatomic, strong) AXEParticleView *particleView;

@end

@implementation AXEParticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化
    [self setup];

    // 粒子效果
    [self setupParticleView];

}

- (void)setup
{
    self.navigationItem.title = @"粒子效果";
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)setupParticleView
{
    AXEParticleView *particleView = [[AXEParticleView alloc] init];
    [particleView initWithFrame:CGRectMake(100, 100, 200, 200)
                          Image:[UIImage imageNamed:@"snow"]
                    maskViewImg:[[UIImageView alloc]
                                 initWithImage:[UIImage imageNamed:@"alpha"]]
                  maskViewFrame:CGRectMake(0, 0, 200, 200)
                       lifeTime:60.f
                      birthRate:1.f
                          speed:10.f
                       imgColor:[UIColor whiteColor]
                       velocity:10.f
                  velocityRange:3.f
                  yAcceleration:10.f
                          scale:0.5
                     scaleRange:0.3
                  emissionRange:0.5 * M_PI
                      spinRange:0.3 * M_PI];

    [self.view addSubview:particleView];
    self.particleView = particleView;
}

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    // 生成UIPreviewAction
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"one" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        NSLog(@"Action 1");
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"two" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        
        NSLog(@"Action 2");
    }];
    
    // 添加到数组里返回
    NSArray *actions = @[action1, action2];
    
    return actions;
}

@end
