//
//  UIViewController+Swizzling.m
//  AxeExamples
//
//  Created by GiantAxe on 16/4/1.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "UIViewController+Swizzling.h"

@implementation UIViewController (Swizzling)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#ifdef DEBUG
        [self swizzleSelector:@selector(viewWillAppear:) withSelector:@selector(logWhenViewWillAppear:)];
#endif
    });
}

+ (void)swizzleSelector:(SEL)originalSelector withSelector:(SEL)swizzledSelector
{
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

#pragma mark - Method Swizzling

- (void)logWhenViewWillAppear:(BOOL)animated {
    [self logWhenViewWillAppear:animated];
    
    NSString *className = NSStringFromClass([self class]);
    
    if ([className hasPrefix:@"UI"]) {
        return;
    }
    
    NSLog(@"%@", [NSString stringWithFormat:@"%@ will appear.", className]);
}

@end
