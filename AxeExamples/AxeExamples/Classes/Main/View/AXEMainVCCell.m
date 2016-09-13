//
//  AXEMainVCCell.m
//  AxeExamples
//
//  Created by GiantAxe on 16/8/10.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "AXEMainVCCell.h"

@interface AXEMainVCCell ()

///  title label
@property (weak, nonatomic) IBOutlet UILabel *title;

@end

@implementation AXEMainVCCell

- (void)setupCellWithTitleStr:(NSString *)titleStr
{
    self.title.textColor = AXEColor(60, 116, 242);
    self.title.text = titleStr;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
