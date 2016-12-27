
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
