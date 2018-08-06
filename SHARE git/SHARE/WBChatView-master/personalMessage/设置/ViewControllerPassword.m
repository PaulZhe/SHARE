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
    
    _passwordTextField2 = [[UITextField alloc] init];
    _passwordTextField1 = [[UITextField alloc] init];
    
    //设置导航栏
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(pop)];
    self.navigationItem.leftBarButtonItem = item;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 414, 260) style:UITableViewStyleGrouped];
    
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
    [passwordButton addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
    [self.tableView addSubview: passwordButton];
    
    _arrayData1 = [[NSArray alloc] initWithObjects:@"旧密码", @"新密码", @"确认密码", nil];
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
    cell.textField.delegate = self;
    cell.label.text = _arrayData1[indexPath.row];
    cell.textField.placeholder = _arrayData2[indexPath.row];
    switch (indexPath.row) {
        case 1:
            cell.textField.tag = 1;
            break;
        case 2:
            cell.textField.tag = 2;
            break;
        default:
            break;
    }
    return cell;
}

- (void)pop
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)press{
    if(_passwordTextField1.text == _passwordTextField2.text){
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"修改成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
        alertController.view.tintColor = [UIColor colorWithRed:0.25f green:0.25f blue:0.25f alpha:1.00f];
        [self presentViewController:alertController animated:YES completion:nil];
        
        [self performSelector:@selector(clean:) withObject:alertController afterDelay:1.5];
    } else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"修改失败，两次密码输入不一致" message:nil preferredStyle:UIAlertControllerStyleAlert];
        alertController.view.tintColor = [UIColor colorWithRed:0.25f green:0.25f blue:0.25f alpha:1.00f];
        [self presentViewController:alertController animated:YES completion:nil];
        
        [self performSelector:@selector(clean:) withObject:alertController afterDelay:1.5];
    }
}

-(void)clean:(UIAlertController *)alert{
    [alert dismissViewControllerAnimated:YES completion:nil];
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    if(textField.tag == 1){
        _passwordTextField1.text = textField.text;
    } else if(textField.tag == 2){
        _passwordTextField2.text = textField.text;
    }
}

-(void)actionSheet{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确认修改密码？" message:nil preferredStyle: UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:nil];
    
    [alertController addAction:cancelAction];
    
    [alertController addAction:deleteAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    [self.tableView endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    //返回一个BOOL值，指明是否允许在按下回车键时结束编辑
    //如果允许要调用resignFirstResponder 方法，这回导致结束编辑，而键盘会被收起
    [self.tableView endEditing:YES];
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
