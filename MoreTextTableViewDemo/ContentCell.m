//
//  ContentCell.m
//  MoreTextTableViewDemo
//
//  Created by zezefamily on 15/6/12.
//  Copyright (c) 2015年 zezefamily. All rights reserved.
//

#import "ContentCell.h"
@interface ContentCell ()
@property (weak, nonatomic) IBOutlet UIImageView *leftImage;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;


@end
@implementation ContentCell

- (void)awakeFromNib {
    // Initialization code
    
    
}

- (void)configCellWithData
{
    NSInteger count = 100;
    self.contentLabel.text = [NSString stringWithFormat:@"顾客评价(%ld)",count];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
