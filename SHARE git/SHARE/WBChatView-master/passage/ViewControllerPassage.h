//
//  ViewControllerPassage.h
//  SHARE
//
//  Created by 小哲的DELL on 2018/7/30.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomePageTableViewCell.h"

@interface ViewControllerPassage : UIViewController<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property UIScrollView *scrollView;
@property UITableView *tableView;
@property UITableView *tableView2;
@property UITableView *tableView3;
@property UITableViewCell *cell;
@property UISegmentedControl *segmentedControl;

@end
