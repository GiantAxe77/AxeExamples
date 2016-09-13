//
//  AXECollectionIconCell.m
//  collectionview轮播
//
//  Created by GiantAxe on 16/8/5.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "AXECollectionIconCell.h"

@interface AXECollectionIconCell ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation AXECollectionIconCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self addSubview:imageView];
        self.imageView = imageView;
    }
    return self;
}

- (void)setIconImg:(NSString *)iconImg
{
    _iconImg = iconImg;
    
    self.imageView.image = [UIImage imageNamed:iconImg];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
}

@end
