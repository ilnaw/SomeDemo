//
//  YLTimeLineViewController.m
//  TestOCProject
//
//  Created by wl on 2019/6/21.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLWeatherFrameViewController.h"
#import "YLWeatherFrameTableViewCell.h"

@interface YLWeatherFrameViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@end

@implementation YLWeatherFrameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTranslucent:NO];
    
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [tableView registerClass:YLWeatherFrameTableViewCell.class forCellReuseIdentifier:YLWeatherFrameTableViewCell.reuseid];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.delegate = self;
        tableView.dataSource = self;
        
        tableView;
    });
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.tableView.layer.contents = (__bridge id)[UIImage imageNamed:@"架构分层 1.png"].CGImage;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        YLWeatherFrameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YLWeatherFrameTableViewCell.reuseid];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.3];
        return cell;
    }else{
        UITableViewCell *cell = UITableViewCell.new;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    }

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        return 20;
    }
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, [self tableView:tableView heightForHeaderInSection:section])];
    view.backgroundColor = [UIColor blueColor];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 300.f;
    }else{
        return 50;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 200;
    }else
    {
        return 0.f;
    }
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint *)targetContentOffset{
    CGFloat offsetY = (*targetContentOffset).y;
    CGFloat min = 0.f;
    CGFloat max = 300.f;
    CGFloat center = min + (max - min)/2.f;
    if (offsetY > min && offsetY < max) {
        if (offsetY > center){
            targetContentOffset->y = max;
        }else{
            targetContentOffset->y = min;
        }
    }

}

@end
