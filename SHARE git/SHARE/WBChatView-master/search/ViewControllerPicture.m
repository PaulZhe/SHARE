//
//  ViewControllerPicture.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/8/3.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "ViewControllerPicture.h"
#import "CollectionViewCell.h"

@interface ViewControllerPicture ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation ViewControllerPicture

@synthesize selectedView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置导航栏
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(pop)];
    self.navigationItem.leftBarButtonItem = item;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    UIBarButtonItem *itemright = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"最终上传"] style:UIBarButtonItemStylePlain target:self action:@selector(actionSheet)];
    self.navigationItem.rightBarButtonItem = itemright;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    //创建UICollectionView布局策略
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置布局方向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //设置其中每个数据载体Item的尺寸
    layout.itemSize = CGSizeMake(136, 136);
    //创建UICollectionView视图控件
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    collectionView.backgroundColor =[UIColor whiteColor];
    
    //进行数据载体Item的注册
    [collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"pictureCell"];
    
    //设置代理与数据源
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    
    collectionView.allowsMultipleSelection = YES;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 18;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"pictureCell" forIndexPath:indexPath];
    cell.topImage.image = [UIImage imageNamed:@"last"];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.btn1.hidden = YES;
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}

//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.btn1.hidden = NO;
}

//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}


-(void)actionSheet{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确定上传吗？" message:@"" preferredStyle: UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:nil];
    
    [alertController addAction:cancelAction];
    
    [alertController addAction:deleteAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)pop
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
