//
//  DataTableViewCell.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/8/2.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "DataTableViewCell.h"

@implementation DataTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.label = [[UILabel alloc] init];

        [self.contentView addSubview:_label];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    _label.frame = CGRectMake(40, 15, 50, 20);
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
