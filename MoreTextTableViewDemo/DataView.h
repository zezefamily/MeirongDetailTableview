//
//  DataView.h
//  ZZNavBar
//
//  Created by zezefamily on 15/6/10.
//  Copyright (c) 2015年 zezefamily. All rights reserved.
//



#import <UIKit/UIKit.h>

typedef void(^TextBlock)(NSString *text);

@interface DataView : UIView

@property (nonatomic,strong) TextBlock getText;

@end
