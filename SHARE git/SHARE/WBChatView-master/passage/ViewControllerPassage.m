//
//  ViewControllerPassage.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/7/30.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "ViewControllerPassage.h"

@interface ViewControllerPassage ()

@end

@implementation ViewControllerPassage
@synthesize segmentedControl;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置导航栏
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:nil];self.navigationItem.leftBarButtonItem = item;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.title = @"文章";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    // 设置segmentedControl
    NSArray *array = [NSArray arrayWithObjects:@"精选文章", @"热门推荐", @"全部文章", nil];
    segmentedControl = [[UISegmentedControl alloc] initWithItems:array];
    [segmentedControl setBackgroundColor:[UIColor colorWithRed:0.35f green:0.36f blue:0.36f alpha:1.00f]];
    [segmentedControl setTintColor:[UIColor colorWithRed:0.35f green:0.36f blue:0.36f alpha:1.00f]];
    NSDictionary *dic1 = @{
                           //1.设置字体样式:例如黑体,和字体大小
                           NSFontAttributeName:[UIFont systemFontOfSize:18],
                           //2.字体颜色
                           NSForegroundColorAttributeName:[UIColor whiteColor]
                           };
    NSDictionary *dic2 = @{
                           //1.设置字体样式:例如黑体,和字体大小
                           NSFontAttributeName:[UIFont systemFontOfSize:18],
                           //2.字体颜色
                           NSForegroundColorAttributeName:[UIColor colorWithRed:0.66f green:0.67f blue:0.67f alpha:1.00f]
                           };
    [segmentedControl setTitleTextAttributes:dic1 forState:UIControlStateNormal];
    [segmentedControl setTitleTextAttributes:dic2 forState:UIControlStateSelected];
    segmentedControl.frame = CGRectMake(0, 64, 414, 41);
    
    [segmentedControl addTarget:self action:@selector(selected:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];

    UIImageView *lineImageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(137, 5, 3, 31)];
    UIImageView *lineImageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(275, 5, 3, 31)];
    lineImageView1.image = [UIImage imageNamed:@"essay_line"];
    lineImageView2.image = [UIImage imageNamed:@"essay_line"];
    
    [segmentedControl addSubview:lineImageView1];
    [segmentedControl addSubview:lineImageView2];
    
    
    //设置tabelView和scrollView
    [self initBackGroundView];
    
    // Do any additional setup after loading the view.
}

-(void)initBackGroundView
{
    //tableView后的滚动条
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 105, 414, 571)];
    _scrollView.contentSize=CGSizeMake(414*3, 615);
    _scrollView.delegate=self;
    _scrollView.pagingEnabled=YES;
    _scrollView.showsVerticalScrollIndicator=YES;
    _scrollView.bounces=NO;
    _scrollView.directionalLockEnabled = YES;
    [self.view addSubview:_scrollView];
    //tableView1
    _tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 10, 414, 571)];
    _tableView.tag=1;
    _tableView.delegate=self;
    _tableView.dataSource=self;
    _tableView.scrollEnabled=NO;
    [_scrollView addSubview:_tableView];
    //tableView2
    _tableView2=[[UITableView alloc]initWithFrame:CGRectMake(418, 10, 414, 571)];
    _tableView2.tag=2;
    _tableView2.delegate=self;
    _tableView2.dataSource=self;
    _tableView2.scrollEnabled=NO;
    [_scrollView addSubview:_tableView2];
    //tableView3
    _tableView3=[[UITableView alloc]initWithFrame:CGRectMake(830, 10, 414, 571)];
    _tableView3.tag=3;
    _tableView3.delegate=self;
    _tableView3.dataSource=self;
    _tableView3.scrollEnabled=NO;
    [_scrollView addSubview:_tableView3];
    [self.tableView registerClass:[HomePageTableViewCell class] forCellReuseIdentifier:@"homePageCell"];
    [self.tableView2 registerClass:[HomePageTableViewCell class] forCellReuseIdentifier:@"homePageCell"];
    [self.tableView3 registerClass:[HomePageTableViewCell class] forCellReuseIdentifier:@"homePageCell"];
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
    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (tableView.tag==1){
        if(indexPath.section == 0){
            HomePageTableViewCell *cell0 = [tableView dequeueReusableCellWithIdentifier:@"homePageCell" forIndexPath:indexPath];
            
            UIImage *image0  = [UIImage imageNamed:@"list_img1"];
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
            
            cell0.homePageLabel0.text = @"假日";
            cell0.homePageLabel1.text = @"share小白";
            cell0.homePageLabel2.text = @"原创-插画-练习习作";
            cell0.homePageLabel3.text = @"15分钟前";
            
            return cell0;
        } else if(indexPath.section == 1){
            HomePageTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"homePageCell" forIndexPath:indexPath];
            
            UIImage *image0  = [UIImage imageNamed:@"list_img2"];
            UIImage *image1  = [UIImage imageNamed:@"button_zan"];
            UIImage *image2  = [UIImage imageNamed:@"button_guanzhu"];
            UIImage *image3  = [UIImage imageNamed:@"button_share"];
            
            cell1.homePageImageView0.image = image0;
            
            [cell1.homePageButton1 setImage:image1 forState:UIControlStateNormal];
            [cell1.homePageButton1 setTitle:@"102" forState:UIControlStateNormal];
            [cell1.homePageButton1 setTitle:@"103" forState:UIControlStateSelected];
            [cell1.homePageButton1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell1.homePageButton2 setImage:image2 forState:UIControlStateNormal];
            [cell1.homePageButton2 setTitle:@"26" forState:UIControlStateNormal];
            
            [cell1.homePageButton3 setImage:image3 forState:UIControlStateNormal];
            [cell1.homePageButton3 setTitle:@"20" forState:UIControlStateNormal];
            
            cell1.homePageLabel0.text = @"国外画册欣赏";
            cell1.homePageLabel1.text = @"share小王";
            cell1.homePageLabel2.text = @"平面设计-画册设计";
            cell1.homePageLabel3.text = @"16分钟前";
            
            return cell1;
        } else if(indexPath.section == 2){
            HomePageTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"homePageCell" forIndexPath:indexPath];
            
            UIImage *image0  = [UIImage imageNamed:@"list_img3"];
            UIImage *image1  = [UIImage imageNamed:@"button_zan"];
            UIImage *image2  = [UIImage imageNamed:@"button_guanzhu"];
            UIImage *image3  = [UIImage imageNamed:@"button_share"];
            
            cell1.homePageImageView0.image = image0;
            
            [cell1.homePageButton1 setImage:image1 forState:UIControlStateNormal];
            [cell1.homePageButton1 setTitle:@"102" forState:UIControlStateNormal];
            [cell1.homePageButton1 setTitle:@"103" forState:UIControlStateSelected];
            [cell1.homePageButton1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell1.homePageButton2 setImage:image2 forState:UIControlStateNormal];
            [cell1.homePageButton2 setTitle:@"26" forState:UIControlStateNormal];
            
            [cell1.homePageButton3 setImage:image3 forState:UIControlStateNormal];
            [cell1.homePageButton3 setTitle:@"20" forState:UIControlStateNormal];
            
            cell1.homePageLabel0.text = @"collection扁平设计";
            cell1.homePageLabel1.text = @"share小吕";
            cell1.homePageLabel2.text = @"平面设计-画册设计";
            cell1.homePageLabel3.text = @"17分钟前";
            
            return cell1;
        } else{
            HomePageTableViewCell *cell3 = [tableView dequeueReusableCellWithIdentifier:@"homePageCell" forIndexPath:indexPath];
            
            UIImage *image0  = [UIImage imageNamed:@"list_img4"];
            UIImage *image1  = [UIImage imageNamed:@"button_zan"];
            UIImage *image2  = [UIImage imageNamed:@"button_guanzhu"];
            UIImage *image3  = [UIImage imageNamed:@"button_share"];
            
            cell3.homePageImageView0.image = image0;
            
            [cell3.homePageButton1 setImage:image1 forState:UIControlStateNormal];
            [cell3.homePageButton1 setTitle:@"102" forState:UIControlStateNormal];
            [cell3.homePageButton1 setTitle:@"103" forState:UIControlStateSelected];
            [cell3.homePageButton1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell3.homePageButton2 setImage:image2 forState:UIControlStateNormal];
            [cell3.homePageButton2 setTitle:@"26" forState:UIControlStateNormal];
            
            [cell3.homePageButton3 setImage:image3 forState:UIControlStateNormal];
            [cell3.homePageButton3 setTitle:@"20" forState:UIControlStateNormal];
            
            cell3.homePageLabel0.text = @"邮报";
            cell3.homePageLabel1.text = @"share小黑";
            cell3.homePageLabel2.text = @"平面设计-画册设计";
            cell3.homePageLabel3.text = @"18分钟前";
            
            return cell3;
        }
    }else if(tableView.tag==2){
        if(indexPath.section == 1){
            HomePageTableViewCell *cell0 = [tableView dequeueReusableCellWithIdentifier:@"homePageCell" forIndexPath:indexPath];
            
            UIImage *image0  = [UIImage imageNamed:@"list_img1"];
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
            
            cell0.homePageLabel0.text = @"假日";
            cell0.homePageLabel1.text = @"share小白";
            cell0.homePageLabel2.text = @"原创-插画-练习习作";
            cell0.homePageLabel3.text = @"15分钟前";
            
            return cell0;
        } else if(indexPath.section == 0){
            HomePageTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"homePageCell" forIndexPath:indexPath];
            
            UIImage *image0  = [UIImage imageNamed:@"list_img2"];
            UIImage *image1  = [UIImage imageNamed:@"button_zan"];
            UIImage *image2  = [UIImage imageNamed:@"button_guanzhu"];
            UIImage *image3  = [UIImage imageNamed:@"button_share"];
            
            cell1.homePageImageView0.image = image0;
            
            [cell1.homePageButton1 setImage:image1 forState:UIControlStateNormal];
            [cell1.homePageButton1 setTitle:@"102" forState:UIControlStateNormal];
            [cell1.homePageButton1 setTitle:@"103" forState:UIControlStateSelected];
            [cell1.homePageButton1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell1.homePageButton2 setImage:image2 forState:UIControlStateNormal];
            [cell1.homePageButton2 setTitle:@"26" forState:UIControlStateNormal];
            
            [cell1.homePageButton3 setImage:image3 forState:UIControlStateNormal];
            [cell1.homePageButton3 setTitle:@"20" forState:UIControlStateNormal];
            
            cell1.homePageLabel0.text = @"国外画册欣赏";
            cell1.homePageLabel1.text = @"share小王";
            cell1.homePageLabel2.text = @"平面设计-画册设计";
            cell1.homePageLabel3.text = @"16分钟前";
            
            return cell1;
        } else if(indexPath.section == 3){
            HomePageTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"homePageCell" forIndexPath:indexPath];
            
            UIImage *image0  = [UIImage imageNamed:@"list_img3"];
            UIImage *image1  = [UIImage imageNamed:@"button_zan"];
            UIImage *image2  = [UIImage imageNamed:@"button_guanzhu"];
            UIImage *image3  = [UIImage imageNamed:@"button_share"];
            
            cell1.homePageImageView0.image = image0;
            
            [cell1.homePageButton1 setImage:image1 forState:UIControlStateNormal];
            [cell1.homePageButton1 setTitle:@"102" forState:UIControlStateNormal];
            [cell1.homePageButton1 setTitle:@"103" forState:UIControlStateSelected];
            [cell1.homePageButton1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell1.homePageButton2 setImage:image2 forState:UIControlStateNormal];
            [cell1.homePageButton2 setTitle:@"26" forState:UIControlStateNormal];
            
            [cell1.homePageButton3 setImage:image3 forState:UIControlStateNormal];
            [cell1.homePageButton3 setTitle:@"20" forState:UIControlStateNormal];
            
            cell1.homePageLabel0.text = @"collection扁平设计";
            cell1.homePageLabel1.text = @"share小吕";
            cell1.homePageLabel2.text = @"平面设计-画册设计";
            cell1.homePageLabel3.text = @"17分钟前";
            
            return cell1;
        } else{
            HomePageTableViewCell *cell3 = [tableView dequeueReusableCellWithIdentifier:@"homePageCell" forIndexPath:indexPath];
            
            UIImage *image0  = [UIImage imageNamed:@"list_img4"];
            UIImage *image1  = [UIImage imageNamed:@"button_zan"];
            UIImage *image2  = [UIImage imageNamed:@"button_guanzhu"];
            UIImage *image3  = [UIImage imageNamed:@"button_share"];
            
            cell3.homePageImageView0.image = image0;
            
            [cell3.homePageButton1 setImage:image1 forState:UIControlStateNormal];
            [cell3.homePageButton1 setTitle:@"102" forState:UIControlStateNormal];
            [cell3.homePageButton1 setTitle:@"103" forState:UIControlStateSelected];
            [cell3.homePageButton1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell3.homePageButton2 setImage:image2 forState:UIControlStateNormal];
            [cell3.homePageButton2 setTitle:@"26" forState:UIControlStateNormal];
            
            [cell3.homePageButton3 setImage:image3 forState:UIControlStateNormal];
            [cell3.homePageButton3 setTitle:@"20" forState:UIControlStateNormal];
            
            cell3.homePageLabel0.text = @"邮报";
            cell3.homePageLabel1.text = @"share小黑";
            cell3.homePageLabel2.text = @"平面设计-画册设计";
            cell3.homePageLabel3.text = @"18分钟前";
            
            return cell3;
        }
    } else{
        if(indexPath.section == 3){
            HomePageTableViewCell *cell0 = [tableView dequeueReusableCellWithIdentifier:@"homePageCell" forIndexPath:indexPath];
            
            UIImage *image0  = [UIImage imageNamed:@"list_img1"];
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
            
            cell0.homePageLabel0.text = @"假日";
            cell0.homePageLabel1.text = @"share小白";
            cell0.homePageLabel2.text = @"原创-插画-练习习作";
            cell0.homePageLabel3.text = @"15分钟前";
            
            return cell0;
        } else if(indexPath.section == 1){
            HomePageTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"homePageCell" forIndexPath:indexPath];
            
            UIImage *image0  = [UIImage imageNamed:@"list_img2"];
            UIImage *image1  = [UIImage imageNamed:@"button_zan"];
            UIImage *image2  = [UIImage imageNamed:@"button_guanzhu"];
            UIImage *image3  = [UIImage imageNamed:@"button_share"];
            
            cell1.homePageImageView0.image = image0;
            
            [cell1.homePageButton1 setImage:image1 forState:UIControlStateNormal];
            [cell1.homePageButton1 setTitle:@"102" forState:UIControlStateNormal];
            [cell1.homePageButton1 setTitle:@"103" forState:UIControlStateSelected];
            [cell1.homePageButton1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell1.homePageButton2 setImage:image2 forState:UIControlStateNormal];
            [cell1.homePageButton2 setTitle:@"26" forState:UIControlStateNormal];
            
            [cell1.homePageButton3 setImage:image3 forState:UIControlStateNormal];
            [cell1.homePageButton3 setTitle:@"20" forState:UIControlStateNormal];
            
            cell1.homePageLabel0.text = @"国外画册欣赏";
            cell1.homePageLabel1.text = @"share小王";
            cell1.homePageLabel2.text = @"平面设计-画册设计";
            cell1.homePageLabel3.text = @"16分钟前";
            
            return cell1;
        } else if(indexPath.section == 2){
            HomePageTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"homePageCell" forIndexPath:indexPath];
            
            UIImage *image0  = [UIImage imageNamed:@"list_img3"];
            UIImage *image1  = [UIImage imageNamed:@"button_zan"];
            UIImage *image2  = [UIImage imageNamed:@"button_guanzhu"];
            UIImage *image3  = [UIImage imageNamed:@"button_share"];
            
            cell1.homePageImageView0.image = image0;
            
            [cell1.homePageButton1 setImage:image1 forState:UIControlStateNormal];
            [cell1.homePageButton1 setTitle:@"102" forState:UIControlStateNormal];
            [cell1.homePageButton1 setTitle:@"103" forState:UIControlStateSelected];
            [cell1.homePageButton1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell1.homePageButton2 setImage:image2 forState:UIControlStateNormal];
            [cell1.homePageButton2 setTitle:@"26" forState:UIControlStateNormal];
            
            [cell1.homePageButton3 setImage:image3 forState:UIControlStateNormal];
            [cell1.homePageButton3 setTitle:@"20" forState:UIControlStateNormal];
            
            cell1.homePageLabel0.text = @"collection扁平设计";
            cell1.homePageLabel1.text = @"share小吕";
            cell1.homePageLabel2.text = @"平面设计-画册设计";
            cell1.homePageLabel3.text = @"17分钟前";
            
            return cell1;
        } else{
            HomePageTableViewCell *cell3 = [tableView dequeueReusableCellWithIdentifier:@"homePageCell" forIndexPath:indexPath];
            
            UIImage *image0  = [UIImage imageNamed:@"list_img4"];
            UIImage *image1  = [UIImage imageNamed:@"button_zan"];
            UIImage *image2  = [UIImage imageNamed:@"button_guanzhu"];
            UIImage *image3  = [UIImage imageNamed:@"button_share"];
            
            cell3.homePageImageView0.image = image0;
            
            [cell3.homePageButton1 setImage:image1 forState:UIControlStateNormal];
            [cell3.homePageButton1 setTitle:@"102" forState:UIControlStateNormal];
            [cell3.homePageButton1 setTitle:@"103" forState:UIControlStateSelected];
            [cell3.homePageButton1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            
            [cell3.homePageButton2 setImage:image2 forState:UIControlStateNormal];
            [cell3.homePageButton2 setTitle:@"26" forState:UIControlStateNormal];
            
            [cell3.homePageButton3 setImage:image3 forState:UIControlStateNormal];
            [cell3.homePageButton3 setTitle:@"20" forState:UIControlStateNormal];
            
            cell3.homePageLabel0.text = @"邮报";
            cell3.homePageLabel1.text = @"share小黑";
            cell3.homePageLabel2.text = @"平面设计-画册设计";
            cell3.homePageLabel3.text = @"18分钟前";
            
            return cell3;
        }
    }

}

-(void)click:(UIButton*) button
{
    button.selected = !button.selected;
}

-(void)selected:(id)sender{
    UISegmentedControl* control = (UISegmentedControl*)sender;
    switch (control.selectedSegmentIndex) {
        case 0:
            [_scrollView setContentOffset:CGPointMake(_scrollView.bounds.size.width*0, 0) animated:YES];
            break;
        case 1:
            [_scrollView setContentOffset:CGPointMake(_scrollView.bounds.size.width, 0) animated:YES];
            break;
        case 2:
            [_scrollView setContentOffset:CGPointMake(_scrollView.bounds.size.width*2, 0) animated:YES];
            break;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger *num;
    num = (NSInteger)(scrollView.contentOffset.x - 414)/414 +1;
    segmentedControl.selectedSegmentIndex = num;
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
