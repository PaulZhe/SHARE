//
//  ATCarouselView.h
//  SHARE
//
//  Created by 小哲的DELL on 2018/8/6.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ATCarouselView;
@protocol ATCarouselViewDelegate <NSObject>
@optional
/**
 *  点击图片的回调事件
 */
- (void)carouselView:(ATCarouselView *)carouselView indexOfClickedImageBtn:(NSUInteger)index;
@end

@interface ATCarouselView : UIView
//传入图片数组
@property (nonatomic, copy) NSArray *images;
//pageControl颜色设置
@property (nonatomic, strong) UIColor *currentPageColor;
@property (nonatomic, strong) UIColor *pageColor;
//是否竖向滚动
@property (nonatomic, assign, getter=isScrollDorectionPortrait) BOOL scrollDorectionPortrait;

@property (weak, nonatomic) id<ATCarouselViewDelegate> delegate;
@end
