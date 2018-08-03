//
//  DabaiViewController.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/8/2.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "DabaiViewController.h"
#import "HomePageTableViewCell.h"
#import "ViewControllerUP.h"

@interface DabaiViewController ()

@end

@implementation DabaiViewController
@synthesize searchBar;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    
    //设置导航栏
    self.title = @"搜索";
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(pop)];
    self.navigationItem.leftBarButtonItem = item;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    UIBarButtonItem *itemright = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"上传"] style:UIBarButtonItemStylePlain target:self action:@selector(push)];
    self.navigationItem.rightBarButtonItem = itemright;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    //设置搜索框
    searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, 16, 396, 50)];
    searchBar.searchBarStyle = UISearchBarStyleProminent;
    searchBar.backgroundColor = [UIColor whiteColor];
    //将搜索栏边框的灰色设置白色
    for (UIView *view in self.searchBar.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UIView")]&&view.subviews.count>0) {
            view.backgroundColor = [UIColor whiteColor];
            [[view.subviews objectAtIndex:0] removeFromSuperview];
            break;
        }
    }
    searchBar.text = @"大白";
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 80, 414, 82)];
    titleView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    [titleView addSubview:searchBar];
    
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(7, 10, 400, 571)];
    _tableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[HomePageTableViewCell class] forCellReuseIdentifier:@"homePageCell"];
    
    self.tableView.tableHeaderView = titleView;
    
    [self.view addSubview:_tableView];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 142;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0){
        HomePageTableViewCell *cell0 = [tableView dequeueReusableCellWithIdentifier:@"homePageCell" forIndexPath:indexPath];
        
        UIImage *image0  = [UIImage imageNamed:@"大白1.jpg"];
        UIImage *image1  = [UIImage imageNamed:@"button_zan"];
        UIImage *image2  = [UIImage imageNamed:@"button_guanzhu"];
        UIImage *image3  = [UIImage imageNamed:@"button_share"];
        
        cell0.homePageImageView0.image = image0;
        
        [cell0.homePageButton1 setImage:image1 forState:UIControlStateNormal];
        [cell0.homePageButton1 setTitle:@"102" forState:UIControlStateNormal];
        [cell0.homePageButton1 setTitle:@"103" forState:UIControlStateSelected];
        [cell0.homePageButton1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell0.homePageButton2 setImage:image2 forState:UIControlStateNormal];
        [cell0.homePageButton2 setTitle:@"26" forState:UIControlStateNormal];
        
        [cell0.homePageButton3 setImage:image3 forState:UIControlStateNormal];
        [cell0.homePageButton3 setTitle:@"20" forState:UIControlStateNormal];
        
        cell0.homePageLabel0.text = @"Icon of Baymax";
        cell0.homePageLabel1.text = @"share小白";
        cell0.homePageLabel2.text = @"原创-UI-icon";
        cell0.homePageLabel3.text = @"15分钟前";
        
        return cell0;
    } else{
        HomePageTableViewCell *cell0 = [tableView dequeueReusableCellWithIdentifier:@"homePageCell" forIndexPath:indexPath];
        
        UIImage *image0  = [UIImage imageNamed:@"大白2.jpg"];
        UIImage *image1  = [UIImage imageNamed:@"button_zan"];
        UIImage *image2  = [UIImage imageNamed:@"button_guanzhu"];
        UIImage *image3  = [UIImage imageNamed:@"button_share"];
        
        cell0.homePageImageView0.image = image0;
        
        [cell0.homePageButton1 setImage:image1 forState:UIControlStateNormal];
        [cell0.homePageButton1 setTitle:@"102" forState:UIControlStateNormal];
        [cell0.homePageButton1 setTitle:@"103" forState:UIControlStateSelected];
        [cell0.homePageButton1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell0.homePageButton2 setImage:image2 forState:UIControlStateNormal];
        [cell0.homePageButton2 setTitle:@"26" forState:UIControlStateNormal];
        
        [cell0.homePageButton3 setImage:image3 forState:UIControlStateNormal];
        [cell0.homePageButton3 setTitle:@"20" forState:UIControlStateNormal];
        
        cell0.homePageLabel0.text = @"每个人都需要一个大白";
        cell0.homePageLabel1.text = @"share小王";
        cell0.homePageLabel2.text = @"原创作品-摄影";
        cell0.homePageLabel3.text = @"一个月前";
        
        return cell0;
    }
}
    
-(void)click:(UIButton*) button
{
    button.selected = !button.selected;
}

- (void)pop
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)push{
    ViewControllerUP *vcUP = [[ViewControllerUP alloc] init];
    [self.navigationController pushViewController:vcUP animated:YES];
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
