//
//  View.m
//  SHARE
//
//  Created by 小哲的DELL on 2018/7/30.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "View.h"

@implementation View

-(void)dealloc{
    self.scrollView = nil;
    self.pageControl = nil;
}

- (void)viewDidLoad {
    //整体布局
    [self layout];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)layout{
    //布局ScrollView
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(7,60, 400, 202)];
    [self addSubview:_scrollView];
    //    [_scrollView release];
    //布局pagecontrol
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(80, 230, 240, 30)];
    
    [self addSubview:_pageControl];
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
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
