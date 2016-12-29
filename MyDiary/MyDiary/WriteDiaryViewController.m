
//
//  WriteDiaryViewController.m
//  MyDiary
//
//  Created by Tebuy on 16/12/27.
//  Copyright © 2016年 Tebuy. All rights reserved.
//

#import "WriteDiaryViewController.h"
#import "DiaryViewController.h"
#import "RLMData.h"

@interface WriteDiaryViewController ()
@property (nonatomic, strong) UIView *writeView;
@property (nonatomic, strong) NSString *dateStr;
@property (nonatomic, strong) NSString *yearStr;
@property (nonatomic, strong) NSString *monthStr;
@property (nonatomic, strong) NSString *dayStr;
@property (nonatomic, strong) NSString *timeStr;
@property (nonatomic, strong) NSString *weekStr;
@property (nonatomic, strong) UITextField *titleTextField;
@property (nonatomic, strong) UITextView *subTextView;
@end

@implementation WriteDiaryViewController

- (NSString *)dateStr{
    if (!_dayStr) {
        NSDate *currentDate = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"YYYY MM.dd HH:mm"];
        _dateStr = [dateFormatter stringFromDate:currentDate];
        self.yearStr = [_dateStr substringToIndex:4];
        self.monthStr = [Tool montn];
        self.dayStr = [_dateStr substringWithRange:NSMakeRange(8, 2)];
        self.timeStr = [_dateStr substringFromIndex:10];
        self.weekStr = [Tool weekday];
        NSLog(@"%@/%@/%@/%@",self.yearStr,self.monthStr,self.dayStr,self.timeStr);
    }
    return _dateStr;
}
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
        make.left.equalTo(self.view.mas_left);
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
        make.top.equalTo(self.writeView.mas_top).offset(10);
        make.width.equalTo(@50);
        make.height.equalTo(@30);
    }];
    
    
    UILabel *yearLabel = [UILabel new];
    yearLabel.text = [NSString stringWithFormat:@"%@ %@",[self.dateStr substringToIndex:10],self.weekStr];
    yearLabel.textAlignment = NSTextAlignmentCenter;
    yearLabel.font  =[UIFont systemFontOfSize:16];
    yearLabel.textColor = kBlueColor;
    [self.writeView addSubview:yearLabel];
    [yearLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.writeView.mas_centerX);
        make.width.equalTo(@200);
        make.height.equalTo(@30);
        make.top.equalTo(self.writeView.mas_top).offset(10);
    }];
    
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn.layer setCornerRadius:3.0];
    [saveBtn setBackgroundColor:kBlueColor];
    saveBtn.titleLabel.textColor = [UIColor whiteColor];
    saveBtn.titleLabel.font  =[UIFont systemFontOfSize:14];
    [saveBtn addTarget:self action:@selector(saveDiary) forControlEvents:UIControlEventTouchUpInside];
    [self.writeView addSubview:saveBtn];
    [saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.writeView.mas_right).offset(-10);
        make.height.equalTo(cancelBtn.mas_height);
        make.width.equalTo(cancelBtn.mas_width);
        make.centerY.equalTo(cancelBtn.mas_centerY);
    }];
    
    self.titleTextField = [UITextField new];
    _titleTextField.placeholder = @"标题";
    _titleTextField.font = [UIFont systemFontOfSize:24];
    [self.writeView addSubview:_titleTextField];
    [_titleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.writeView.mas_left).offset(10);
        make.right.equalTo(self.writeView.mas_right).offset(-10);
        make.height.equalTo(@50);
        make.top.equalTo(cancelBtn.mas_bottom).offset(30);
    }];
    
    UILabel *line = [UILabel new];
    line.backgroundColor = kLineColor;
    [self.writeView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleTextField.mas_left);
        make.right.equalTo(_titleTextField.mas_right);
        make.height.equalTo(@1);
        make.top.equalTo(_titleTextField.mas_bottom).offset(10);
    }];
    _subTextView  =[[UITextView alloc]init];
    _subTextView.font = [UIFont systemFontOfSize:14];
    [self.writeView addSubview:_subTextView];
    [_subTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.writeView.mas_left).offset(10);
        make.right.equalTo(self.writeView.mas_right).offset(-10);
        make.top.equalTo(line.mas_bottom).offset(10);
        make.bottom.equalTo(self.writeView.mas_bottom).offset(-50);
    }];
}
- (void)saveDiary{
    //增x
        [self createDataBaseWithName:@"MyDiary"];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            RLMRealm *realm = [RLMRealm defaultRealm];
            [realm transactionWithBlock:^{
                RLMData *data = [[RLMData alloc]init];
                data.titleName = _titleTextField.text;
                data.diaryContent = _subTextView.text;
                data.diaryTime = self.timeStr;
                data.diaryWeek = self.weekStr;
                data.diaryNumber = self.dayStr;
                data.diaryWeather = @"晴";
                [realm addObject: data];
                [realm commitWriteTransaction];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self dismissViewControllerAnimated:YES completion:nil];
                    [[NSNotificationCenter defaultCenter]postNotificationName:@"reloadDataWithDiaryVC" object:nil];
                });
            }];
        });
    
    //删除
    //    RLMRealm *realm = [RLMRealm defaultRealm];
    //    [realm transactionWithBlock:^{
    //        [realm deleteAllObjects];
    //        [realm commitWriteTransaction];
    //    }];
    
    //查询
    //    RLMResults *tempArray = [RLMData allObjects];
    //    for (RLMData *data in tempArray) {
    //        NSLog(@"titleName:%@,diaryContent:%@,diaryTime:%@,diaryWeek:%@,diaryNumber:%@,diaryWeather:%@",data.titleName,data.diaryContent,data.diaryTime,data.diaryWeek,data.diaryNumber,data.diaryWeather);
    //    }
    
    //修改
//    RLMRealm *realm = [RLMRealm defaultRealm];
//    [realm transactionWithBlock:^{
//        //获得对象
//        RLMResults *result = [RLMData allObjects];
//        //获得第一个对象
//        RLMData *data = [result objectAtIndex:0];
//        data.diaryTime = [NSDate dateWithTimeIntervalSinceNow:0];
//        [realm commitWriteTransaction];
//    }];
}
- (void)createDataBaseWithName:(NSString *)databaseName{
    NSArray *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [docPath objectAtIndex:0];
    NSString *filePath = [path stringByAppendingPathComponent:databaseName];
    NSLog(@"数据库目录= %@",filePath);
    
    RLMRealmConfiguration *config  =[RLMRealmConfiguration defaultConfiguration];
    config.fileURL = [NSURL URLWithString:filePath];
    /*
     objectClasses这个属性是用来控制对哪个类能够存储在指定 Realm 数据库中做出限制。例如，如果有两个团队分别负责开发您应用中的不同部分，并且同时在应用内部使用了 Realm 数据库，那么您肯定不希望为它们协调进行数据迁移您可以通过设置RLMRealmConfiguration的 objectClasses属性来对类做出限制。objectClasses一般可以不用设置。
     */
    //    config.objectClasses = @[self.class, self.class];
    config.readOnly = NO;
    int currentVersion = 1.0;
    config.schemaVersion = currentVersion;
    
    config.migrationBlock = ^(RLMMigration *migration, uint64_t oldSchemaVersion){
        if (oldSchemaVersion < currentVersion) {
            //
        }
    };
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
