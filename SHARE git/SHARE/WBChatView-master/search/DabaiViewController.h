//
//  DabaiViewController.h
//  SHARE
//
//  Created by 小哲的DELL on 2018/8/2.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DabaiViewController : UIViewController<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property UITableView *tableView;
@property(nonatomic) UISearchBar *searchBar;

@end
