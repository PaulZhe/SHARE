//
//  PersonalTableViewCell.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/8/1.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "PersonalTableViewCell.h"

@implementation PersonalTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.imageView1 = [[UIImageView alloc] init];
        self.imageView2 = [[UIImageView alloc] init];
        self.Label = [[UILabel alloc] init];
        
        
        [self.contentView addSubview:_imageView1];
        [self.contentView addSubview:_imageView2];
        [self.contentView addSubview:_Label];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _imageView1.frame = CGRectMake(38, 18, 20, 20);
    _Label.frame = CGRectMake(80, 18, 80, 18);
    _Label.textColor = [UIColor blackColor];
    _imageView2.frame = CGRectMake(324, 18, 18, 18);
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
