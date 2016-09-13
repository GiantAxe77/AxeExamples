//
//  AXEParticleView.m
//  AxeExamples
//
//  Created by GiantAxe on 16/8/11.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "AXEParticleView.h"

@implementation AXEParticleView

- (void)initWithFrame:(CGRect)frame Image:(UIImage *)image maskViewImg:(UIImageView *)maskViewImgView maskViewFrame:(CGRect)maskViewFrame lifeTime:(CGFloat)lifeTime birthRate:(CGFloat)birthRate speed:(CGFloat)speed imgColor:(UIColor *)imgColor velocity:(CGFloat)velocity velocityRange:(CGFloat)velocityRange yAcceleration:(CGFloat)yAcceleration scale:(CGFloat)scale scaleRange:(CGFloat)scaleRange emissionRange:(CGFloat)emissionRange spinRange:(CGFloat)spinRange
{
    self.frame = frame;
    
    maskViewImgView.frame = maskViewFrame;
    self.maskView = maskViewImgView;
    
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.contents = (__bridge id)(image.CGImage);
    cell.lifetime = lifeTime;
    cell.birthRate = birthRate;
    cell.speed = speed;
    cell.color = imgColor.CGColor;
    cell.velocity = velocity;
    cell.velocityRange = velocityRange;
    cell.yAcceleration = yAcceleration;
    cell.scale = scale;
    cell.scaleRange = scaleRange;
    cell.emissionRange = emissionRange;
    cell.spinRange = spinRange;
    self.emitterLayer.emitterCells = @[cell];
    
    [self setup];
}



- (void)hide
{
    
}


- (void)setup
{
    self.emitterLayer.masksToBounds = YES;
    self.emitterLayer.emitterShape = kCAEmitterLayerLine;
    self.emitterLayer.emitterMode = kCAEmitterLayerSurface;
    self.emitterLayer.emitterSize = self.frame.size;
    self.emitterLayer.emitterPosition = CGPointMake(self.bounds.size.width / 2.f, -10);
}

@end
