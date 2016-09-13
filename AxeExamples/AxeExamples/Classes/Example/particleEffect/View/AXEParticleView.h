//
//  AXEParticleView.h
//  AxeExamples
//
//  Created by GiantAxe on 16/8/11.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "AXEEmitterLayerView.h"

///  粒子view
@interface AXEParticleView : AXEEmitterLayerView

///  初始化粒子效果view
///
///  @param frame           粒子view的frame
///  @param image           粒子图片
///  @param maskViewImgView 背景view
///  @param maskViewFrame   背景view的frame
///  @param lifeTime        生命周期
///  @param birthRate       出生率
///  @param speed           速度
///  @param imgColor        粒子颜色
///  @param velocity        粒子速度
///  @param velocityRange   粒子速度范围
///  @param yAcceleration   粒子y方向的加速度分量
///  @param scale           粒子尺寸
///  @param scaleRange      粒子尺寸变化范围
///  @param emissionRange   每个发射的粒子的初始时候随机的角度
///  @param spinRange       粒子旋转角度
- (void)initWithFrame:(CGRect)frame Image:(UIImage *)image maskViewImg:(UIImageView *)maskViewImgView maskViewFrame:(CGRect)maskViewFrame lifeTime:(CGFloat)lifeTime birthRate:(CGFloat)birthRate speed:(CGFloat)speed imgColor:(UIColor *)imgColor velocity:(CGFloat)velocity velocityRange:(CGFloat)velocityRange yAcceleration:(CGFloat)yAcceleration scale:(CGFloat)scale scaleRange:(CGFloat)scaleRange emissionRange:(CGFloat)emissionRange spinRange:(CGFloat)spinRange;

@end
