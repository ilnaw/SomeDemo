//
//  YLStaticViewController.m
//  TestOCProject
//
//  Created by zfh on 2019/4/9.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLStaticViewController.h"
#import "UITableViewCell+reuse.h"
#import "YLSettingTableViewCell.h"

typedef NS_ENUM(NSUInteger, YLStaticTableViewCellType) {
    YLStaticTableViewCellTypeHeadPic,
    YLStaticTableViewCellTypeNotification,
    YLStaticTableViewCellTypeAddress,
    YLStaticTableViewCellTypeSetting
};

@interface YLStaticViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, copy)NSArray *dataSource;
@end

@implementation YLStaticViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataSource = @[
                            @[
                                @(YLStaticTableViewCellTypeHeadPic)
                                ],
                            @[
                                @(YLStaticTableViewCellTypeSetting),
                                @(YLStaticTableViewCellTypeNotification),
                                @(YLStaticTableViewCellTypeAddress)
                                ]
                            ];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - dataSource and delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YLStaticTableViewCellType type = [self.dataSource[indexPath.section][indexPath.row] integerValue];
    switch (type) {
        case YLStaticTableViewCellTypeHeadPic:
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCell.reuseid forIndexPath:indexPath];
//            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.imageView.image = [UIImage imageNamed:@"架构分层 1.png"];
            cell.imageView.frame = CGRectMake(15, 12, 20, 20);
            
            return cell;
        }
            break;
        case YLStaticTableViewCellTypeAddress:
        {
            YLSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YLSettingTableViewCell.reuseid forIndexPath:indexPath];
//            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.data = @{
                          @"title":@"地址",
                          @"subTitle":@"北京",
                          @"image":@"北京"
                          };
            
            return cell;
        }
            break;
        case YLStaticTableViewCellTypeNotification:
        {
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCell.reuseid forIndexPath:indexPath];
//            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.textLabel.text = @"开启通知";
            UISwitch *notificationSwitch = [UISwitch new];
            notificationSwitch.onTintColor = [UIColor redColor];
            cell.accessoryView = notificationSwitch;
            
            return cell;
        }
            break;
        case YLStaticTableViewCellTypeSetting:
        {
            YLSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YLSettingTableViewCell.reuseid forIndexPath:indexPath];
//            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.data = @{
                          @"title":@"设置",
                          @"subTitle":@"08：00",
                          @"image":@""
                          };
            
            return cell;
        }
            break;
        default:
            break;
    }

    return nil;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataSource[section] count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YLStaticTableViewCellType type = [self.dataSource[indexPath.section][indexPath.row] integerValue];
    switch (type) {
        case YLStaticTableViewCellTypeHeadPic:
            
            break;
        case YLStaticTableViewCellTypeAddress:
            
            break;
        case YLStaticTableViewCellTypeSetting:
            
            break;
        case  YLStaticTableViewCellTypeNotification:
            
            break;
        default:
            break;
    }
}
#pragma mark - property
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [_tableView registerClass:UITableViewCell.class forCellReuseIdentifier:UITableViewCell.reuseid];
        [_tableView registerClass:YLSettingTableViewCell.class forCellReuseIdentifier:YLSettingTableViewCell.reuseid];
        _tableView.tableFooterView = [UIView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 44;
    }
    return _tableView;
}

@end
