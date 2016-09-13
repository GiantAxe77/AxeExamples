//
//  AXELeadCollectionViewCell.m
//  AxeExamples
//
//  Created by GiantAxe on 16/8/6.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "AXELeadCollectionViewCell.h"

@interface AXELeadCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *title;

@end

@implementation AXELeadCollectionViewCell

- (void)setLeadTitle:(NSString *)leadTitle
{
    _leadTitle = leadTitle;
    
    self.title.text = leadTitle;
}

- (void)awakeFromNib {
    // Initialization code
}

@end
