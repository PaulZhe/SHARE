//
//  ViewControllerRecommand.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/8/1.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "ViewControllerRecommand.h"
#import "HomePageTableViewCell.h"

@interface ViewControllerRecommand ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation ViewControllerRecommand

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置导航栏
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(pop)];
    self.navigationItem.leftBarButtonItem = item;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(7, 64, 400, 676) style:UITableViewStyleGrouped];
    [self.tableView registerClass:[HomePageTableViewCell class] forCellReuseIdentifier:@"homePageCell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    // Do any additional setup after loading the view.
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 142;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        HomePageTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"homePageCell" forIndexPath:indexPath];
        
        UIImage *image0  = [UIImage imageNamed:@"list_img1"];
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
        
        cell1.homePageLabel0.text = @"假日";
        cell1.homePageLabel1.text = @"share小白";
        cell1.homePageLabel2.text = @"原创-插画-练习习作";
        cell1.homePageLabel3.text = @"15分钟前";
        
        return cell1;
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
    } else if(indexPath.section == 3){
        HomePageTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"homePageCell" forIndexPath:indexPath];
        
        UIImage *image0  = [UIImage imageNamed:@"note_img3"];
        UIImage *image1  = [UIImage imageNamed:@"button_zan"];
        UIImage *image2  = [UIImage imageNamed:@"button_guanzhu"];
        UIImage *image3  = [UIImage imageNamed:@"button_share"];
        
        cell1.homePageImageView0.image = image0;
        
        [cell1.homePageButton1 setImage:image1 forState:UIControlStateNormal];
        [cell1.homePageButton1 setTitle:@"45" forState:UIControlStateNormal];
        [cell1.homePageButton1 setTitle:@"46" forState:UIControlStateSelected];
        [cell1.homePageButton1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell1.homePageButton2 setImage:image2 forState:UIControlStateNormal];
        [cell1.homePageButton2 setTitle:@"105" forState:UIControlStateNormal];
        
        [cell1.homePageButton3 setImage:image3 forState:UIControlStateNormal];
        [cell1.homePageButton3 setTitle:@"20" forState:UIControlStateNormal];
        
        cell1.homePageLabel0.text = @"collection扁平设计";
        cell1.homePageLabel1.text = @"share小律";
        cell1.homePageLabel2.text = @"设计文章-经验-设计观点";
        cell1.homePageLabel3.text = @"45分钟前";
        
        return cell1;
    }else{
        HomePageTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"homePageCell" forIndexPath:indexPath];
        
        UIImage *image0  = [UIImage imageNamed:@"list_img4"];
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
        
        cell1.homePageLabel0.text = @"邮报";
        cell1.homePageLabel1.text = @"share小黑";
        cell1.homePageLabel2.text = @"平面设计-画册设计";
        cell1.homePageLabel3.text = @"18分钟前";
        
        return cell1;
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
