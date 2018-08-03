//
//  ViewControllerHomePage.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/7/30.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "ViewControllerHomePage.h"
#import "HomePageTableViewCell.h"
#import "ArtViewController.h"

@interface ViewControllerHomePage ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation ViewControllerHomePage

-(void)dealloc{
    self.scrollView = nil;
    self.pageControl = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 400, 212)];
    
    //布局轮播图
    //布局ScrollView
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,0, 400, 202)];
    [titleView addSubview:_scrollView];
    //    [_scrollView release];
    //布局pagecontrol
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(80, 170, 240, 30)];
    
    [titleView addSubview:_pageControl];
    //    [_pageControl release];
    
    int count = 4;
    CGSize size = self.scrollView.frame.size;
    //1 动态生成5个imageView
    for (int i = 0; i < count; i++) {
        //
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.scrollView addSubview:iconView];
        
        NSString *imgName = [NSString stringWithFormat:@"main_img%d",i+1];
        iconView.image = [UIImage imageNamed:imgName];
        
        CGFloat x = i * size.width;
        //frame
        iconView.frame = CGRectMake(x, 0, size.width, size.height);
    }
    //2 设置滚动范围
    self.scrollView.contentSize = CGSizeMake(count * size.width, 0);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    //3 设置分页
    self.scrollView.pagingEnabled = YES;
    
    //4 设置pageControl
    self.pageControl.numberOfPages = count;
    self.pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    self.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    //5 设置scrollView的代理
    self.scrollView.delegate = self;
    //6 添加定时器
    [self addTimerTask];
    
    //
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(7, 60, 400, 616) style:UITableViewStyleGrouped];
    [self.tableView registerClass:[HomePageTableViewCell class] forCellReuseIdentifier:@"homePageCell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.tableHeaderView = titleView;
    [self.view addSubview:_tableView];
    // Do any additional setup after loading the view.
}

-(void)addTimerTask{
    //6 定时器
    NSTimer *timer = [NSTimer timerWithTimeInterval:3.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    
    self.timer = timer;
    
    //消息循环
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    // 默认是NSDefaultRunLoopMode  但是另外一个属性NSRunLoopCommonModes 能够在多线程中起作用
    [runloop addTimer:timer forMode:NSDefaultRunLoopMode];
    
    //立即执行定时器的方法  fire 是定时器自带的方法
    [timer fire];
    
}

-(void)nextImage{
    //当前页码
    NSInteger page = self.pageControl.currentPage;
    //如果是到达最后一张
    if (page == self.pageControl.numberOfPages - 1) {
        page = 0;
        //设置偏移量  当到达最后一张时候 切换到第一张  不产生从最后一张倒回第一张效果
        _scrollView.contentOffset = CGPointMake(50, 0);
        [_scrollView setContentOffset:_scrollView.contentOffset animated:YES];
    }else{
        page++;
    }
    //  self.scrollView setContentOffset:(CGPoint) animated:(BOOL)
    
    CGFloat offsetX = page * self.scrollView.frame.size.width;
    [UIView animateWithDuration:1.0 animations:^{
        self.scrollView.contentOffset = CGPointMake(offsetX, 0);
    }];
}

#pragma mark - - 实现ScrollView代理方法

//正在滚动的时候
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //   (offset.x + 100/2)/100
    int page = (scrollView.contentOffset.x + scrollView.frame.size.width / 2)/ scrollView.frame.size.width;
    self.pageControl.currentPage = page;
}
//当你点击图片按住不动的时候 把定时器停止
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //停止定时器
    [self.timer invalidate];
}
//当不再按图片 也就是松开的时候 立马调用计时器方法
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    //用scheduledTimerWithTimeInterval 创建定时器是用的系统默认的方法 当遇见多线程时候会出现问题
    //    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    //所以还是调用上面创建的定时器方法
    [self addTimerTask];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 142;
}

//设置选中Cell的响应事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        ArtViewController *vcArt = [[ArtViewController alloc]init];
        [self.navigationController pushViewController:vcArt animated:NO];
//        self.hidesBottomBarWhenPushed = YES;
    } else{
        [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        HomePageTableViewCell *cell0 = [tableView dequeueReusableCellWithIdentifier:@"homePageCell" forIndexPath:indexPath];
        
        UIImage *image0  = [UIImage imageNamed:@"list_img1"];
        UIImage *image1  = [UIImage imageNamed:@"button_zan"];
        UIImage *image2  = [UIImage imageNamed:@"button_guanzhu"];
        UIImage *image3  = [UIImage imageNamed:@"button_share"];
        
        cell0.homePageImageView0.image = image0;
        
        [cell0.homePageButton1 setImage:image1 forState:UIControlStateNormal];
        [cell0.homePageButton1 setTitle:@"102" forState:UIControlStateNormal];
        [cell0.homePageButton1 setTitle:@"103" forState:UIControlStateSelected];
        [cell0.homePageButton1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell0.homePageButton2 setImage:image2 forState:UIControlStateNormal];
        [cell0.homePageButton2 setTitle:@"26" forState:UIControlStateNormal];
        
        [cell0.homePageButton3 setImage:image3 forState:UIControlStateNormal];
        [cell0.homePageButton3 setTitle:@"20" forState:UIControlStateNormal];
        
        cell0.homePageLabel0.text = @"假日";
        cell0.homePageLabel1.text = @"share小白";
        cell0.homePageLabel2.text = @"原创-插画-练习习作";
        cell0.homePageLabel3.text = @"15分钟前";
        
        return cell0;
    } else if(indexPath.section == 1){
        HomePageTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"homePageCell" forIndexPath:indexPath];
        
        UIImage *image0  = [UIImage imageNamed:@"list_img2"];
        UIImage *image1  = [UIImage imageNamed:@"button_zan"];
        UIImage *image2  = [UIImage imageNamed:@"button_guanzhu"];
        UIImage *image3  = [UIImage imageNamed:@"button_share"];
        
        cell1.homePageImageView0.image = image0;
        
        [cell1.homePageButton1 setImage:image1 forState:UIControlStateNormal];
        [cell1.homePageButton1 setTitle:@"102" forState:UIControlStateNormal];
        [cell1.homePageButton1 setTitle:@"103" forState:UIControlStateSelected];
        [cell1.homePageButton1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell1.homePageButton2 setImage:image2 forState:UIControlStateNormal];
        [cell1.homePageButton2 setTitle:@"26" forState:UIControlStateNormal];
        
        [cell1.homePageButton3 setImage:image3 forState:UIControlStateNormal];
        [cell1.homePageButton3 setTitle:@"20" forState:UIControlStateNormal];
        
        cell1.homePageLabel0.text = @"国外画册欣赏";
        cell1.homePageLabel1.text = @"share小王";
        cell1.homePageLabel2.text = @"平面设计-画册设计";
        cell1.homePageLabel3.text = @"16分钟前";
        
        return cell1;
    } else if(indexPath.section == 2){
        HomePageTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"homePageCell" forIndexPath:indexPath];
        
        UIImage *image0  = [UIImage imageNamed:@"list_img3"];
        UIImage *image1  = [UIImage imageNamed:@"button_zan"];
        UIImage *image2  = [UIImage imageNamed:@"button_guanzhu"];
        UIImage *image3  = [UIImage imageNamed:@"button_share"];
        
        cell1.homePageImageView0.image = image0;
        
        [cell1.homePageButton1 setImage:image1 forState:UIControlStateNormal];
        [cell1.homePageButton1 setTitle:@"102" forState:UIControlStateNormal];
        [cell1.homePageButton1 setTitle:@"103" forState:UIControlStateSelected];
        [cell1.homePageButton1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell1.homePageButton2 setImage:image2 forState:UIControlStateNormal];
        [cell1.homePageButton2 setTitle:@"26" forState:UIControlStateNormal];
        
        [cell1.homePageButton3 setImage:image3 forState:UIControlStateNormal];
        [cell1.homePageButton3 setTitle:@"20" forState:UIControlStateNormal];
        
        cell1.homePageLabel0.text = @"collection扁平设计";
        cell1.homePageLabel1.text = @"share小吕";
        cell1.homePageLabel2.text = @"平面设计-画册设计";
        cell1.homePageLabel3.text = @"17分钟前";
        
        return cell1;
    } else{
        HomePageTableViewCell *cell3 = [tableView dequeueReusableCellWithIdentifier:@"homePageCell" forIndexPath:indexPath];
        
        UIImage *image0  = [UIImage imageNamed:@"list_img4"];
        UIImage *image1  = [UIImage imageNamed:@"button_zan"];
        UIImage *image2  = [UIImage imageNamed:@"button_guanzhu"];
        UIImage *image3  = [UIImage imageNamed:@"button_share"];
        
        cell3.homePageImageView0.image = image0;
        
        [cell3.homePageButton1 setImage:image1 forState:UIControlStateNormal];
        [cell3.homePageButton1 setTitle:@"102" forState:UIControlStateNormal];
        [cell3.homePageButton1 setTitle:@"103" forState:UIControlStateSelected];
        [cell3.homePageButton1 addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell3.homePageButton2 setImage:image2 forState:UIControlStateNormal];
        [cell3.homePageButton2 setTitle:@"26" forState:UIControlStateNormal];
        
        [cell3.homePageButton3 setImage:image3 forState:UIControlStateNormal];
        [cell3.homePageButton3 setTitle:@"20" forState:UIControlStateNormal];
        
        cell3.homePageLabel0.text = @"邮报";
        cell3.homePageLabel1.text = @"share小黑";
        cell3.homePageLabel2.text = @"平面设计-画册设计";
        cell3.homePageLabel3.text = @"18分钟前";
        
        return cell3;
    }
}

-(void)click:(UIButton*) button
{
    button.selected = !button.selected;
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
