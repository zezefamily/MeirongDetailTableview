//
//  TopInfoCell.h
//  MoreTextTableViewDemo
//
//  Created by zezefamily on 15/6/12.
//  Copyright (c) 2015年 zezefamily. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TopInfoCellDelegate <NSObject>

- (void)showBtnClick;

@end


@interface TopInfoCell : UITableViewCell
@property (nonatomic,weak) id<TopInfoCellDelegate> delegate;

@property (nonatomic,strong) NSString *userinfo;
- (void)configTopCellWithData;

@end
