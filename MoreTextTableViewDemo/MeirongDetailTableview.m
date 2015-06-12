//
//  MeirongDetailTableview.m
//  MoreTextTableViewDemo
//
//  Created by zezefamily on 15/6/12.
//  Copyright (c) 2015年 zezefamily. All rights reserved.
//
#define TopHeight 110.0f

#import "MeirongDetailTableview.h"
#import "TopInfoCell.h"
#import "ContentCell.h"
#import "ZZNavBar.h"

@interface MeirongDetailTableview ()<UITableViewDataSource,UITableViewDelegate,TopInfoCellDelegate>
{
    CGRect _frame;
    
    ZZNavBar *_zzNavBar;
    
}
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) NSMutableArray *listArray;

@end
@implementation MeirongDetailTableview
static BOOL isShow = NO;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        
        self.dataArray = [[NSMutableArray alloc]init];
        self.listArray = [[NSMutableArray alloc]init];
        
        _frame = frame;
        [self createUI];
    }
    return self;
}


/////////////////////////data////////////////////////

- (void)showBtnClick
{
    isShow = YES;
    [self reloadSectionWithIndex:0];
    isShow = NO;
    
}

///////////////////////////ui////////////////////////
- (void)createUI
{
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, _frame.size.width, _frame.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self addSubview:self.tableView];
    
    
    _zzNavBar = [[ZZNavBar alloc]initWithFrame:CGRectMake(0, 0, _frame.size.width, 40)];
#warning 修改ZZNavBar的样式在 ZZNavBar.m 只做了左边的样式(面部护理)右边自己添加一个  数据显示在DataView.m
#warning 这里是筛选的结果
    _zzNavBar.blockText = ^(NSString *text){
    
        NSLog(@"text == %@",text);
        
//        取到text 发出请求 刷新section 1
        [self.listArray addObject:@"hehe"];
        [self reloadSectionWithIndex:1];
        
    };
    
}

#pragma mark - 请求需要的回调
/*
    请求成功后 执行 - (void)reloadSectionWithIndex:(NSInteger)index  index = 1;
 */



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0){
        return 2;
    }else {
        return self.listArray.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0){
        if(indexPath.row == 0){
            static NSString *cellid = @"topCell";
            TopInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
            
            if(!cell){
                cell = [[NSBundle mainBundle]loadNibNamed:@"TopInfoCell" owner:self options:nil][0];
                cell.delegate =self;
            }
            cell.userinfo = self.userInfo;
            [cell configTopCellWithData];
            
            return cell;
        }

        if(indexPath.row == 1){
            static NSString *cellid = @"contentCell";
            ContentCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
            if(!cell){
                cell = [[NSBundle mainBundle]loadNibNamed:@"ContentCell" owner:self options:nil][0];
            }
            [cell configCellWithData];
            return cell;
            
        }

#warning section 2 的 cell 用你定制好的cell 替换 （注意适配）
    }else {
        static NSString *cellid = @"listCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        if(!cell){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
        return cell;
    }
    return nil;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(section == 1){
        return _zzNavBar;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 1){
        return 40;
    }
    return 0.0000001f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0){
        if(indexPath.row == 0){
            
            if(isShow == NO){
                return TopHeight + 40; //default;
            }
//            可以改变高度
            if(isShow == YES){
                return [self heightWithString:self.userInfo width:_frame.size.width-30 fontSize:11] + TopHeight +20;
            }
            
        }else if (indexPath.row == 1){
            return 45;
        }
        
    }if(indexPath.section == 1){
        
        return 275/2;
    }
    return 44.0f;
}



- (void)reloadSectionWithIndex:(NSInteger)index
{
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:index] withRowAnimation:UITableViewRowAnimationNone];
}

- (CGFloat)heightWithString:(NSString *)string width:(CGFloat)width fontSize:(CGFloat)fontSize
{
    CGRect rect = [string boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil];
    return rect.size.height;
}
@end
