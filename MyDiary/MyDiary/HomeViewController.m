//
//  HomeViewController.m
//  MyDiary
//
//  Created by Tebuy on 16/12/13.
//  Copyright © 2016年 Tebuy. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) UIView *naviView;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self initWithNavi];
}
- (void)initWithNavi{
    self.title = @"MyDiary";
    self.navigationController.navigationBar.hidden = YES;
    
    UIView *naviView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 84)];
    [naviView setBackgroundColor:[UIColor colorWithRed:91/255.0 green:183/255.0 blue:228/255.0 alpha:1]];
    [self.view addSubview:naviView];
    self.naviView = naviView;
    
    UIButton *headBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [headBtn.layer setMasksToBounds:YES];
    [headBtn.layer setCornerRadius:25.0f];
    [headBtn setImage:[UIImage imageNamed:@"ic_contacts_image_default"] forState:UIControlStateNormal];
    [naviView addSubview:headBtn];
    [headBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(naviView.mas_left).offset(10);
        make.top.equalTo(naviView.mas_top).offset(30);
        make.width.equalTo(@50);
        make.height.equalTo(headBtn.mas_width);
    }];
    
    UILabel *nameLabel = [UILabel new];
    [nameLabel setTextColor:[UIColor whiteColor]];
    nameLabel.text = @"立花 瀧";
    [naviView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headBtn.mas_right).offset(20);
        make.centerY.equalTo(headBtn.mas_centerY);
        make.height.equalTo(@50);
        make.width.equalTo(@100);
    }];
}
- (void)initWithView{
    UITableView *tableView = [UITableView new];
    tableView.separatorStyle = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.naviView.mas_bottom);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    self.myTableView = tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
