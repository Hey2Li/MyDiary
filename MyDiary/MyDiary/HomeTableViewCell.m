//
//  HomeTableViewCell.m
//  MyDiary
//
//  Created by Tebuy on 16/12/13.
//  Copyright © 2016年 Tebuy. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor whiteColor];
        self.selected = NO;
        UIImageView *leftImageView = [UIImageView new];
        [self addSubview:leftImageView];
        [leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left);
            make.centerY.equalTo(self.mas_centerY);
            make.height.equalTo(@30);
            make.width.equalTo(self.mas_right);
        }];
        
        UILabel *nameLabel = [UILabel new];
        [nameLabel setFont:[UIFont systemFontOfSize:14]];
        [self addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(leftImageView.mas_right).offset(10);
            make.centerX.equalTo(self.mas_centerX);
            make.right.equalTo(self.mas_right).offset(-20);
            make.height.equalTo(@50);
        }];
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
