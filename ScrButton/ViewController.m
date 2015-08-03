//
//  ViewController.m
//  ScrButton
//
//  Created by 口贷网 on 15/7/8.
//  Copyright (c) 2015年 Afer. All rights reserved.
//

#import "ViewController.h"
#import "SliderButtonView.h"
#import "SliderScrollView.h"
#import "TableView.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SliderButtonView *sli = [[SliderButtonView alloc] initWithFrame:CGRectMake(0, 0,kScreenWidth, 44) withButtonNames:@[@"正在招标", @"最新满标", @"成功还标"]];
    [self.view addSubview:sli];
    
    
    TableView *view1 = [[TableView alloc] initWithFrame:CGRectMake(0, 44, kScreenWidth, kScreenHeight - 88)];
    view1.backgroundColor = [UIColor redColor];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 44 , kScreenWidth, kScreenHeight - 44)];
    view2.backgroundColor = [UIColor blueColor];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 44, kScreenWidth, kScreenHeight - 44)];
    view3.backgroundColor = [UIColor purpleColor];
    NSArray *viewArray = @[view1, view2, view3];
    
    SliderScrollView *slis = [[SliderScrollView alloc] initWithFrame:CGRectMake(0, 44, kScreenWidth, kScreenHeight - 44) withViewArray:viewArray];
    [self.view addSubview:slis];
    
    slis.get_Index_Block = ^(NSInteger index){
        sli.index = index;
    };
    sli.button_selected_block = ^(NSInteger tag) {
        slis.scr.contentOffset = CGPointMake(tag * [UIScreen mainScreen].bounds.size.width, 0);
    };
    
}


@end
