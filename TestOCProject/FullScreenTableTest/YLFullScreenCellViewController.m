//
//  YLFullScreenCellViewController.m
//  TestOCProject
//
//  Created by wl on 2019/7/25.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLFullScreenCellViewController.h"
#import "YLCellViewController.h"

@interface YLFullScreenCell : UITableViewCell
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)YLCellViewController *vc;
@end

@implementation YLFullScreenCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style
                    reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        self.titleLabel = ({
            UILabel *label = UILabel.new;
            label.font = [UIFont systemFontOfSize:20];
            label.textColor = [UIColor blackColor];
            label;
        });
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}

- (void)setVc:(YLCellViewController *)vc
{
    _vc = vc;
    [self insertSubview:vc.view belowSubview:self.titleLabel];
    [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

@end

@interface YLFullScreenCellViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation YLFullScreenCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;

    [@"" drawWithRect:CGRectZero
              options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
           attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14],NSForegroundColorAttributeName : [UIColor redColor]}
              context:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuserId = [NSString stringWithFormat:@"%@_%ld",YLFullScreenCell.reuseid,indexPath.row];
    YLFullScreenCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserId];
    if (!cell) {
        cell = [[YLFullScreenCell alloc]initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:YLFullScreenCell.reuseid];
        if (!cell.vc) {
            cell.vc = [[YLCellViewController alloc]init];
        }
    }
    cell.titleLabel.text = @"全屏cell";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.view.frame.size.height;
}

@end
