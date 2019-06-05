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

@interface YLSessionViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *data;
@end

@implementation YLSessionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTranslucent:NO];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configData];
    
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.backgroundColor = [UIColor whiteColor];
        tableView.tableFooterView = [UIView new];
        tableView.delegate = self;
        tableView.dataSource = self;
        
        tableView;
    });
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
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

@end
