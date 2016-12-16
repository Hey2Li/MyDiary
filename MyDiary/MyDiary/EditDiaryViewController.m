//
//  EditDiaryViewController.m
//  MyDiary
//
//  Created by Tebuy on 16/12/16.
//  Copyright © 2016年 Tebuy. All rights reserved.
//

#import "EditDiaryViewController.h"

@interface EditDiaryViewController ()

@end

@implementation EditDiaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initWithView];
}
- (void)initWithView{
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
    UIView *maskView = [UIView new];
    maskView.backgroundColor = kBlueColor;
    [maskView.layer setCornerRadius:10];
    [self.view addSubview:maskView];
    [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.top.equalTo(self.view.mas_top).offset(40);
        make.bottom.equalTo(self.view.mas_bottom).offset(20);
    }];
    
    UILabel *monthLabel = [UILabel new];
    monthLabel.font = [UIFont systemFontOfSize:16.0f];
    monthLabel.text = @"December";
    monthLabel.textColor = [UIColor whiteColor];
    [maskView addSubview:monthLabel];
    [monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(maskView.mas_centerX);
        make.top.equalTo(maskView.mas_top).offset(30);
        make.height.equalTo(@30);
        make.width.equalTo(@100);
    }];
    
    UILabel *dateLabel = [UILabel new];
    dateLabel.text = @"15";
    dateLabel.font = [UIFont systemFontOfSize:40];
    dateLabel.textColor = [UIColor whiteColor];
    [maskView addSubview:dateLabel];
    [dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(monthLabel.mas_centerX);
        make.height.equalTo(@100);
        make.width.equalTo(@100);
        make.top.equalTo(monthLabel.mas_bottom).offset(5);
    }];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
