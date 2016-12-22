//
//  EditDiaryViewController.m
//  MyDiary
//
//  Created by Tebuy on 16/12/16.
//  Copyright © 2016年 Tebuy. All rights reserved.
//

#import "EditDiaryViewController.h"
#import "DiaryViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface EditDiaryViewController ()<CLLocationManagerDelegate>
{
    CLLocationManager *_locationManager;
}
@property (nonatomic, strong) UIButton *addressBtn;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *weekLabel;
@property (nonatomic, strong) UILabel *monthLabel;
@property (nonatomic, strong) NSArray *monthArray;

@end

@implementation EditDiaryViewController
- (NSArray *)monthArray {
    
    if (_monthArray == nil) {
        _monthArray = [NSArray arrayWithObjects:@"January",@"February",@"March",@"April",@"May",@"June",@"July",@"August",@"September",@"October",@"November",@"December", nil];
    }
    return _monthArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initWithView];
    [self initLocationService];
    [self initWithDate];
}
- (void)initWithDate{
    NSDate *date = [NSDate date];
    self.dateLabel.text = [NSString stringWithFormat:@"%ld",(long)[self day:date]];
    self.monthLabel.text = [self montn:date];
    self.weekLabel.text = [self weekday:date];
    self.timeLabel.text = [self time:date];
}
//当前月份
- (NSString *)montn:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar]components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return self.monthArray[[components month] - 1];
}
//当前天数
- (NSInteger)day:(NSDate *)date{
    NSDateComponents *components = [[NSCalendar currentCalendar]components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    return [components day];
}
//当前周
- (NSString *)weekday:(NSDate *)date{
    NSCalendar *calender = [NSCalendar currentCalendar];
    [calender setFirstWeekday:1];
    NSDateComponents *components = [calender components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:date];
    [components setDay:[self day:date]];
    NSDate *firstDayOfMonth = [calender dateFromComponents:components];
    NSUInteger firstWeekday = [calender ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDayOfMonth];
    return @[@"Sunday",@"Monday",@"Tuesday",@"Wednesday",@"Thursday",@"Friday",@"Saturday"][firstWeekday - 1];
}
//当前时间
- (NSString *)time:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"HH:mm"];
    return [formatter stringFromDate:date];
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
    self.monthLabel = monthLabel;
    
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
    self.dateLabel = dateLabel;
    
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
    self.weekLabel = weekLabel;
    
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
    self.timeLabel = timeLabel;
    
    UIButton *weatherBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image = [UIImage imageNamed:@"qingM14"];
    image = [image imageWithRenderingMode: UIImageRenderingModeAlwaysTemplate];
    weatherBtn.tintColor = [UIColor whiteColor];
    [weatherBtn setImage:image forState:UIControlStateNormal];
    [weatherBtn setTitle:@"晴" forState:UIControlStateNormal];
    weatherBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [maskView addSubview:weatherBtn];
    [weatherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(dateLabel.mas_left);
        make.right.equalTo(dateLabel.mas_centerX);
        make.height.equalTo(@20);
        make.top.equalTo(weekLabel.mas_bottom);
    }];
    
    UIButton *addressBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addressBtn setImage:[UIImage imageNamed:@"smallLocation"] forState:UIControlStateNormal];
    [addressBtn setTitle:@"南京市秦淮区" forState:UIControlStateNormal];
    addressBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [maskView addSubview:addressBtn];
    [addressBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weatherBtn.mas_right);
        make.width.equalTo(@100);
        make.height.equalTo(weatherBtn.mas_height);
        make.top.equalTo(weatherBtn.mas_top);
    }];
    self.addressBtn = addressBtn;
    
//    UITableView *myTableView = [UITableView new];
//    myTableView.backgroundColor =[UIColor whiteColor];
//    myTableView.delegate = self;
//    myTableView.dataSource = self;
//    myTableView.separatorStyle = NO;
//    [maskView addSubview:myTableView];
//    [myTableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(maskView.mas_left);
//        make.right.equalTo(maskView.mas_right);
//        make.top.equalTo(addressBtn.mas_bottom);
//        make.bottom.equalTo(maskView.mas_bottom).offset(-50);
//    }];
    UITextView *textView = [UITextView new];
    textView.backgroundColor = [UIColor whiteColor];
    [maskView addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(maskView.mas_left);
        make.right.equalTo(maskView.mas_right);
        make.top.equalTo(addressBtn.mas_bottom);
        make.bottom.equalTo(maskView.mas_bottom).offset(-50);
    }];
    
    UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [moreBtn setImage:[UIImage imageNamed:@"diaryInfomore"] forState:UIControlStateNormal];
    [maskView addSubview:moreBtn];
    [moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(maskView.mas_left);
        make.top.equalTo(textView.mas_bottom);
        make.bottom.equalTo(maskView.mas_bottom);
        make.width.equalTo(@((kScreenWidth - 60)/3));
    }];
    
    UIButton *writeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [writeBtn setImage:[UIImage imageNamed:@"diaryInfopen"] forState:UIControlStateNormal];
    [maskView addSubview:writeBtn];
    [writeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(moreBtn.mas_right);
        make.top.equalTo(moreBtn.mas_top);
        make.bottom.equalTo(moreBtn.mas_bottom);
        make.width.equalTo(moreBtn.mas_width);
    }];
    
    UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [shareBtn setImage:[UIImage imageNamed:@"diaryInfoshare"] forState:UIControlStateNormal];
    [maskView addSubview:shareBtn];
    [shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(writeBtn.mas_right);
        make.right.equalTo(maskView.mas_right);
        make.top.equalTo(writeBtn.mas_top);
        make.bottom.equalTo(writeBtn.mas_bottom);
    }];
}
- (void)initLocationService{
    _locationManager = [[CLLocationManager alloc]init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;//精确到米
    if ([CLLocationManager locationServicesEnabled]) {
        // 启动位置更新
        // 开启位置更新需要与服务器进行轮询所以会比较耗电，在不需要时用stopUpdatingLocation方法关闭;
        [_locationManager startUpdatingLocation];
        NSLog(@"开启成功");
    } else {
        NSLog(@"请开启定位功能！");
    }
    if ([[[UIDevice currentDevice]systemVersion] doubleValue] >8.0)
    {
        // 设置定位权限仅iOS8以上有意义,而且iOS8以上必须添加此行代码
        [_locationManager requestWhenInUseAuthorization];//前台定位
    }

}
#pragma mark LoactionDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *location = locations.lastObject;
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (placemarks.count > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            NSLog(@"%@",placemark.name);
            //获取城市
            NSString *city = placemark.locality;
            if (!city) {
                //四大直辖市的城市信息无法通过locality获取，只能通过获取省份的方法来获得（如果city为空则是直辖市）
                city = placemark.administrativeArea;
            }
            //位置名
            NSLog(@"name:%@",placemark.name);
            //区
            NSLog(@"subLocality:%@",placemark.subLocality);
            [self.addressBtn setTitle:[NSString stringWithFormat:@"%@%@",city,placemark.subLocality] forState:UIControlStateNormal];
            [manager stopUpdatingLocation];
        }else if (error == nil && [placemarks count] == 0){
            NSLog(@"No results were returned");
        }else if (error != nil){
            NSLog(@"An error occurred = %@",error);
        }
    }];
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    if ([error code] == kCLErrorDenied){
        //访问被拒绝
        NSLog(@"访问被拒绝");
    }
    if ([error code] == kCLErrorLocationUnknown) {
        //无法获取位置信息
        NSLog(@"无法获取位置信息");
    }
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_locationManager stopUpdatingLocation];

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
