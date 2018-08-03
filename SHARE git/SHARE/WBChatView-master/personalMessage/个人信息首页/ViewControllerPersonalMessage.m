//
//  ViewControllerPersonalMessage.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/7/30.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "ViewControllerPersonalMessage.h"
#import "PersonalTableViewCell.h"
#import "ViewControllerEdit.h"
#import "ViewControllerUpLoad.h"
#import "ViewControllerMessage.h"
#import "ViewControllerRecommand.h"

@interface ViewControllerPersonalMessage ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, copy)NSArray *arrayData;
@property (nonatomic, copy)NSArray *arrayImage;

@end

@implementation ViewControllerPersonalMessage



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置导航栏
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:nil];self.navigationItem.leftBarButtonItem = item;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    self.title = @"个人信息";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 414, self.view.frame.size.height-60) style:UITableViewStyleGrouped];
    
    [self.tableView registerClass:[PersonalTableViewCell class] forCellReuseIdentifier:@"ordinaryCell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    UIImage *image1 = [UIImage imageNamed:@"img1"];
    UIImage *image2 = [UIImage imageNamed:@"img2"];
    UIImage *image3 = [UIImage imageNamed:@"img3"];
    UIImage *image4 = [UIImage imageNamed:@"img4"];
    UIImage *image5 = [UIImage imageNamed:@"img5"];
    UIImage *image6 = [UIImage imageNamed:@"img6"];
    
    _arrayImage = [[NSArray alloc] initWithObjects:image1, image2, image3, image4, image5, image6, nil];
    
    _arrayData = [[NSArray alloc] init];
    _arrayData = [NSArray arrayWithObjects:@"我的上传", @"我的信息", @"我推荐的", @"院系通知", @"设置", @"退出", nil];
    
    // Do any additional setup after loading the view.
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return 148;
    } else{
        return 54;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 18;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = [NSArray arrayWithObjects:@1, @6, nil];
    return [array[section] integerValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        UITableViewCell *cell0 = [tableView dequeueReusableCellWithIdentifier:@"cell0"];
        if (cell0 == nil) {
            cell0 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell0"];
            
            UIImage *image = [UIImage imageNamed:@"sixin_img1"];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            imageView.frame = CGRectMake(38, 18, 112, 112);
            [cell0.contentView addSubview:imageView];
            
            //设置label
            UILabel *testLabel = [[UILabel alloc]initWithFrame:CGRectMake(180, 23, 220, 80)];
            testLabel.font = [UIFont systemFontOfSize:13];
            testLabel.backgroundColor = [UIColor lightGrayColor];
            testLabel.textAlignment = NSTextAlignmentLeft;
            testLabel.numberOfLines = 0;

            NSString *str = @"share小白\n数媒/设计爱好者\n\n开心了就笑，不开心了就过会再笑";
            
            // 创建Attributed
            NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:str];
            // 需要改变的第一个文字的位置
            NSUInteger firstLoc = [[noteStr string] rangeOfString:@"s"].location;
            // 需要改变的最后一个文字的位置
            NSUInteger secondLoc = [[noteStr string] rangeOfString:@"白"].location+1;
            // 需要改变的区间
            NSRange range = NSMakeRange(firstLoc, secondLoc - firstLoc);
            // 改变颜色
//            [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:range];
            // 改变字体大小及类型
            [noteStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:range];
            // 为label添加Attributed
            [testLabel setAttributedText:noteStr];
            
            testLabel.backgroundColor = [UIColor whiteColor];
            
            [cell0.contentView addSubview:testLabel];
            
            UIButton *button1 = [[UIButton alloc] init];
            UIButton *button2 = [[UIButton alloc] init];
            UIButton *button3 = [[UIButton alloc] init];
            button1.frame = CGRectMake(175, 108, 62, 18);
            button2.frame = CGRectMake(240, 108, 62, 18);
            button3.frame = CGRectMake(305, 108, 62, 18);
            button1.titleLabel.font = [UIFont systemFontOfSize:14];
            button2.titleLabel.font = [UIFont systemFontOfSize:14];
            button3.titleLabel.font = [UIFont systemFontOfSize:14];
            [button1 setTitleColor:[UIColor colorWithRed:0.11f green:0.55f blue:0.80f alpha:1.00f] forState:UIControlStateNormal];
            [button1 setTitleColor:[UIColor colorWithRed:0.11f green:0.55f blue:0.80f alpha:1.00f] forState:UIControlStateSelected];
            [button2 setTitleColor:[UIColor colorWithRed:0.11f green:0.55f blue:0.80f alpha:1.00f] forState:UIControlStateNormal];
            [button3 setTitleColor:[UIColor colorWithRed:0.11f green:0.55f blue:0.80f alpha:1.00f] forState:UIControlStateNormal];
            [button1 setTitle:@" 15" forState:UIControlStateNormal];
            [button2 setTitle:@" 120" forState:UIControlStateNormal];
            [button3 setTitle:@" 89" forState:UIControlStateNormal];
            [button1 setImage:[UIImage imageNamed:@"文件夹"] forState:UIControlStateNormal];
            [button2 setImage:[UIImage imageNamed:@"赞"] forState:UIControlStateNormal];
            [button3 setImage:[UIImage imageNamed:@"关注"] forState:UIControlStateNormal];
            [cell0.contentView addSubview:button1];
            [cell0.contentView addSubview:button2];
            [cell0.contentView addSubview:button3];
        }
        return cell0;
    } else{
        PersonalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ordinaryCell" forIndexPath:indexPath];
        
        cell.Label.text = _arrayData[indexPath.row];
        cell.imageView1.image = _arrayImage[indexPath.row];
        cell.imageView2.image = [UIImage imageNamed:@"img0"];
        
        return cell;
    }
}

//设置选中Cell的响应事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 1 && indexPath.row == 0){
        ViewControllerUpLoad *vcUpLoad = [[ViewControllerUpLoad alloc]init];
        [self.navigationController pushViewController:vcUpLoad animated:YES];
    } else if(indexPath.section == 1 && indexPath.row == 1){
        ViewControllerMessage *vcMessage = [[ViewControllerMessage alloc] init];
        [self.navigationController pushViewController:vcMessage animated:YES];
    } else if(indexPath.section == 1 && indexPath.row == 2){
        ViewControllerRecommand *vcRecommand = [[ViewControllerRecommand alloc] init];
        [self.navigationController pushViewController:vcRecommand animated:YES];
    } else if(indexPath.section == 1 && indexPath.row == 4){
        ViewControllerEdit *vcEdit = [[ViewControllerEdit alloc] init];
        [self.navigationController pushViewController:vcEdit animated:YES];
    } else{
        [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
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
