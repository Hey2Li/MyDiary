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
        self.selectionStyle = NO;
        UIImageView *leftImageView = [UIImageView new];
        leftImageView.image = [UIImage imageNamed:@"exclamation_point2"];
//        leftImageView.contentMode = UIViewContentModeCenter;
        [self addSubview:leftImageView];
        [leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(20);
            make.centerY.equalTo(self.mas_centerY);
            make.height.equalTo(@28);
            make.width.equalTo(@28);
        }];
        self.iconImageView = leftImageView;
        
        UILabel *nameLabel = [UILabel new];
        nameLabel.text = @"禁止事项";
        nameLabel.textColor = [UIColor colorWithRed:137/255.0 green:153/255.0 blue:165/255.0 alpha:1];
//        [nameLabel setFont:[UIFont systemFontOfSize:16]];
        nameLabel.font = [UIFont fontWithName:@"OpenSans-Regular" size:14];
        [self addSubview:nameLabel];
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(leftImageView.mas_right).offset(10);
            make.centerY.equalTo(self.mas_centerY);
            make.right.equalTo(self.mas_right).offset(-20);
            make.height.equalTo(@50);
        }];
        self.titleLabel = nameLabel;
        
        UIImageView *mainRightImgView = [UIImageView new];
        mainRightImgView.image = [UIImage imageNamed:@"mainRight"];
        mainRightImgView.contentMode = UIViewContentModeCenter;
        [self addSubview:mainRightImgView];
        [mainRightImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-15);
            make.height.equalTo(@25);
            make.width.equalTo(@25);
            make.centerY.equalTo(self.mas_centerY);
        }];
        
        UILabel *lineLabel = [UILabel new];
        lineLabel.backgroundColor = [UIColor colorWithRed:137/255.0 green:153/255.0 blue:165/255.0 alpha:0.4];
        [self addSubview:lineLabel];
        [lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(leftImageView.mas_left);
            make.right.equalTo(self.mas_right);
            make.height.equalTo(@1);
            make.bottom.equalTo(self.mas_bottom).offset(-1);
        }];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
