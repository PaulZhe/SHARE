//
//  ViewControllerData.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/8/1.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "ViewControllerData.h"
#import "DataTableViewCell.h"

@interface ViewControllerData ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, copy)NSArray *arrayData;
@property (nonatomic, copy)NSArray *arrayData1;

@end

@implementation ViewControllerData

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置导航栏
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(pop)];
    self.navigationItem.leftBarButtonItem = item;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 414, self.view.frame.size.height-60) style:UITableViewStyleGrouped];
    
    [self.tableView registerClass:[DataTableViewCell class] forCellReuseIdentifier:@"ordinaryCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    _arrayData = [[NSArray alloc] initWithObjects: @"昵称", @"签名", @"邮箱", nil];
    _arrayData1 = [[NSArray alloc] initWithObjects:@"share小白", @"开心了就笑，不开心了就过会再笑", @"186####3@qq.com", nil];
    
    [self.view addSubview:_tableView];
    
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0 && indexPath.row ==0){
        return 96;
    } else{
        return 50;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0 && indexPath.row == 0){
        DataTableViewCell *cell0 = [tableView dequeueReusableCellWithIdentifier:@"cell0"];
        if(cell0 == nil){
            cell0 = [[DataTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell0"];
            UILabel *label0 = [[UILabel alloc] initWithFrame:CGRectMake(40, 38, 50, 20)];
            label0.text = @"头像";
            UIImageView *imageView0 = [[UIImageView alloc] initWithFrame:CGRectMake(110, 13, 70, 70)];
            imageView0.image = [UIImage imageNamed:@"data_img"];
            [cell0.contentView addSubview:label0];
            [cell0.contentView addSubview:imageView0];
            
        }
        return cell0;
    } else if(indexPath.section == 0 && indexPath.row == 3){
        DataTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"ordinaryCell" forIndexPath:indexPath];
        cell1.label.text = @"性别";
        UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn1 setTitle:@"男" forState:UIControlStateNormal];
        [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn2 setTitle:@"女" forState:UIControlStateNormal];
        [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn1 setImage:[UIImage imageNamed:@"boy_button"] forState:UIControlStateNormal];
        [btn2 setImage:[UIImage imageNamed:@"girl_button"] forState:UIControlStateNormal];
        btn1.frame = CGRectMake(110, 15, 50, 20);
        btn2.frame = CGRectMake(180, 15, 50, 20);
        [cell1.contentView addSubview:btn2];
        [cell1.contentView addSubview:btn1];
        
        return cell1;
    } else{
        DataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ordinaryCell" forIndexPath:indexPath];
        UILabel *Lable = [[UILabel alloc] initWithFrame:CGRectMake(110, 15, 280, 20)];
        if(indexPath.row < 3){
            Lable.text = _arrayData1[indexPath.row-1];
            cell.label.text = _arrayData[indexPath.row-1];
        } else{
            Lable.text = _arrayData1[indexPath.row-2];
            cell.label.text = _arrayData[indexPath.row-2];
        }
        [cell.contentView addSubview:Lable];
        return cell;
    }
}

- (void)pop
{
    [self.navigationController popViewControllerAnimated:YES];
}

//设置选中Cell的响应事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
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
