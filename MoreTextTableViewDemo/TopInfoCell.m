//
//  TopInfoCell.m
//  MoreTextTableViewDemo
//
//  Created by zezefamily on 15/6/12.
//  Copyright (c) 2015年 zezefamily. All rights reserved.
//

#import "TopInfoCell.h"
@interface TopInfoCell ()

@property (weak, nonatomic) IBOutlet UIView *bgView;

@property (weak, nonatomic) IBOutlet UIImageView *userIcon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *info;
@property (weak, nonatomic) IBOutlet UIButton *showBtn;

@end
@implementation TopInfoCell

- (void)awakeFromNib
{
    self.userIcon.layer.cornerRadius = 30;
    
    self.info.backgroundColor = [UIColor redColor];
    
}

- (void)configTopCellWithData
{
//   字体大小为11  当文本高度大于28，显示button
    CGFloat height = [self heightWithString:self.userinfo width:[UIScreen mainScreen].bounds.size.width - 30 fontSize:11];
    CGRect frame = self.info.frame;
    
    NSLog(@"height == %f",height);
    if(height <= 28){
        self.showBtn.hidden = YES;
        frame.size.height = height+10;
        self.info.frame = frame;
    }
    
    self.info.text = self.userinfo;
    
    
}
- (IBAction)showBtnClick:(UIButton *)sender {
    
    sender.hidden = YES;
    
    [self.delegate showBtnClick];
}


- (CGFloat)heightWithString:(NSString *)string width:(CGFloat)width fontSize:(CGFloat)fontSize
{
    CGRect rect = [string boundingRectWithSize:CGSizeMake(width, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil];
    return rect.size.height;
}

@end
