//
//  ZZNavBar.h
//  ZZNavBar
//
//  Created by zezefamily on 15/6/10.
//  Copyright (c) 2015年 zezefamily. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^SelectText)(NSString *text);
@interface ZZNavBar : UIView

@property (nonatomic,strong) SelectText blockText;
@property (nonatomic,strong) UITableView *tableView;

@end
