//
//  HomePageTableViewCell.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/7/30.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "HomePageTableViewCell.h"

@implementation HomePageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        _homePageLabel0 = [[UILabel alloc] init];
        _homePageLabel1 = [[UILabel alloc] init];
        _homePageLabel2 = [[UILabel alloc] init];
        _homePageLabel3 = [[UILabel alloc] init];
        _homePageImageView0 = [[UIImageView alloc] init];
        _homePageButton1 = [[UIButton alloc] init];
        _homePageButton2 = [[UIButton alloc] init];
        _homePageButton3 = [[UIButton alloc] init];
        
        [self.contentView addSubview:_homePageLabel0];
        [self.contentView addSubview:_homePageLabel1];
        [self.contentView addSubview:_homePageLabel2];
        [self.contentView addSubview:_homePageLabel3];
        [self.contentView addSubview:_homePageButton1];
        [self.contentView addSubview:_homePageButton2];
        [self.contentView addSubview:_homePageButton3];
        [self.contentView addSubview:_homePageImageView0];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _homePageImageView0.frame = CGRectMake(0, 0, 190, 142);
    _homePageLabel0.frame = CGRectMake(210, 10, 160, 25);
    _homePageLabel1.frame = CGRectMake(210, 40, 100, 15);
    _homePageLabel2.frame = CGRectMake(210, 60, 140, 15);
    _homePageLabel3.frame = CGRectMake(210, 80, 70, 15);
    _homePageButton1.frame = CGRectMake(205, 108, 60, 18);
    _homePageButton2.frame = CGRectMake(268, 108, 60, 18);
    _homePageButton3.frame = CGRectMake(331, 108, 60, 18);
    _homePageLabel0.font = [UIFont systemFontOfSize:18];
    _homePageLabel1.font = [UIFont systemFontOfSize:14];
    _homePageLabel2.font = [UIFont systemFontOfSize:14];
    _homePageLabel3.font = [UIFont systemFontOfSize:14];
    _homePageButton1.titleLabel.font = [UIFont systemFontOfSize:14];
    _homePageButton2.titleLabel.font = [UIFont systemFontOfSize:14];
    _homePageButton3.titleLabel.font = [UIFont systemFontOfSize:14];
    [_homePageButton1 setTitleColor:[UIColor colorWithRed:0.11f green:0.55f blue:0.80f alpha:1.00f] forState:UIControlStateNormal];
    [_homePageButton1 setTitleColor:[UIColor colorWithRed:0.11f green:0.55f blue:0.80f alpha:1.00f] forState:UIControlStateSelected];
    [_homePageButton2 setTitleColor:[UIColor colorWithRed:0.11f green:0.55f blue:0.80f alpha:1.00f] forState:UIControlStateNormal];
    [_homePageButton3 setTitleColor:[UIColor colorWithRed:0.11f green:0.55f blue:0.80f alpha:1.00f] forState:UIControlStateNormal];
    [_homePageButton1 setTintColor:[UIColor colorWithRed:0.11f green:0.55f blue:0.80f alpha:1.00f]];
    [_homePageButton2 setTintColor:[UIColor colorWithRed:0.11f green:0.55f blue:0.80f alpha:1.00f]];
    [_homePageButton3 setTintColor:[UIColor colorWithRed:0.11f green:0.55f blue:0.80f alpha:1.00f]];
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
