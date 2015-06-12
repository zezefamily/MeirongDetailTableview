//
//  ViewController.m
//  MoreTextTableViewDemo
//
//  Created by zezefamily on 15/6/12.
//  Copyright (c) 2015年 zezefamily. All rights reserved.
//

#import "ViewController.h"
#import "MeirongDetailTableview.h"
#import "DetailViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *DataArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *arr = @[@"美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师美容师1",@"美容师2美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师2美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美美容师2美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美容师1美"];
    
    DataArray = [NSMutableArray arrayWithArray:arr];
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.tableFooterView = [[UIView alloc]init];
    _tableView.delegate  = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid = @"celid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"美容师%ld",indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str = DataArray[indexPath.row];
    DetailViewController *detailVC = [[DetailViewController alloc]init];
    detailVC.info = str;
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
