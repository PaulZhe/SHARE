//
//  ViewControllerSearch.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/7/30.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "ViewControllerSearch.h"
#import "ViewControllerUP.h"
#import "DabaiViewController.h"

@interface ViewControllerSearch ()<UISearchBarDelegate>

@end

@implementation ViewControllerSearch
@synthesize searchBar;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    
    //设置导航栏
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:nil];
    self.navigationItem.leftBarButtonItem = item;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    UIBarButtonItem *itemright = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"上传"] style:UIBarButtonItemStylePlain target:self action:@selector(push)];
    self.navigationItem.rightBarButtonItem = itemright;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    //设置搜索框
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, 80, 396, 50)];
    searchBar.searchBarStyle = UISearchBarStyleProminent;
    searchBar.backgroundColor = [UIColor whiteColor];
    self.searchBar.delegate = self;
    //将搜索栏边框的灰色设置白色
    for (UIView *view in self.searchBar.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UIView")]&&view.subviews.count>0) {
            view.backgroundColor = [UIColor whiteColor];
            [[view.subviews objectAtIndex:0] removeFromSuperview];
            break;
        }
    }
    searchBar.text = @"搜索 用户名 作品分类 文章";

    [self.view addSubview:searchBar];

    UIImage *image0 = [UIImage imageNamed:@"home_line"];
    UIImage *image1 = [UIImage imageNamed:@"picture1"];
    UIImage *image2 = [UIImage imageNamed:@"picture2"];
    UIImage *image3 = [UIImage imageNamed:@"picture3"];
    UIImageView *imageView0_1 = [[UIImageView alloc] initWithImage:image0];
    UIImageView *imageView0_2 = [[UIImageView alloc] initWithImage:image0];
    UIImageView *imageView0_3 = [[UIImageView alloc] initWithImage:image0];
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:image1];
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:image2];
    UIImageView *imageView3 = [[UIImageView alloc] initWithImage:image3];
    imageView1.frame = CGRectMake(10, 146, 80, 24);
    imageView0_1.frame = CGRectMake(10, 170, 396, 1);
    imageView2.frame = CGRectMake(10, 298, 80, 24);
    imageView0_2.frame = CGRectMake(10, 322, 396, 1);
    imageView3.frame = CGRectMake(10, 394, 80, 24);
    imageView0_3.frame = CGRectMake(10, 418, 396, 1);
    [self.view addSubview:imageView1];
    [self.view addSubview:imageView2];
    [self.view addSubview:imageView3];
    [self.view addSubview:imageView0_1];
    [self.view addSubview:imageView0_2];
    [self.view addSubview:imageView0_3];
    
    
    //设置Button
    UIButton * btn1_1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1_1 setTitle:@"平面设计" forState:UIControlStateNormal];
    btn1_1.layer.cornerRadius = 5;
    btn1_1.frame = CGRectMake(10, 186, 91, 40);
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
    btn1_2.frame = CGRectMake(111, 186, 91, 40);
    [btn1_2 setBackgroundColor:[UIColor whiteColor]];
    [btn1_2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1_2 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn1_2 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1_2];
    
    UIButton * btn1_3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1_3 setTitle:@"UI/icon" forState:UIControlStateNormal];
    btn1_3.layer.cornerRadius = 5;
    btn1_3.frame = CGRectMake(212, 186, 91, 40);
    [btn1_3 setBackgroundColor:[UIColor whiteColor]];
    btn1_3.tintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    [btn1_3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1_3 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn1_3 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1_3];
    
    UIButton * btn1_4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1_4 setTitle:@"绘画/手绘" forState:UIControlStateNormal];
    btn1_4.layer.cornerRadius = 5;
    btn1_4.frame = CGRectMake(313, 186, 91, 40);
    [btn1_4 setBackgroundColor:[UIColor whiteColor]];
    btn1_4.tintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    [btn1_4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1_4 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn1_4 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1_4];
    
    
    UIButton * btn1_5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1_5 setTitle:@"虚拟与设计" forState:UIControlStateNormal];
    btn1_5.layer.cornerRadius = 5;
    btn1_5.frame = CGRectMake(10, 242, 91, 40);
    btn1_5.tintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    [btn1_5 setBackgroundColor:[UIColor whiteColor]];
    [btn1_5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1_5 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn1_5 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1_5];
    
    UIButton * btn1_6 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1_6 setTitle:@"影视" forState:UIControlStateNormal];
    btn1_6.layer.cornerRadius = 5;
    btn1_6.frame = CGRectMake(111, 242, 91, 40);
    [btn1_6 setBackgroundColor:[UIColor whiteColor]];
    btn1_6.tintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    [btn1_6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1_6 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn1_6 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1_6];
    
    UIButton * btn1_7 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1_7 setTitle:@"摄影" forState:UIControlStateNormal];
    btn1_7.layer.cornerRadius = 5;
    btn1_7.frame = CGRectMake(212, 242, 91, 40);
    btn1_7.tintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    [btn1_7 setBackgroundColor:[UIColor whiteColor]];
    [btn1_7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1_7 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn1_7 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1_7];
    
    UIButton * btn1_8 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1_8 setTitle:@"其他" forState:UIControlStateNormal];
    btn1_8.layer.cornerRadius = 5;
    btn1_8.frame = CGRectMake(313, 242, 91, 40);
    [btn1_8 setBackgroundColor:[UIColor whiteColor]];
    btn1_8.tintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    [btn1_8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1_8 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn1_8 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1_8];
    
    
    UIButton * btn2_1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2_1 setTitle:@"人气最高" forState:UIControlStateNormal];
    btn2_1.layer.cornerRadius = 5;
    btn2_1.frame = CGRectMake(10, 338, 91, 40);
    [btn2_1 setBackgroundColor:[UIColor whiteColor]];
    btn2_1.tintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    [btn2_1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2_1 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn2_1 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2_1];
    
    UIButton * btn2_2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2_2 setTitle:@"收藏最多" forState:UIControlStateNormal];
    btn2_2.layer.cornerRadius = 5;
    btn2_2.frame = CGRectMake(111, 338, 91, 40);
    [btn2_2 setBackgroundColor:[UIColor whiteColor]];
    btn2_2.tintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    [btn2_2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2_2 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn2_2 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2_2];
    
    UIButton * btn2_3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2_3 setTitle:@"评论最多" forState:UIControlStateNormal];
    btn2_3.layer.cornerRadius = 5;
    btn2_3.frame = CGRectMake(212, 338, 91, 40);
    [btn2_3 setBackgroundColor:[UIColor whiteColor]];
    btn2_3.tintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    [btn2_3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2_3 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn2_3 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2_3];
    
    UIButton * btn2_4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2_4 setTitle:@"编辑精选" forState:UIControlStateNormal];
    btn2_4.layer.cornerRadius = 5;
    btn2_4.frame = CGRectMake(313, 338, 91, 40);
    [btn2_4 setBackgroundColor:[UIColor whiteColor]];
    btn2_4.tintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    [btn2_4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2_4 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn2_4 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2_4];
    
    
    UIButton * btn3_1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn3_1 setTitle:@"30分钟前" forState:UIControlStateNormal];
    btn3_1.layer.cornerRadius = 5;
    btn3_1.frame = CGRectMake(10, 434, 91, 40);
    btn3_1.tintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    [btn3_1 setBackgroundColor:[UIColor whiteColor]];
    [btn3_1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3_1 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn3_1 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3_1];
    
    UIButton * btn3_2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn3_2 setTitle:@"1小时前" forState:UIControlStateNormal];
    btn3_2.layer.cornerRadius = 5;
    btn3_2.frame = CGRectMake(111, 434, 91, 40);
    [btn3_2 setBackgroundColor:[UIColor whiteColor]];
    btn3_2.tintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    [btn3_2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3_2 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn3_2 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3_2];
    
    UIButton * btn3_3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn3_3 setTitle:@"1月前" forState:UIControlStateNormal];
    btn3_3.layer.cornerRadius = 5;
    btn3_3.frame = CGRectMake(212, 434, 91, 40);
    [btn3_3 setBackgroundColor:[UIColor whiteColor]];
    btn3_3.tintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    [btn3_3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3_3 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn3_3 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3_3];
    
    UIButton * btn3_4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn3_4 setTitle:@"1年前" forState:UIControlStateNormal];
    btn3_4.layer.cornerRadius = 5;
    btn3_4.frame = CGRectMake(313, 434, 91, 40);
    [btn3_4 setBackgroundColor:[UIColor whiteColor]];
    btn3_4.tintColor = [UIColor colorWithRed:0.12f green:0.54f blue:0.80f alpha:1.00f];
    [btn3_4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3_4 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [btn3_4 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3_4];
}

-(void)push{
    ViewControllerUP *vcUP = [[ViewControllerUP alloc] init];
    [self.navigationController pushViewController:vcUP animated:YES];
}

- (void)pop
{
    [self.navigationController popViewControllerAnimated:YES];
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

//点击屏幕空白处调用此函数
-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //使虚拟键盘回收，不再作为第一消息响应
    [self.searchBar resignFirstResponder];

}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    if([searchBar.text isEqualToString:@"大白"]) {
        DabaiViewController *vcDabai = [[DabaiViewController alloc] init];
        [self.navigationController pushViewController:vcDabai animated:YES];
    }

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
