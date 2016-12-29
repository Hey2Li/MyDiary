//
//  DiaryViewController.m
//  MyDiary
//
//  Created by Tebuy on 16/12/13.
//  Copyright © 2016年 Tebuy. All rights reserved.
//

#import "DiaryViewController.h"
#import "DiaryTableViewCell.h"
#import "EditDiaryViewController.h"
#import "WriteDiaryViewController.h"
#import "RLMData.h"

@interface DiaryViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UISegmentedControl *segControl;
@property (nonatomic, strong) UILabel *naviTitle;
@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) RLMResults *dataArray;

@end

@implementation DiaryViewController
@synthesize segControl;
- (RLMResults *)dataArray{
    if (!_dataArray) {
        _dataArray  =[RLMData allObjects];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initWithNavi];
    [self initWithView];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(myTableViewReloadData) name:@"reloadDataWithDiaryVC" object:nil];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.hidesBackButton = YES;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBarHidden = NO;
    [self myTableViewReloadData];
}
- (void)myTableViewReloadData{
    [_myTableView reloadData];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
- (void)initWithNavi{
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 84)];
    titleView.backgroundColor = [UIColor whiteColor];
    
    segControl = [[UISegmentedControl alloc]initWithItems:@[@"Diary",@"Calendar",@"Moment"]];
    segControl.tintColor = [UIColor colorWithRed:91/255.0 green:183/255.0 blue:228/255.0 alpha:1];
    segControl.selectedSegmentIndex = 0;
    [segControl addTarget:self action:@selector(segmentedClick:) forControlEvents:UIControlEventValueChanged];
    [titleView addSubview:segControl];
    [segControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(titleView.mas_centerX);
        make.height.equalTo(@25);
        make.left.equalTo(titleView.mas_left).offset(50);
        make.right.equalTo(titleView.mas_right).offset(-50);
        make.top.equalTo(titleView.mas_top).offset(10);
    }];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"Diary";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textColor = [UIColor colorWithRed:91/255.0 green:183/255.0 blue:228/255.0 alpha:1];
    titleLabel.backgroundColor = [UIColor whiteColor];
    [titleView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleView.mas_left);
        make.right.equalTo(titleView.mas_right);
        make.height.equalTo(@30);
        make.top.equalTo(segControl.mas_bottom).offset(10);
    }];
    self.naviTitle = titleLabel;
    [self.navigationController.navigationBar addSubview:titleView];
}
- (void)segmentedClick:(UISegmentedControl *)seg{
    self.naviTitle.text = [NSString stringWithFormat:@"%@",[seg titleForSegmentAtIndex:seg.selectedSegmentIndex]];
}
- (void)initWithView{
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *menuView = [UIView new];
    [self.view addSubview:menuView];
    [menuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
        make.height.equalTo(@50);
    }];
    menuView.backgroundColor = kBlueColor;
    UIButton *homeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [homeBtn setImage:[UIImage imageNamed:@"moreItems"] forState:UIControlStateNormal];
    [menuView addSubview:homeBtn];
    [homeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(menuView.mas_left);
        make.top.equalTo(menuView.mas_top);
        make.bottom.equalTo(menuView.mas_bottom);
        make.width.equalTo(@80);
    }];
    [homeBtn addTarget:self action:@selector(backHome:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *writeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [writeBtn setImage:[UIImage imageNamed:@"diaryInfopen"] forState:UIControlStateNormal];
    [writeBtn addTarget:self action:@selector(writeDiary) forControlEvents:UIControlEventTouchUpInside];
    [menuView addSubview:writeBtn];
    [writeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(homeBtn.mas_right);
        make.top.equalTo(homeBtn.mas_top);
        make.bottom.equalTo(homeBtn.mas_bottom);
        make.width.equalTo(homeBtn.mas_width);
    }];
    
    UIButton *photoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [photoBtn setImage:[UIImage imageNamed:@"diaryInfphoto"] forState:UIControlStateNormal];
    [menuView addSubview:photoBtn];
    [photoBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(writeBtn.mas_right);
        make.top.equalTo(homeBtn.mas_top);
        make.bottom.equalTo(homeBtn.mas_bottom);
        make.width.equalTo(homeBtn.mas_width);
    }];
    
    UILabel *entryLabel = [UILabel new];
    entryLabel.text = @"1 entry";
    entryLabel.textColor = [UIColor whiteColor];
    entryLabel.textAlignment = NSTextAlignmentCenter;
    entryLabel.font = [UIFont boldSystemFontOfSize:20];
    [menuView addSubview:entryLabel];
    [entryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(photoBtn.mas_right);
        make.top.equalTo(photoBtn.mas_top);
        make.bottom.equalTo(photoBtn.mas_bottom);
        make.right.equalTo(menuView.mas_right);
    }];
    
    UITableView *myTabelView = [UITableView new];
    myTabelView.delegate = self;
    myTabelView.dataSource = self;
    myTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    myTabelView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"theme_bg_taki"]];
    [self.view addSubview:myTabelView];
    [myTabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top).offset(40);
        make.bottom.equalTo(self.view.mas_bottom).offset(-50);
    }];
    
    [myTabelView registerNib:[UINib nibWithNibName:@"DiaryTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
}
- (void)writeDiary{
    WriteDiaryViewController *vc = [WriteDiaryViewController new];
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)backHome:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 88;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *label = [UILabel new];
    label.backgroundColor = [UIColor clearColor];
    label.text = @"12";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:32];
    return label;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DiaryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    RLMData *data = self.dataArray[indexPath.section];
    cell.weekLabel.text = [data.diaryWeek substringToIndex:3] ;
    cell.titleLabel.text = data.titleName;
    cell.detailLabel.text = data.diaryContent;
    cell.timeLabel.text = data.diaryTime;
    cell.dateLabel.text = data.diaryNumber;
    __weak typeof(self) weakSelf = self;
    weakSelf.tableReloadData =^{
        [weakSelf.myTableView reloadData];
    };
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EditDiaryViewController *vc = [EditDiaryViewController new];
    vc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:vc animated:YES completion:nil];
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
