
//
//  WriteDiaryViewController.m
//  MyDiary
//
//  Created by Tebuy on 16/12/27.
//  Copyright © 2016年 Tebuy. All rights reserved.
//

#import "WriteDiaryViewController.h"

@interface WriteDiaryViewController ()
@property (nonatomic, strong) UIView *writeView;
@end

@implementation WriteDiaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithView];
}
- (void)initWithView{
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    self.writeView = [UIView new];
    self.writeView.backgroundColor = [UIColor whiteColor];
    self.writeView.layer.cornerRadius = 10.0f;
    [self.view addSubview:self.writeView];
    [self.writeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_right);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top).offset(25);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setImage:[UIImage imageNamed:@"diaryInfoBack"] forState:UIControlStateNormal];
    [cancelBtn addTarget:self action:@selector(cancelBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.writeView addSubview:cancelBtn];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.writeView.mas_left).offset(10);
        make.top.equalTo(self.writeView.mas_right).offset(10);
        make.width.equalTo(@30);
        make.height.equalTo(@30);
    }];
    
    UILabel *yearLabel = [UILabel new];
    yearLabel.text = @"2016 12.28 Tuesday";
    yearLabel.font  =[UIFont systemFontOfSize:18];
    yearLabel.textColor = kBlueColor;
    [self.writeView addSubview:yearLabel];
    [yearLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.writeView.mas_centerY);
        make.width.equalTo(@(kScreenWidth/2));
        make.height.equalTo(@30);
        make.top.equalTo(self.writeView.mas_top).offset(10);
    }];
    
}
- (void)cancelBtn{
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
