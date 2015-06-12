//
//  DataView.m
//  ZZNavBar
//
//  Created by zezefamily on 15/6/10.
//  Copyright (c) 2015年 zezefamily. All rights reserved.
//

#import "DataView.h"

@interface DataView ()<UITableViewDataSource,UITableViewDelegate>
{
    CGRect _frame;
    
    NSInteger i;
    UIView *bgView;
}

@property (nonatomic,strong) UITableView *leftTableView;
@property (nonatomic,strong) UITableView *rightTableView;
@property (nonatomic,strong) NSDictionary *dataDict;

@end

@implementation DataView
@synthesize getText = _getText;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        _frame  = frame;
        self.dataDict = [[NSDictionary alloc]init];
        i = 0;
        [self createTableView];
    }
    return self;
}

- (void)createTableView
{
    
    
#warning 显示的数据  你要改成 数据库读取
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Category" ofType:@"plist"];
    self.dataDict = [NSDictionary dictionaryWithContentsOfFile:path];
    NSLog(@"dataDict == %@",self.dataDict);
    [self.dataDict allKeys];
    
    
    bgView = [[UIView alloc]init];
    bgView.backgroundColor = [UIColor yellowColor];
    self.leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, _frame.size.width/2, 200) style:UITableViewStylePlain];
    self.leftTableView.delegate = self;
    self.leftTableView.dataSource = self;
    self.leftTableView.tableFooterView = [[UIView alloc]init];
    [self addSubview:self.leftTableView];
    
    self.rightTableView = [[UITableView alloc]initWithFrame:CGRectMake(_frame.size.width/2, 0, _frame.size.width/2, 200) style:UITableViewStylePlain];
    self.rightTableView.delegate = self;
    self.rightTableView.dataSource = self;
    self.rightTableView.tableFooterView = [[UIView alloc]init];
    [self addSubview:self.rightTableView];
    
    
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == self.leftTableView){
        
        return self.dataDict.count;
        
    }else if(tableView  == self.rightTableView){
        return [[self.dataDict objectForKey:[self.dataDict allKeys][i]]count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(tableView == self.leftTableView){
        static NSString *cellID = @"leftCell";
        UITableViewCell *leftCell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if(!leftCell){
            leftCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            leftCell.backgroundColor = [UIColor redColor];
        }
        leftCell.selectedBackgroundView = bgView;
        leftCell.textLabel.text = [self.dataDict allKeys][indexPath.row];
        
        
        return leftCell;
    }
    
    else if(tableView == self.rightTableView){
        static NSString *cellid = @"rightCell";
        UITableViewCell *rightCell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if(!rightCell){
            rightCell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        }
        
        NSArray *arr = [self.dataDict objectForKey:[self.dataDict allKeys][i]] ;
        // NSLog(@"arr == %@",arr[indexPath.row]);
        rightCell.textLabel.text = arr[indexPath.row];
        
        return rightCell;
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
#warning .....点击的字体样式
    NSArray *cells = [tableView visibleCells];
    UITableViewCell *cell = cells[indexPath.row];
    for (UITableViewCell *selectCell in cells) {
        
        if(cell == selectCell){
            
        }else {
            
        }
    }
    

    if(tableView == self.leftTableView){
        
        
        i = indexPath.row;
        [self.rightTableView reloadData];
        
    }
    if(tableView == self.rightTableView){
        
        NSArray *arr = [self.dataDict objectForKey:[self.dataDict allKeys][i]] ;
        //NSLog(@"text == %@",arr[indexPath.row]);
        NSString *text = arr[indexPath.row];
        
       self.getText(text);
    }
}

@end
