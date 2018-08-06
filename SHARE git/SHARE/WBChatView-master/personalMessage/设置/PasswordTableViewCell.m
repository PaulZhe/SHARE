//
//  PasswordTableViewCell.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/8/2.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "PasswordTableViewCell.h"

@implementation PasswordTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //创建一个文本输入区对象
        self.textField = [[UITextField alloc] init];
        self.label = [[UILabel alloc] init];

        [self addSubview:self.textField];
        [self addSubview:self.label];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //确定文本输入区的位置
    self.textField.frame = CGRectMake(120, 0, 296, 50);
    self.label.frame = CGRectMake(40, 10, 70, 30);
    //设置字体的颜色
    self.textField.textColor = [UIColor blackColor];
    
    //设置边框风格
    //UITextBorderStyleRoundedRect：圆角风格
    //UITextBorderStyleLine：线框风格
    //UITextBorderStyleBezel：bezel线框
    //UITextBorderStyleNone：无边框风格
    self.textField.borderStyle = UITextBorderStyleNone;
    
    //设置虚拟键盘风格
    //UIKeyboardTypeDefault：默认风格
    //UIKeyboardTypeNamePhonePad：字母和数字组合风格
    //UIKeyboardTypeNumberPad：纯数字风格
    self.textField.keyboardType = UIKeyboardTypeDefault;
}


//点击屏幕空白处调用此函数
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //使虚拟键盘回收，不再作为第一消息响应
    [self.textField resignFirstResponder];
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
