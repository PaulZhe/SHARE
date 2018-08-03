//
//  MessageeditTableViewCell.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/8/2.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "MessageeditTableViewCell.h"

@implementation MessageeditTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.Label = [[UILabel alloc] init];
        self.Button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [self.contentView addSubview:_Label];
        [self.contentView addSubview:_Button];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _Label.frame = CGRectMake(40, 15, 150, 20);
    _Button.frame = CGRectMake(310, 15, 20, 20);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
