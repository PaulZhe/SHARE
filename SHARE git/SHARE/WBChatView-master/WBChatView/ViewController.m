//
//  ViewController.m
//  WBChatView
//
//  Created by 李伟宾 on 2018/2/2.
//  Copyright © 2018年 李伟宾. All rights reserved.
//


#import "ViewController.h"
#import "WBChatView.h"

@interface ViewController () <WBChatViewDelegate>
@property (nonatomic, strong) WBChatView *chatView;
@property (nonatomic, strong) NSMutableArray *chatMsg;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor lightGrayColor];
    self.chatMsg = [NSMutableArray array];
    
    self.chatView = [[WBChatView alloc] init];
    self.chatView.frame = CGRectMake(0, 64, SCREEN_WIDTH, 612);
    self.chatView.backgroundColor = [UIColor redColor];
    self.chatView.delegate = self;
    [self.view addSubview:self.chatView];
    
    [self addMessage:MsgTypeIsText form:MsgFromIsRight text:@"你拍的真不错"];
    [self addMessage:MsgTypeIsText form:MsgFromIsLeft text:@"谢谢，已关注你"];
    [self addMessage:MsgTypeIsText form:MsgFromIsRight text:@"好专业的照片，非常喜欢这种风格，期待你更好的作品"];
    [self addMessage:MsgTypeIsText form:MsgFromIsLeft text:@"嗯嗯，好的"];
}

//delegate
- (void)sendMessage:(NSInteger)type text:(NSString *)text {
    [self addMessage:MsgTypeIsText form:MsgFromIsRight text:text];
}

//新增消息
- (void)addMessage:(NSInteger)type form:(NSInteger)form text:(NSString *)text {

    WBChatModel *msgModel = [[WBChatModel alloc] init];
    msgModel.msgType = type;
    msgModel.msgFrom = form;
    msgModel.msgText = text;
    [self.chatMsg addObject:msgModel];
    
    self.chatView.chatMsg = self.chatMsg;
}



@end
