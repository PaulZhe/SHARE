//
//  ArtViewController.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/7/31.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "ArtViewController.h"

@interface ArtViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation ArtViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, 414, 676) style:UITableViewStyleGrouped];
    
    //设置导航栏
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(pop)];self.navigationItem.leftBarButtonItem = item;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.title = @"SHARE";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return 84;
    } else{
        return 1443;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        UITableViewCell *cell0 = [tableView dequeueReusableCellWithIdentifier:@"cell0"];
        if(cell0 == nil){
            cell0 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell0"];
            
            UIImage *image1  = [UIImage imageNamed:@"button_zan"];
            UIImage *image2  = [UIImage imageNamed:@"button_guanzhu"];
            UIImage *image3  = [UIImage imageNamed:@"button_share"];
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(340, 20, 60, 20)];
            
            UIButton *artButton1 = [[UIButton alloc] initWithFrame:CGRectMake(234, 50, 60, 18)];
            UIButton *artButton2 = [[UIButton alloc] initWithFrame:CGRectMake(294, 50, 60, 18)];
            UIButton *artButton3 = [[UIButton alloc] initWithFrame:CGRectMake(354, 50, 60, 18)];
            
            [artButton1 setImage:image1 forState:UIControlStateNormal];
            [artButton1 setTitle:@"102" forState:UIControlStateNormal];
            
            [artButton2 setImage:image2 forState:UIControlStateNormal];
            [artButton2 setTitle:@"26" forState:UIControlStateNormal];
            
            [artButton3 setImage:image3 forState:UIControlStateNormal];
            [artButton3 setTitle:@"20" forState:UIControlStateNormal];
            
            [artButton1 setTitleColor:[UIColor colorWithRed:0.11f green:0.55f blue:0.80f alpha:1.00f] forState:UIControlStateNormal];
            [artButton2 setTitleColor:[UIColor colorWithRed:0.11f green:0.55f blue:0.80f alpha:1.00f] forState:UIControlStateNormal];
            [artButton3 setTitleColor:[UIColor colorWithRed:0.11f green:0.55f blue:0.80f alpha:1.00f] forState:UIControlStateNormal];
            
            label.text = @"15分钟前";
            label.font = [UIFont systemFontOfSize:14];
            
            [cell0.contentView addSubview:artButton1];
            [cell0.contentView addSubview:artButton2];
            [cell0.contentView addSubview:artButton3];
            [cell0.contentView addSubview:label];
        }
        cell0.imageView.image = [UIImage imageNamed:@"works_head"];
        cell0.textLabel.text = @"假日";
        cell0.detailTextLabel.text = @"share小白";
        
        return cell0;
    }else{
        UITableViewCell *cell1 = [_tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if(cell1 == nil){
            cell1 = [[UITableViewCell alloc] init];
            
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 7, 400, 12)];
            label.text = @"多希望列车能把我带到有你的城市。";
            label.font = [UIFont systemFontOfSize:14];
            
//            UIScrollView *sv = [[UIScrollView alloc] initWithFrame:CGRectMake(5, 24, 404, 546)];
//            sv.bounces = NO;
//            sv.contentSize = CGSizeMake(404, 1419);
            
            // 设置图片位置
            UIImage *worksImage1 = [UIImage imageNamed:@"works_img1"];
            UIImageView *worksImageView1 = [[UIImageView alloc] init];
            worksImageView1.image = worksImage1;
            worksImageView1.frame =CGRectMake(7, 24, 400, 231);
            [cell1.contentView addSubview:worksImageView1];
            
            UIImage *worksImage2 = [UIImage imageNamed:@"works_img2"];
            UIImageView *worksImageView2 = [[UIImageView alloc] init];
            worksImageView2.image = worksImage2;
            worksImageView2.frame =CGRectMake(7, 260, 400, 231);
            [cell1.contentView addSubview:worksImageView2];
            
            UIImage *worksImage3 = [UIImage imageNamed:@"works_img3"];
            UIImageView *worksImageView3 = [[UIImageView alloc] init];
            worksImageView3.image = worksImage3;
            worksImageView3.frame =CGRectMake(43, 496, 329, 466);
            [cell1.contentView addSubview:worksImageView3];
            
            UIImage *worksImage4 = [UIImage imageNamed:@"works_img4"];
            UIImageView *worksImageView4 = [[UIImageView alloc] init];
            worksImageView4.image = worksImage4;
            worksImageView4.frame =CGRectMake(43, 967, 329, 471);
            [cell1.contentView addSubview:worksImageView4];
            
            [cell1.contentView addSubview:label];
//            [cell1.contentView addSubview:sv];
        }
        return cell1;
    }
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
