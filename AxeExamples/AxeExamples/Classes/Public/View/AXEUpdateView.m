//
//  AXEUpdateView.m
//  AxeExamples
//
//  Created by GiantAxe on 16/8/15.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "AXEUpdateView.h"

//view
#import "AXEParticleView.h"

@implementation AXEUpdateView

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:CGRectMake(0, 0, AXE_SCREEN_WIDTH / 2.f, AXE_SCREEN_HEIGHT / 2.f)])
    {
        [self setupParticleView];
        [self setupUpdateLabel];
    }
    return self;
}

- (void)setupParticleView
{
    AXEParticleView *particleView = [[AXEParticleView alloc] init];
    [particleView initWithFrame:CGRectMake(0, 0, self.width, self.height * 0.8) Image:[UIImage imageNamed:@"snow"] maskViewImg:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"alpha"]] maskViewFrame:CGRectMake(0, 0, self.width, self.height * 0.6) lifeTime:60.f birthRate:1.f speed:10.f imgColor:[UIColor whiteColor] velocity:10.f velocityRange:3.f yAcceleration:10.f scale:0.5f scaleRange:0.3f emissionRange:0.5 * M_PI spinRange:0.3 * M_PI];
//    particleView.backgroundColor = [UIColor redColor];
    [self addSubview:particleView];
}

- (void)setupUpdateLabel
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height * 0.1)];
//    label.backgroundColor = [UIColor yellowColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.center = self.center;
    label.text = @"update...";
    label.textColor = [UIColor whiteColor];
    [self addSubview:label];
}

@end
