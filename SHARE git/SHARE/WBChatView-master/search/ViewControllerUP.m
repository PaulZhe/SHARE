//
//  ViewControllerUP.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/8/2.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "ViewControllerUP.h"
#import "LMJDropdownMenu.h"
#import "ViewControllerPicture.h"

@interface ViewControllerUP ()<LMJDropdownMenuDelegate>

@end

@implementation ViewControllerUP

@synthesize textView1;
@synthesize textView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.93f alpha:1.00f];
    
    //设置导航栏
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(pop)];self.navigationItem.leftBarButtonItem = item;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    LMJDropdownMenu * dropdownMenu = [[LMJDropdownMenu alloc] init];
    dropdownMenu.layer.masksToBounds = YES;
    dropdownMenu.layer.borderWidth = 1;
    dropdownMenu.layer.borderColor = [UIColor blackColor].CGColor;
    [dropdownMenu.layer setMasksToBounds:YES];
    [dropdownMenu.layer setCornerRadius:5];
    [dropdownMenu setFrame:CGRectMake(255, 155, 110, 33)];
    [dropdownMenu setMenuTitles:@[@"设计资料",@"设计师观点",@"设计教程"] rowHeight:30];
    dropdownMenu.tintColor = [UIColor colorWithRed:0.81f green:0.80f blue:0.80f alpha:1.00f];
    dropdownMenu.delegate = self;
    [self.view addSubview:dropdownMenu];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(251, 105, 110, 30)];
    imageView.image = [UIImage imageNamed:@"定位.jpg"];
    [self.view addSubview:imageView];
    
    UIButton *selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [selectButton setImage:[UIImage imageNamed:@"选择图片.jpg"] forState:UIControlStateNormal];
    [selectButton addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    selectButton.frame = CGRectMake(15, 84, 220, 127);
    [self.view addSubview:selectButton];
    
    //设置Button
    UIButton * btn1_1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1_1 setTitle:@"平面设计" forState:UIControlStateNormal];
    btn1_1.layer.cornerRadius = 5;
    btn1_1.frame = CGRectMake(10, 241, 91, 35);
    [btn1_1 setBackgroundColor:[UIColor whiteColor]];
    btn1_1.tintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    [btn1_1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1_1 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn1_1 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1_1];
    
    UIButton * btn1_2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1_2 setTitle:@"网页设计" forState:UIControlStateNormal];
    btn1_2.layer.cornerRadius = 5;
    btn1_2.tintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    btn1_2.frame = CGRectMake(111, 241, 91, 35);
    [btn1_2 setBackgroundColor:[UIColor whiteColor]];
    [btn1_2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1_2 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn1_2 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1_2];
    
    UIButton * btn1_3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1_3 setTitle:@"UI/icon" forState:UIControlStateNormal];
    btn1_3.layer.cornerRadius = 5;
    btn1_3.frame = CGRectMake(212, 241, 91, 35);
    [btn1_3 setBackgroundColor:[UIColor whiteColor]];
    btn1_3.tintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    [btn1_3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1_3 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn1_3 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1_3];
    
    UIButton * btn1_4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1_4 setTitle:@"绘画/手绘" forState:UIControlStateNormal];
    btn1_4.layer.cornerRadius = 5;
    btn1_4.frame = CGRectMake(313, 241, 91, 35);
    [btn1_4 setBackgroundColor:[UIColor whiteColor]];
    btn1_4.tintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    [btn1_4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1_4 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn1_4 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1_4];
    
    
    UIButton * btn1_5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1_5 setTitle:@"虚拟与设计" forState:UIControlStateNormal];
    btn1_5.layer.cornerRadius = 5;
    btn1_5.frame = CGRectMake(10, 291, 91, 35);
    btn1_5.tintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    [btn1_5 setBackgroundColor:[UIColor whiteColor]];
    [btn1_5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1_5 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn1_5 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1_5];
    
    UIButton * btn1_6 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1_6 setTitle:@"影视" forState:UIControlStateNormal];
    btn1_6.layer.cornerRadius = 5;
    btn1_6.frame = CGRectMake(111, 291, 91, 35);
    [btn1_6 setBackgroundColor:[UIColor whiteColor]];
    btn1_6.tintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    [btn1_6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1_6 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn1_6 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1_6];
    
    UIButton * btn1_7 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1_7 setTitle:@"摄影" forState:UIControlStateNormal];
    btn1_7.layer.cornerRadius = 5;
    btn1_7.frame = CGRectMake(212, 291, 91, 35);
    btn1_7.tintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    [btn1_7 setBackgroundColor:[UIColor whiteColor]];
    [btn1_7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1_7 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn1_7 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1_7];
    
    UIButton * btn1_8 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1_8 setTitle:@"其他" forState:UIControlStateNormal];
    btn1_8.layer.cornerRadius = 5;
    btn1_8.frame = CGRectMake(313, 291, 91, 35);
    [btn1_8 setBackgroundColor:[UIColor whiteColor]];
    btn1_8.tintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    [btn1_8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1_8 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn1_8 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1_8];
    
    
    
    //设置UITextView CGRectMake(0, 341, 414, 34) CGRectMake(15, 7, 100, 20)
//    textViewPlaceholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 7, 100, 20)];
//    textViewPlaceholderLabel.text = @"作品名称";
//    textViewPlaceholderLabel.font = [UIFont systemFontOfSize:12];
//    textViewPlaceholderLabel.textColor = [UIColor lightGrayColor];
//    textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 341, 414, 34)];
//    textView.delegate = self;
//    textView.backgroundColor = [UIColor whiteColor];
//    textView.layer.borderWidth = 1.0f;
//    textView.layer.borderColor = [UIColor clearColor].CGColor;
//    [self.textView addSubview: textViewPlaceholderLabel];
//    [self.view addSubview: textView];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 341, 414, 34)];
    textField.placeholder = @"    作品名称";
    textField.backgroundColor = [UIColor whiteColor];
    [self.view addSubview: textField];
    
    textViewPlaceholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 7, 300, 20)];
    textViewPlaceholderLabel.text = @"请添加作品说明/文章内容......";
    textViewPlaceholderLabel.font = [UIFont systemFontOfSize:17];
    textViewPlaceholderLabel.textColor = [UIColor colorWithRed:0.80f green:0.79f blue:0.82f alpha:1.00f];
    textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 390, 414, 110)];
    textView.delegate = self;
    textView.backgroundColor = [UIColor whiteColor];
    textView.layer.borderWidth = 1.0f;
    textView.layer.borderColor = [UIColor clearColor].CGColor;
    [self.textView addSubview: textViewPlaceholderLabel];
    [self.view addSubview: textView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(15, 515, 384, 50);
    [button setTitle:@"发布" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:22];
    button.backgroundColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    [self.view addSubview:button];
    
    //设置checkbox
    UIButton *checkBoxButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *uncheckedImage = [UIImage imageNamed:@"checkbox_unchecked"];
    UIImage *checkedImage = [UIImage imageNamed:@"checkbox_checked"];
    [checkBoxButton setImage:uncheckedImage forState:UIControlStateNormal];
    [checkBoxButton setImage:checkedImage forState:UIControlStateSelected];
    [checkBoxButton addTarget:self action:@selector(checkBoxClick:) forControlEvents:UIControlEventTouchUpInside];
    checkBoxButton.frame = CGRectMake(15, 580, 15, 15);
    [self.view addSubview:checkBoxButton];
    
    UILabel *checkBoxLable = [[UILabel alloc] initWithFrame:CGRectMake(35, 580, 64, 15)];
    checkBoxLable.text = @"禁止下载";
    checkBoxLable.font = [UIFont systemFontOfSize:14];
    checkBoxLable.textColor = [UIColor blackColor];
    [self.view addSubview:checkBoxLable];
}

-(void)click
{
    ViewControllerPicture *vcPicture = [[ViewControllerPicture alloc] init];
    [self.navigationController pushViewController:vcPicture animated:YES];
}

-(void)press:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if(btn.selected == YES){
        btn.backgroundColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    } else{
        btn.backgroundColor = [UIColor whiteColor];
    }
}

- (void)pop
{
    [self.navigationController popViewControllerAnimated:YES];
}

//设置textView的placeholder

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    //[text isEqualToString:@""] 表示输入的是退格键
    if (![text isEqualToString:@""])
    {
        textViewPlaceholderLabel.hidden = YES;
    }
    //range.location == 0 && range.length == 1 表示输入的是第一个字符
    if ([text isEqualToString:@""] && range.location == 0 && range.length == 1)
    {
        textViewPlaceholderLabel.hidden = NO;
    }
    return YES;
}

//点击屏幕空白处调用此函数
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //使虚拟键盘回收，不再作为第一消息响应
    [self.textView resignFirstResponder];
    [self.textView1 resignFirstResponder];
    
}

-(void)checkBoxClick:(UIButton *)checkBoxButton
{
    checkBoxButton.selected = !checkBoxButton.selected;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
