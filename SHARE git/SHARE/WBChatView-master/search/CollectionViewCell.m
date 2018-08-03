//
//  CollectionViewCell.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/8/3.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _topImage  = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 136, 136)];
        _topImage.backgroundColor = [UIColor redColor];
        self.layer.borderWidth=0.5; 
        [self.contentView addSubview:_topImage];
        _btn1 = [[UIButton alloc]initWithFrame:CGRectMake(95, 10, 30, 30)];
        _btn1.hidden = YES;
        [self.topImage addSubview:_btn1];
    }
    
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [_btn1 setImage:[UIImage imageNamed:@"selectedButton"]forState:UIControlStateNormal];
//    [_btn1 setImage:[UIImage imageNamed:@"selectedButton"] forState:UIControlStateSelected];
//    [_btn1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
}

@end
