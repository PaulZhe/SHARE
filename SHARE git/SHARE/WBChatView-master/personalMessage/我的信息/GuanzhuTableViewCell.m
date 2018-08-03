//
//  GuanzhuTableViewCell.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/8/1.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "GuanzhuTableViewCell.h"

@implementation GuanzhuTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.guanzhuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.guanzhuLabel = [[UILabel alloc] init];
        self.guanzhuImageView = [[UIImageView alloc] init];
        
        [self.contentView addSubview:_guanzhuButton];
        [self.contentView addSubview:_guanzhuLabel];
        [self.contentView addSubview:_guanzhuImageView];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _guanzhuButton.frame = CGRectMake(310, 26, 70, 28);
    _guanzhuImageView.frame = CGRectMake(40, 13, 54, 54);
    _guanzhuLabel.frame = CGRectMake(102, 30, 90, 20);
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
