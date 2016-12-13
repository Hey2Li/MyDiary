//
//  BaseNaviViewController.m
//  MyDiary
//
//  Created by Tebuy on 16/12/13.
//  Copyright © 2016年 Tebuy. All rights reserved.
//

#import "BaseNaviViewController.h"

@interface BaseNaviViewController ()

@end

@implementation BaseNaviViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.frame = CGRectMake(0, 0, kScreenWidth, 84);
    self.navigationBar.tintColor = [UIColor colorWithRed:91/255.0 green:183/255.0 blue:228/255.0 alpha:1];
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:91/255.0 green:183/255.0 blue:228/255.0 alpha:1];
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
