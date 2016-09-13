//
//  AXEEmitterLayerView.h
//  AxeExamples
//
//  Created by GiantAxe on 16/8/11.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import <UIKit/UIKit.h>

///  粒子view父类
@interface AXEEmitterLayerView : UIView

- (void)setEmitterLayer:(CAEmitterLayer *)layer;

- (CAEmitterLayer *)emitterLayer;

- (void)show;

- (void)hide;

@end
