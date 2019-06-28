//
//  GuideViewController.m
//  TestOCProject
//
//  Created by wl on 2019/6/28.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "GuideViewController.h"

@interface GuideViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)NSMutableArray *titles;
@property (nonatomic, strong)NSMutableArray *classNames;
@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titles = @[].mutableCopy;
    self.classNames = @[].mutableCopy;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self addCell:@"IM" class:@"YLSessionViewController"];
    [self addCell:@"朋友圈" class:@"YLMomentHeaderReuseTestVC"];
    [self addCell:@"scrollView联动" class:@"MainViewController"];
    [self addCell:@"历天气结构" class:@"YLWeatherFrameViewController"];
    [self addCell:@"YYText_autoLayout例子" class:@"YYTextViewController"];
    [self addCell:@"弹窗优先级控制器" class:@"AlertWindowVC"];
    [self addCell:@"历运势图" class:@"YLDrawDestinyViewController"];
    [self addCell:@"历金币" class:@"YLCoinViewController"];
    [self addCell:@"渐变label测试" class:@"YLGradViewController"];
    [self addCell:@"scrollView联动的x一些动画" class:@"ScrollOffsetViewController"];
    [self addCell:@"无限切换例子" class:@"FakeScrollViewController"];
    [self addCell:@"staticTableView" class:@"YLStaticViewController"];
    [self addCell:@"masonry1" class:@"YLMasonryViewController"];
    [self addCell:@"masonry自适应和截图动画" class:@"SecondMasonryViewController"];
    [self addCell:@"画图" class:@"YLLayerViewController"];
    [self addCell:@"drawWithXIb" class:@"YLDrawXibViewController"];
    [self addCell:@"AS_OC" class:@"AsyncViewController"];
    [self addCell:@"按钮位置" class:@"ButtonTypeViewController"];
}

- (void)addCell:(NSString *)title class:(NSString *)className {
    [self.titles addObject:title];
    [self.classNames addObject:className];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *className = self.classNames[indexPath.row];
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *ctrl = class.new;
        ctrl.title = _titles[indexPath.row];
        [self.navigationController pushViewController:ctrl animated:YES];
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.titles[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titles.count;
}
@end
