//
//  AXEEmitterLayerView.m
//  AxeExamples
//
//  Created by GiantAxe on 16/8/11.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "AXEEmitterLayerView.h"

@interface AXEEmitterLayerView ()

{
    CAEmitterLayer *_emitterLayer;
}

@end

@implementation AXEEmitterLayerView

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        _emitterLayer = (CAEmitterLayer *)self.layer;
    }
    return self;
}

///  替换子类view
+ (Class)layerClass
{
    return [CAEmitterLayer class];
}

///  set方法
- (void)setEmitterLayer:(CAEmitterLayer *)layer
{
    _emitterLayer = layer;
}

///  get方法
- (CAEmitterLayer *)emitterLayer
{
    return _emitterLayer;
}

- (void)show
{
    
}

- (void)hide
{
    
}

@end
