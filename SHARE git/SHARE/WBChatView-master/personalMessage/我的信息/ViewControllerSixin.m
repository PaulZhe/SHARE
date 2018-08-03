//
//  ViewControllerSixin.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/8/1.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "ViewControllerSixin.h"
#import "SixinTableViewCell.h"
#import "ViewController.h"

@interface ViewControllerSixin ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, copy)NSArray *arrayData1;
@property (nonatomic, copy)NSArray *arrayData2;
@property (nonatomic, copy)NSArray *arrayData3;
@property (nonatomic, copy)NSArray *arrayImage;

@end

@implementation ViewControllerSixin

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置导航栏
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(pop)];
    self.navigationItem.leftBarButtonItem = item;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 414, self.view.frame.size.height-60) style:UITableViewStyleGrouped];
    
    [self.tableView registerClass:[SixinTableViewCell class] forCellReuseIdentifier:@"ordinaryCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    UIImage *image1 = [UIImage imageNamed:@"sixin_img1"];
    UIImage *image2 = [UIImage imageNamed:@"sixin_img2"];
    UIImage *image3 = [UIImage imageNamed:@"sixin_img3"];
    UIImage *image4 = [UIImage imageNamed:@"sixin_img4"];
    
    _arrayData1 = [[NSArray alloc] initWithObjects:@"share小格", @"share小兰", @"share小明", @"share小雪", nil];
    _arrayData2 = [[NSArray alloc] initWithObjects:@"你的作品我很喜欢！！！", @"谢谢，已关注你", @"为你点赞！", @"你好可以问问你是怎么拍的吗？", nil];
    _arrayData3 = [[NSArray alloc] initWithObjects:@"11-03 09:45", @"11-03 10:00", @"11-03 10:23", @"11-03 11:20", nil];
    _arrayImage = [[NSArray alloc] initWithObjects:image1, image2, image3, image4, nil];
    
    [self.view addSubview:_tableView];
    
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SixinTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ordinaryCell" forIndexPath:indexPath];
    cell.sixinLabel1.text = _arrayData1[indexPath.row];
    cell.sixinLabel2.text = _arrayData2[indexPath.row];
    cell.sixinLabel3.text = _arrayData3[indexPath.row];
    cell.sixinImageView.image = _arrayImage[indexPath.row];
    return cell;
}

//设置选中Cell的响应事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0 && indexPath.row == 1){
        ViewController *vc = [[ViewController alloc]init];
        [self.navigationController pushViewController:vc animated:NO];
        //        self.hidesBottomBarWhenPushed = YES;
    } else{
        [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
    }
}

- (void)pop
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)press:(UIButton *) btn{
    btn.selected = !btn.selected;
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
