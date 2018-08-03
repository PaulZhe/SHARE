//
//  ViewControllerPassword.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/8/1.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "ViewControllerPassword.h"
#import "PasswordTableViewCell.h"

@interface ViewControllerPassword ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, copy)NSArray *arrayData2;
@property (nonatomic, copy)NSArray *arrayData1;

@end

@implementation ViewControllerPassword

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置导航栏
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(pop)];
    self.navigationItem.leftBarButtonItem = item;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 414, self.view.frame.size.height-60) style:UITableViewStyleGrouped];
    
    [self.tableView registerClass:[PasswordTableViewCell class] forCellReuseIdentifier:@"ordinaryCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    UIButton *passwordButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    passwordButton.backgroundColor = [UIColor colorWithRed:0.25f green:0.25f blue:0.25f alpha:1.00f];
    passwordButton.frame = CGRectMake(167, 200, 80, 42);
    passwordButton.layer.cornerRadius = 5;
    [passwordButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [passwordButton setTitle:@"提交" forState:normal];
    [passwordButton addTarget:self action:@selector(actionSheet) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview: passwordButton];
    
    _arrayData1 = [[NSArray alloc] initWithObjects:@"旧密码              6-20英文或数字结合", @"新密码              6-20英文或数字结合", @"确认密码         请再次确认输入密码", nil];
    _arrayData2 = [[NSArray alloc] initWithObjects:@"6-20英文或数字结合", @"6-20英文或数字结合", @"请再次确认输入密码", nil];
    
    [self.view addSubview:_tableView];
    
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PasswordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ordinaryCell" forIndexPath:indexPath];
    cell.textField.text = _arrayData1[indexPath.row];
    cell.textField.placeholder = _arrayData2[indexPath.row];
    return cell;
}

- (void)pop
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)actionSheet{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确认修改密码？" message:@"" preferredStyle: UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:nil];
    
    [alertController addAction:cancelAction];
    
    [alertController addAction:deleteAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    //返回一个BOOL值，指明是否允许在按下回车键时结束编辑
    //如果允许要调用resignFirstResponder 方法，这回导致结束编辑，而键盘会被收起
    [textField resignFirstResponder];//查一下resign这个单词的意思就明白这个方法了
    return YES;
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
