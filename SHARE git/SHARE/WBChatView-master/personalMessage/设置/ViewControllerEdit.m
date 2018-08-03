//
//  ViewControllerEdit.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/8/1.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "ViewControllerEdit.h"
#import "MessageTableViewCell.h"
#import "ViewControllerData.h"
#import "ViewControllerPassword.h"
#import "ViewControllerMessageedit.h"
#import "ViewControllerMemory.h"

@interface ViewControllerEdit ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, copy)NSArray *arrayData2;
@property (nonatomic, copy)NSArray *arrayData1;

@end

@implementation ViewControllerEdit

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置导航栏
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(pop)];
    self.navigationItem.leftBarButtonItem = item;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 414, self.view.frame.size.height-60) style:UITableViewStyleGrouped];
    
    [self.tableView registerClass:[MessageTableViewCell class] forCellReuseIdentifier:@"ordinaryCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    _arrayData1 = [[NSArray alloc] initWithObjects:@"基本资料", @"修改密码", @"消息设置", @"关于SHARE", @"清除缓存", nil];
    _arrayData2 = [[NSArray alloc] initWithObjects:@"", @"", @"", @"", @"", nil];
    
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
    return 46;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ordinaryCell" forIndexPath:indexPath];
    cell.Label1.text = _arrayData1[indexPath.row];
    cell.Label2.text = _arrayData2[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"img0"];
    return cell;
}

- (void)pop
{
    [self.navigationController popViewControllerAnimated:YES];
}

//设置选中Cell的响应事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0 && indexPath.row == 0){
        ViewControllerData *vcData = [[ViewControllerData alloc]init];
        [self.navigationController pushViewController:vcData animated:YES];
    } else if(indexPath.section == 0 && indexPath.row == 1){
        ViewControllerPassword *vcPassword = [[ViewControllerPassword alloc] init];
        [self.navigationController pushViewController:vcPassword animated:YES];
    } else if(indexPath.section == 0 && indexPath.row == 2){
        ViewControllerMessageedit *vcMessageedit = [[ViewControllerMessageedit alloc] init];
        [self.navigationController pushViewController:vcMessageedit animated:YES];
    } else if(indexPath.section == 0 && indexPath.row == 4){
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"清除缓存" message:@"删除数据将不可恢复" preferredStyle: UIAlertControllerStyleActionSheet];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"清除" style:UIAlertActionStyleDestructive handler:nil];
        
        [alertController addAction:cancelAction];
        
        [alertController addAction:deleteAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
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
