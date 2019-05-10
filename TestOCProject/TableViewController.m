//
//  TableViewController.m
//  TestOCProject
//
//  Created by wanli on 2019/3/24.
//  Copyright © 2019 wanli. All rights reserved.
//

#import "TableViewController.h"
#import "UITableViewCell+reuse.h"
#import "NextViewController.h"

@interface HeaderView : UIView
@property (strong, nonatomic)UIImageView *background;
@end

@implementation HeaderView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        
        [self addSubview:self.background];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.background.frame = CGRectMake(0, -200, self.frame.size.width, 350);
}

- (UIImageView *)background
{
    if (!_background) {
        _background = [[UIImageView alloc]init];
        _background.contentMode = UIViewContentModeScaleAspectFill;
//        _background.image = [UIImage imageNamed:@"架构分层 1.png"];
        _background.backgroundColor = [UIColor blueColor];
    }
    return _background;
}

@end

@interface CustomNavigationBar()
@property (strong, nonatomic)UIImageView *avator;
@property (strong, nonatomic)UILabel *nameLabel;
@property (strong, nonatomic)UIButton *settingButton;
@end

@implementation CustomNavigationBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        [self addSubview:self.avator];
        [self addSubview:self.nameLabel];
        [self addSubview:self.settingButton];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat buttonWidth = 30;
    CGFloat padding = 10;
    CGFloat topMargin = UIApplication.sharedApplication.statusBarFrame.size.height;
    self.settingButton.frame = CGRectMake(self.frame.size.width - buttonWidth - padding, topMargin, buttonWidth, buttonWidth);
}

- (void)attachToScrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y;
    CGFloat originOffsetY =  offsetY + 150 + [UIApplication sharedApplication].statusBarFrame.size.height;
    CGFloat minHeight = 88;
    CGFloat maxHeight = 128;
    CGFloat topMargin = UIApplication.sharedApplication.statusBarFrame.size.height;
    CGFloat padding = 10;
    
    CGFloat barHeight = MIN(maxHeight, MAX(maxHeight-originOffsetY, minHeight));
    self.frame = CGRectMake(0, 0, self.frame.size.width, barHeight);
    
    CGFloat detla = 1 - (barHeight - minHeight)/(maxHeight - minHeight);
    self.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:detla];
    
    CGFloat avatorWidth = barHeight - topMargin - padding;
    self.avator.frame = CGRectMake(padding,topMargin, avatorWidth, avatorWidth);
    self.nameLabel.frame = CGRectMake(avatorWidth + padding * 2, topMargin + padding, 200, 18);
    self.nameLabel.font = [UIFont systemFontOfSize:20 - 5*detla];
}

- (void)backToTop
{
    if (self.settingBlock) {
        self.settingBlock();
    }
}

- (UIImageView *)avator
{
    if (!_avator) {
        _avator = [[UIImageView alloc]init];
        _avator.backgroundColor = [UIColor blackColor];
    }
    return _avator;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.text = @"18883755110";
    }
    return _nameLabel;
}

- (UIButton *)settingButton
{
    if (!_settingButton) {
        _settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _settingButton.backgroundColor = [UIColor whiteColor];
//        [_settingButton setTitle:@"图" forState:UIControlStateNormal];
        [_settingButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_settingButton.titleLabel setFont:[UIFont systemFontOfSize:14.f]];
        [_settingButton addTarget:self action:@selector(backToTop) forControlEvents:UIControlEventTouchUpInside];
    }
    return _settingButton;
}

@end

@interface TableViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (strong, nonatomic)UITableView  *tableView;
@property (strong, nonatomic)HeaderView  *headerView;
@property (strong, nonatomic)CustomNavigationBar *navigationBar;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.tableView.contentInset = UIEdgeInsetsMake(150, 0, 0, 0);
    
    [self.tableView addSubview:self.headerView];
    [self.view addSubview:self.navigationBar];
    [self.tableView setContentOffset:CGPointMake(0, -150)];
    
    self.navigationItem.title = @"测试";
    self.fd_prefersNavigationBarHidden = true;
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    NextViewController *vc = [[NextViewController alloc]init];
    [self.navigationController pushViewController:vc animated:true];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCell.reuseid forIndexPath:indexPath];
    
    cell.textLabel.text = @"测试问题";
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.navigationBar attachToScrollViewDidScroll:scrollView];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:UITableViewCell.class forCellReuseIdentifier:UITableViewCell.reuseid];
    }
    return _tableView;
}
- (HeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [[HeaderView alloc]init];
        _headerView.frame = CGRectMake(0, -150, self.view.frame.size.width, 150);
    }
    return _headerView;
}
- (CustomNavigationBar *)navigationBar
{
    if (!_navigationBar) {
        _navigationBar = [[CustomNavigationBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 128)];
    }
    return _navigationBar;
}
@end
