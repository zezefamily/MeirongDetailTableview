//
//  DetailViewController.m
//  MoreTextTableViewDemo
//
//  Created by zezefamily on 15/6/12.
//  Copyright (c) 2015年 zezefamily. All rights reserved.
//

#import "DetailViewController.h"
#import "MeirongDetailTableview.h"
@interface DetailViewController ()
{
    
}
@property (nonatomic,strong) MeirongDetailTableview *detailTableView;
@end

@implementation DetailViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"美容师";

    self.detailTableView = [[MeirongDetailTableview alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.detailTableView.userInfo =self.info;
    [self.view addSubview:self.detailTableView];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}
@end
