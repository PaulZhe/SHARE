//
//  ViewControllerGuanzhu.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/8/1.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "ViewControllerGuanzhu.h"
#import "GuanzhuTableViewCell.h"

@interface ViewControllerGuanzhu ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, copy)NSArray *arrayData;
@property (nonatomic, copy)NSArray *arrayImage;

@end

@implementation ViewControllerGuanzhu

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置导航栏
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(pop)];
    self.navigationItem.leftBarButtonItem = item;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 414, self.view.frame.size.height-60) style:UITableViewStyleGrouped];
    
    [self.tableView registerClass:[GuanzhuTableViewCell class] forCellReuseIdentifier:@"ordinaryCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    UIImage *image1 = [UIImage imageNamed:@"sixin_img1"];
    UIImage *image2 = [UIImage imageNamed:@"sixin_img2"];
    UIImage *image3 = [UIImage imageNamed:@"sixin_img3"];
    UIImage *image4 = [UIImage imageNamed:@"sixin_img4"];
    UIImage *image5 = [UIImage imageNamed:@"guanzhu_img5"];
    UIImage *image6 = [UIImage imageNamed:@"guanzhu_img6"];
    
    _arrayData = [[NSArray alloc] initWithObjects:@"share小格", @"share小兰", @"share小明", @"share小雪", @"share萌萌", @"shareLity", nil];
    _arrayImage = [[NSArray alloc] initWithObjects:image1, image2, image3, image4, image5, image6, nil];
    
    [self.view addSubview:_tableView];
    
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
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
    GuanzhuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ordinaryCell" forIndexPath:indexPath];
    cell.guanzhuLabel.text = _arrayData[indexPath.row];
    cell.guanzhuImageView.image = _arrayImage[indexPath.row];
    [cell.guanzhuButton setImage:[UIImage imageNamed:@"guanzhu_normal"] forState:UIControlStateNormal];
    [cell.guanzhuButton setImage:[UIImage imageNamed:@"guanzhu_pressed"] forState:UIControlStateSelected];
    [cell.guanzhuButton addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
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
