//
//  MessageTableViewCell.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/8/1.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "MessageTableViewCell.h"

@implementation MessageTableViewCell
@synthesize imageView;
@synthesize Label1;
@synthesize Label2;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.Label1 = [[UILabel alloc] init];
        self.Label2= [[UILabel alloc] init];
        self.imageView = [[UIImageView alloc] init];
        
        [self.contentView addSubview:Label1];
        [self.contentView addSubview:Label2];
        [self.contentView addSubview:imageView];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    Label1.frame = CGRectMake(40, 15, 100, 20);
    imageView.frame = CGRectMake(310, 15, 18, 20);
    Label2.frame = CGRectMake(350, 15, 10, 20);
    Label2.textColor = [UIColor colorWithRed:0.40f green:0.68f blue:0.86f alpha:1.00f];
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
