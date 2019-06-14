//
//  YLSessionViewController.m
//  TestOCProject
//
//  Created by wl on 2019/6/5.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLSessionViewController.h"
#import "YLIMMessageCell.h"
#import "YLIMMessageModel.h"
#import "YLMessageModel.h"
#import "YLIMKeyborad.h"

@interface YLSessionViewController ()<UITableViewDelegate,UITableViewDataSource,YLIMMessageDelegate,UIScrollViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *data;
@property (nonatomic, strong)YLIMKeyborad *keyboradView;
@end

@implementation YLSessionViewController

- (void)dealloc
{
    [self.keyboradView removeObserver:self forKeyPath:@"frame"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTranslucent:NO];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.backgroundColor = [UIColor whiteColor];
        tableView.tableFooterView = [UIView new];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        tableView;
    });
    
    self.keyboradView = ({
        YLIMKeyborad *toolBar = [YLIMKeyborad new];
        
        toolBar;
    });
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.keyboradView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.bottom.equalTo(self.keyboradView.mas_top);
    }];
    [self.keyboradView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(50);
    }];
    
    [self configData];
    [self _addObserve];
}
- (void)_addObserve{
    [self.keyboradView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([object isKindOfClass:YLIMKeyborad.class]) {
        if ([keyPath isEqualToString:@"frame"]) {
            //修改tableviewframe 和 offset
            self.tableView.frame = CGRectMake(0, 0, self.view.yl_width, self.keyboradView.top);
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.data.count - 1 inSection:0];
            [self.tableView scrollToRowAtIndexPath:indexPath
                                  atScrollPosition:UITableViewScrollPositionBottom
                                          animated:YES];
        }
    }

}

- (void)configData{
//    self.left = [dic[@"left"] isEqualToString:@"1"];
//    self.group = [dic[@"group"] isEqualToString:@"1"];
//    self.content = dic[@"content"];
//    self.url = dic[@"url"];
//    self.messageType = [dic[@"type"] integerValue];
    self.data = @[].mutableCopy;
    NSArray *array = @[
                       @{
                           @"left":@"1",
                           @"group":@"1",
                           @"content":@"12312313123123131231231312312313123123131231231312312313123123131231231312312313123123131231231312312313123123131231231312312313123123131231231312312313123123131231231312312313123123131231231312312313",
                           @"url":@"123",
                           @"type":@0
                           },                       @{
                           @"left":@"0",
                           @"group":@"1",
                           @"content":@"12312313123123131231231312312313",
                           @"url":@"WechatIMG5.jpeg",
                           @"type":@1
                           },                       @{
                           @"left":@"0",
                           @"group":@"1",
                           @"content":@"12312313123123131231231312312313",
                           @"url":@"WechatIMG4.jpeg",
                           @"type":@1
                           },                       @{
                           @"left":@"1",
                           @"group":@"1",
                           @"content":@"1231231312312313",
                           @"url":@"123",
                           @"type":@2
                           },                       @{
                           @"left":@"0",
                           @"group":@"1",
                           @"content":@"1231231312312313",
                           @"url":@"123",
                           @"type":@2
                           },                        @{
                           @"left":@"1",
                           @"group":@"1",
                           @"content":@"12312313123123131231231312",
                           @"url":@"123",
                           @"type":@0
                           },                       @{
                           @"left":@"1",
                           @"group":@"0",
                           @"content":@"12312313123123131231231312312313123123131231231312312313",
                           @"url":@"123",
                           @"type":@0
                           },                       @{
                           @"left":@"0",
                           @"group":@"1",
                           @"content":@"123",
                           @"url":@"123",
                           @"type":@0
                           },                       @{
                           @"left":@"0",
                           @"group":@"1",
                           @"content":@"123",
                           @"url":@"123",
                           @"type":@3
                           },                       @{
                           @"left":@"1",
                           @"group":@"1",
                           @"content":@"12312313123123131231231312312313123123131231231312312313123123131231231312312313123123131231231312312313123123131231231312312313123123131231231312312313123123131231231312312313123123131231231312312313",
                           @"url":@"123",
                           @"type":@0
                           },                       @{
                           @"left":@"0",
                           @"group":@"1",
                           @"content":@"12312313123123131231231312312313",
                           @"url":@"WechatIMG5.jpeg",
                           @"type":@1
                           },                       @{
                           @"left":@"0",
                           @"group":@"1",
                           @"content":@"12312313123123131231231312312313",
                           @"url":@"WechatIMG4.jpeg",
                           @"type":@1
                           },                       @{
                           @"left":@"1",
                           @"group":@"1",
                           @"content":@"1231231312312313",
                           @"url":@"123",
                           @"type":@2
                           },                       @{
                           @"left":@"1",
                           @"group":@"1",
                           @"content":@"12312313123123131231231312",
                           @"url":@"123",
                           @"type":@0
                           },                       @{
                           @"left":@"1",
                           @"group":@"0",
                           @"content":@"12312313123123131231231312312313123123131231231312312313",
                           @"url":@"123",
                           @"type":@0
                           },                       @{
                           @"left":@"0",
                           @"group":@"1",
                           @"content":@"123",
                           @"url":@"123",
                           @"type":@0
                           },                       @{
                           @"left":@"0",
                           @"group":@"1",
                           @"content":@"123",
                           @"url":@"123",
                           @"type":@3
                           }
                       ];
    for (NSDictionary *dic in array) {
        YLMessageModel *model = [[YLMessageModel alloc]initWithDic:dic];
        YLIMMessageModel *imModel = [YLIMMessageModel messageFromIMData:model];
        [self.data addObject:imModel];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YLIMMessageModel *model = self.data[indexPath.row];
    NSString *identify = [model reuseId];
    YLIMMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        [tableView registerClass:YLIMMessageCell.class forCellReuseIdentifier:identify];
        cell = [tableView dequeueReusableCellWithIdentifier:identify];
    }
    cell.model = self.data[indexPath.row];
    cell.delegate = self;
    return  cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YLIMMessageModel *model = self.data[indexPath.row];
    return model.layout.cellHeight;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if (self.keyboradView.isFirstResponder) {
        [self.keyboradView resignFirstResponder];
    }
}

- (void)catchEventCell:(YLIMMessageCell *)cell event:(YLIMEvent *)event{
    
}

@end
