//
//  SixinTableViewCell.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/8/1.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "SixinTableViewCell.h"

@implementation SixinTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.sixinLabel1 = [[UILabel alloc] init];
        self.sixinLabel2 = [[UILabel alloc] init];
        self.sixinLabel3 = [[UILabel alloc] init];
        self.sixinImageView = [[UIImageView alloc] init];

        [self.contentView addSubview:_sixinLabel1];
        [self.contentView addSubview:_sixinLabel2];
        [self.contentView addSubview:_sixinLabel3];
        [self.contentView addSubview:_sixinImageView];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _sixinImageView.frame = CGRectMake(40, 13, 54, 54);
    _sixinLabel1.frame = CGRectMake(102, 15, 90, 20);
    _sixinLabel2.frame = CGRectMake(102, 45, 260, 20);
    _sixinLabel3.frame = CGRectMake(310, 13, 80, 15);
    _sixinLabel3.font = [UIFont systemFontOfSize:14];
    _sixinLabel2.textColor = [UIColor colorWithRed:0.30f green:0.60f blue:0.82f alpha:1.00f];
    _sixinLabel3.textColor = [UIColor colorWithRed:0.85f green:0.85f blue:0.85f alpha:1.00f];
    
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
