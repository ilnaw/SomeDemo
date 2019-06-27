//
//  YLMomentHeaderReuseTestVC.m
//  TestOCProject
//
//  Created by wl on 2019/6/26.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLMomentHeaderReuseTestVC.h"
#import "YLMomentCommentCell.h"
#import "YLMomentMoreView.h"
#import "YLMomentHeaderView.h"
#import "YLMomentFooterView.h"
#import "YLMomentViewModel.h"

@interface YLMomentHeaderReuseTestVC ()<UITableViewDelegate,UITableViewDataSource,YLMomentHeaderViewDelegate>
@property (nonatomic, strong)YLMomentViewModel *viewModel;
@end

@implementation YLMomentHeaderReuseTestVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.viewModel = YLMomentViewModel.new;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:YLMomentCommentCell.class forCellReuseIdentifier:YLMomentCommentCell.reuseid];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.viewModel.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    YLMomentModel *model = self.viewModel.dataSource[section];
    return model.comments.count ;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YLMomentCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:YLMomentCommentCell.reuseid forIndexPath:indexPath];
    YLMomentModel *model = self.viewModel.dataSource[indexPath.section];
    cell.comment = model.comments[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YLMomentModel *model = self.viewModel.dataSource[indexPath.section];
    return [model.layout.commentCellheightArray[indexPath.row] floatValue];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    YLMomentModel *model = self.viewModel.dataSource[section];
    YLMomentHeaderView *header = [YLMomentHeaderView initWithTableView:tableView type:model.type];
    header.deleagte = self;
    header.model = model;
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    YLMomentModel *model = self.viewModel.dataSource[section];
    
    return model.layout.headerHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    static NSString *kYLMomentFooter = @"YLMomentFooter";
    YLMomentFooterView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kYLMomentFooter];
    if (!footer) {
        footer = [[YLMomentFooterView alloc]initWithReuseIdentifier:kYLMomentFooter];
    }
    return footer;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 30.f;
}

- (void)catchEventCell:(YLMomentHeaderView *)header event:(YLMomentEvent *)event
{
    if (event.eventName == YLMomentEventNameTapShare) {
        NSLog(@"点击了分享");
    }
}

@end
