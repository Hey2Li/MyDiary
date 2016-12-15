//
//  DiaryTableViewCell.m
//  MyDiary
//
//  Created by Tebuy on 16/12/14.
//  Copyright © 2016年 Tebuy. All rights reserved.
//

#import "DiaryTableViewCell.h"

@implementation DiaryTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = NO;
    [self.layer setCornerRadius:5];
    self.layer.shadowOffset = CGSizeMake(0, 1);
    self.layer.shadowColor = [UIColor grayColor].CGColor;
    self.layer.shadowRadius = 1;
    self.layer.shadowOpacity = .5f;
    CGRect shadowFrame = self.layer.bounds;
    shadowFrame.size.width = kScreenWidth - 40;
    CGPathRef shadowPath = [UIBezierPath bezierPathWithRect:shadowFrame].CGPath;
    self.layer.shadowPath = shadowPath;
    for (UILabel *label in self.contentView.subviews) {
        if ([label isKindOfClass:[UILabel class]]) {
            label.textColor = kBlueColor;
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setFrame:(CGRect)frame {
    frame.origin.x += 20;
    frame.size.width -= 2 * 20;
    [super setFrame:frame];
}
@end
