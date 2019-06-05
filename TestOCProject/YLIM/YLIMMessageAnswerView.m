//
//  YLIMMessageAnswerView.m
//  TestOCProject
//
//  Created by wl on 2019/6/5.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLIMMessageAnswerView.h"
#import "YLIMMessageModel.h"

@interface YLIMMessageAnswerView()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@end

@implementation YLIMMessageAnswerView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)configUI
{
    [super configUI];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:UITableViewCell.class forCellReuseIdentifier:UITableViewCell.reuseid];

    [self addSubview:tableView];
    self.tableView = tableView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.tableView.left = self.model.layout.bubbleViewInsets.left;
    self.tableView.top = self.model.layout.bubbleViewInsets.top;
    self.tableView.yl_size = self.model.layout.contentSize;
}

- (void)refreshData:(YLIMMessageModel *)model
{
    self.model = model;
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCell.reuseid];
    cell.textLabel.text = @"这是答题";
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
@end
