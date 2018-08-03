//
//  ActivityTableViewCell.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/7/30.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "ActivityTableViewCell.h"

@implementation ActivityTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        
        _activityImageView = [[UIImageView alloc] init];
        _activityLabel = [[UILabel alloc] init];
        
        [self.contentView addSubview:_activityImageView];
        [self.contentView addSubview:_activityLabel];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _activityImageView.frame = CGRectMake(6, 6, 404, 175);
    _activityLabel.frame = CGRectMake(15, 177, 404, 30);
    _activityLabel.font = [UIFont systemFontOfSize:13];
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
