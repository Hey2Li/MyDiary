//
//  HomeViewController.m
//  MyDiary
//
//  Created by Tebuy on 16/12/13.
//  Copyright © 2016年 Tebuy. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "DiaryViewController.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) UIView *naviView;
@end

@implementation HomeViewController

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initWithNavi];
    [self initWithView];
}
- (void)initWithNavi{
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
        make.top.equalTo(naviView.mas_top).offset(25);
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
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.separatorStyle = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top).offset(84);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    self.myTableView = tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    switch (indexPath.row) {
        case 0:
            cell.iconImageView.image  =[UIImage imageNamed:@"Phone_call2"];
            cell.titleLabel.text = @"紧急联系人";
            return cell;
            break;
        case 1:
            cell.iconImageView.image  =[UIImage imageNamed:@"Book_open2"];
            cell.titleLabel.text = @"DIARY";
            return cell;
            break;
        case 2:
            cell.iconImageView.image  =[UIImage imageNamed:@"exclamation_point2"];
            cell.titleLabel.text = @"禁止事项";
            return cell;
            break;
        default:
            return cell;
            break;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[DiaryViewController new] animated:YES];
}
- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;

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
