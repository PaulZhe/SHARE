//
//  ViewControllerActivity.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/7/30.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "ViewControllerActivity.h"
#import "ActivityTableViewCell.h"

@interface ViewControllerActivity ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation ViewControllerActivity

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(5, 20, 404, 646) style:UITableViewStyleGrouped];
    //注册自定义cell
    [self.tableView registerClass:[ActivityTableViewCell class] forCellReuseIdentifier:@"activityCell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 208;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        ActivityTableViewCell *cell0 = [tableView dequeueReusableCellWithIdentifier:@"activityCell" forIndexPath:indexPath];
        UIImage *image0 = [UIImage imageNamed:@"活动1.psd"];
        cell0.activityImageView.image = image0;
        cell0.activityLabel.text = @"下厨也要美美的，从一条围裙开始一六月鲜围裙创意设计大赛";
        return cell0;
    } else if(indexPath.section == 1){
        ActivityTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"activityCell" forIndexPath:indexPath];
        UIImage *image1 = [UIImage imageNamed:@"活动2.psd"];
        cell1.activityImageView.image = image1;
        cell1.activityLabel.text = @"MIUI主题市场让你的创意改变世界！";
        return cell1;
    } else{
        ActivityTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"activityCell" forIndexPath:indexPath];
        UIImage *image2 = [UIImage imageNamed:@"活动3.psd"];
        cell2.activityImageView.image = image2;
        cell2.activityLabel.text = @"千万花粉，为你而来";
        return cell2;
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
