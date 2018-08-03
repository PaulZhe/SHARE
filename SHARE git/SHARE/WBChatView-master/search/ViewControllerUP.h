//
//  ViewControllerUP.h
//  SHARE
//
//  Created by 小哲的DELL on 2018/8/2.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerUP : UIViewController<UITextViewDelegate>
{
    
    UILabel *textViewPlaceholderLabel;
    UILabel *textViewPlaceholderLabel1;
}

@property(nonatomic) UITextView *textView;
@property(nonatomic) UITextView *textView1;

@end
