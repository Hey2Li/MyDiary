//
//  EditDiaryViewController.m
//  MyDiary
//
//  Created by Tebuy on 16/12/16.
//  Copyright © 2016年 Tebuy. All rights reserved.
//

#import "EditDiaryViewController.h"
#import "DiaryViewController.h"

@interface EditDiaryViewController ()

@end

@implementation EditDiaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initWithView];
}
- (void)initWithView{
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    UIView *maskView = [UIView new];
    maskView.backgroundColor = kBlueColor;
    [maskView.layer setCornerRadius:20];
    [self.view addSubview:maskView];
    [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.top.equalTo(self.view.mas_top).offset(50);
        make.bottom.equalTo(self.view.mas_bottom).offset(-30);
    }];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setImage:[UIImage imageNamed:@"alert_error_icon"] forState:UIControlStateNormal];
    backBtn.contentMode = UIViewContentModeCenter;
    [backBtn addTarget:self action:@selector(backBtn) forControlEvents:UIControlEventTouchUpInside];
    [maskView addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(maskView.mas_right).offset(-10);
        make.top.equalTo(maskView.mas_top).offset(10);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    UILabel *monthLabel = [UILabel new];
    monthLabel.font = [UIFont systemFontOfSize:16.0f];
    monthLabel.text = @"December";
    monthLabel.textColor = [UIColor whiteColor];
    monthLabel.textAlignment = NSTextAlignmentCenter;
    [maskView addSubview:monthLabel];
    [monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(maskView.mas_centerX);
        make.top.equalTo(maskView.mas_top).offset(30);
        make.height.equalTo(@20);
        make.width.equalTo(@100);
    }];
    
    UILabel *dateLabel = [UILabel new];
    dateLabel.text = @"15";
    dateLabel.font = [UIFont systemFontOfSize:88];
    dateLabel.textColor = [UIColor whiteColor];
    dateLabel.textAlignment = NSTextAlignmentCenter;
    [maskView addSubview:dateLabel];
    [dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(monthLabel.mas_centerX);
        make.height.equalTo(@100);
        make.width.equalTo(@100);
        make.top.equalTo(monthLabel.mas_bottom);
    }];
    
    UILabel *weekLabel = [UILabel new];
    weekLabel.text = @"Thursday";
    weekLabel.font = [UIFont systemFontOfSize:12.0f];
    weekLabel.textColor = [UIColor whiteColor];
    weekLabel.textAlignment = NSTextAlignmentCenter;
    [maskView addSubview:weekLabel];
    [weekLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(dateLabel.mas_left);
        make.right.equalTo(dateLabel.mas_centerX).offset(5);
        make.height.equalTo(@20);
        make.top.equalTo(dateLabel.mas_bottom);
    }];
    
    UILabel *timeLabel = [UILabel new];
    timeLabel.text = @"16:33";
    timeLabel.font = [UIFont systemFontOfSize:12.0f];
    timeLabel.textColor = [UIColor whiteColor];
    timeLabel.textAlignment = NSTextAlignmentCenter;
    [maskView addSubview:timeLabel];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weekLabel.mas_right);
        make.right.equalTo(dateLabel.mas_right);
        make.height.equalTo(weekLabel.mas_height);
        make.top.equalTo(weekLabel.mas_top);
    }];
}
- (void)backBtn{
    [self dismissViewControllerAnimated:YES completion:nil];
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
