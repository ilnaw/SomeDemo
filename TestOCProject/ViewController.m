//
//  ViewController.m
//  TestOCProject
//
//  Created by wanli on 2019/3/14.
//  Copyright © 2019 wanli. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "UITableViewCell+reuse.h"
#import <UITableView+FDTemplateLayoutCell/UITableView+FDTemplateLayoutCell.h>
#import "Masonry.h"
#import "UIViewController+ImagePicker.h"
#import <YYAsyncLayer/YYAsyncLayer.h>

@interface AsyncView: UIView
@property (strong, nonatomic)UILabel  *nameLabel;
@end

@implementation AsyncView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.nameLabel];

    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [[YYTransaction transactionWithTarget:self selector:@selector(contentsNeedUpdated)] commit];
}

- (void)contentsNeedUpdated{

    [self.layer setNeedsDisplay];
}

- (YYAsyncLayerDisplayTask *)newAsyncDisplayTask{
    YYAsyncLayerDisplayTask *task = [YYAsyncLayerDisplayTask new];
    task.willDisplay = ^(CALayer * _Nonnull layer) {

    };
    task.display = ^(CGContextRef  _Nonnull context, CGSize size, BOOL (^ _Nonnull isCancelled)(void)) {
        
    };
    task.didDisplay = ^(CALayer * _Nonnull layer, BOOL finished) {

    };

    return task;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = [UIFont systemFontOfSize:14.f];
        _nameLabel.textColor = [UIColor redColor];
        _nameLabel.numberOfLines = 0;
    }
    return _nameLabel;
}

@end

@interface RemarkView : UIView

@property (strong, nonatomic)UILabel *titleLabel;
@property (strong, nonatomic)UILabel *contentLabel;
@property (strong, nonatomic)UIStackView *stackView;
@property (strong, nonatomic)UIButton *shootButton;
@end

@implementation RemarkView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.stackView];
        [self.stackView addArrangedSubview:self.titleLabel];
        [self.stackView addArrangedSubview:self.contentLabel];
        [self.stackView addArrangedSubview:self.shootButton];
        
        [self setConstraints];
    }
    return self;
}

- (void)setConstraints{
    
    [self.stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
//    [@[self.titleLabel,self.contentLabel] mas_distributeViewsAlongAxis:MASAxisTypeVertical
//                                                      withFixedSpacing:15
//                                                           leadSpacing:15
//                                                           tailSpacing:15];
//
//    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(self);
//        make.height.equalTo(@20);
//    }];
//
//    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self).insets(UIEdgeInsetsMake(0, 15, 0, 15));
//    }];
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.stackView removeArrangedSubview:self.titleLabel];
//    });
}

- (UIButton *)shootButton
{
    if(!_shootButton){
        _shootButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_shootButton setTitle:@"头像" forState:UIControlStateNormal];
    }
    return _shootButton;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return _titleLabel;
}

- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:13];
    }
    return _contentLabel;
}

- (UIStackView *)stackView
{
    if (!_stackView) {
        _stackView = [[UIStackView alloc]init];
        _stackView.distribution = UIStackViewDistributionFillProportionally;
        _stackView.spacing = 15;
        _stackView.alignment = UIStackViewAlignmentLeading;
        _stackView.axis = UILayoutConstraintAxisVertical;
    }
    return _stackView;
}

@end

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic)UITableView  *tableView;
@property (assign, nonatomic)CGFloat    tableViewHeight;
@property (strong, nonatomic)UIScrollView *scrollView;
@property (strong, nonatomic)RemarkView *remarkView;
@property (strong, nonatomic)AsyncView *aView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self.view addSubview:self.tableView];
//    self.tableViewHeight = 200;
    [self.view addSubview:self.scrollView];
    
    UIView *container = [[UIView alloc]init];
    [self.scrollView addSubview:container];
    
    UILabel *label1 = [[UILabel alloc]init];

    label1.font = [UIFont systemFontOfSize:30];
    label1.numberOfLines = 0;
    [container addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.font = [UIFont systemFontOfSize:30];
    label2.numberOfLines = 0;
    [container addSubview:label2];
    
    [container addSubview:self.remarkView];
    [container addSubview:self.aView];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
    }];
    
    [self.aView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.equalTo(container).offset(15);
        make.trailing.equalTo(container).offset(-15);
    }];
    
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.aView.mas_bottom).offset(15);
        make.leading.equalTo(container).offset(15);
        make.trailing.equalTo(container).offset(-15);
    }];
    
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(label1);
        make.top.equalTo(label1.mas_bottom).offset(15);
    }];
    
    [self.remarkView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(label2);
        make.top.equalTo(label2.mas_bottom).offset(15);
    }];
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.scrollView);
        make.bottom.equalTo(self.remarkView.mas_bottom).offset(15);
    }];
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.aView.nameLabel.text = @"大口喝点酒哈 u 为切记啊大空间撒打算打回家啊还是多久啊啥的空间";
        label1.text = @"阿迪是打算离开的教练卡啊圣诞节垃圾打卡机毮 i 未来将阿斯顿卡勒季斯大家快乐圣诞节阿克琉斯经典款垃圾啊就看了三大纪律卡势均力敌阿迪是打算离开的教练卡啊圣诞节垃圾打卡机毮 i 未来将阿斯顿卡勒季斯大家快乐圣诞节阿克琉斯经典款垃圾啊就看了三大纪律卡势均力敌阿迪是打算离开的教练卡啊圣诞节垃圾打卡机毮 i 未来将阿斯顿卡勒季斯大家快乐圣诞节阿克琉斯经典款垃圾啊就看了三大纪律卡势均力敌";
        label2.text = @"阿迪是打算离开的教练卡啊圣诞节垃圾打卡机毮 i 未来将阿斯顿卡勒季斯大家快乐圣诞节阿克琉斯经典款垃圾啊就看了三大纪律卡势均力敌阿迪是打算离开的教练卡啊圣诞节垃圾打卡机毮 i 未来将阿斯顿卡勒季斯大家快乐圣诞节阿克琉斯经典款垃圾啊就看了三大纪律卡势均力敌阿迪是打算离开的教练卡啊圣诞节垃圾打卡机毮 i 未来将阿斯顿卡勒季斯大家快乐圣诞节阿克琉斯经典款垃圾啊就看了三大纪律卡势均力敌阿迪是打算离开的教练卡啊圣诞节垃圾打卡机毮 i 未来将阿斯顿卡勒季斯大家快乐圣诞节阿克琉斯经典款垃圾啊就看了三大纪律卡势均力敌";
        self.remarkView.titleLabel.text = @"这是一个梦想adjklasdaksdklajksdjaksjdksajd";
        self.remarkView.contentLabel.attributedText = [[NSAttributedString alloc]initWithString:@"这是一个1111111111111111111111111111111111111111111111111111111111SSSSSSSSSSSSSSSSSSSSSS1111111111111111111111111111111111111111111111111111111111111111111111111SSSSSSSSSSSSSSSSSSSSSS1111111111111111111111111111SSSSSSSSSSSSSSSSSSSSSS1111111111111111111111111111111111111111SSSSSSSSSSSSSSSSSSSSSS1111111111111111111111111111111111SSSSSSSSSSSSSSSSSSSSSS11111111111111111111111111111111111111111111111SSSSSSSSSSSSSSSSSSSSSS"
                                                                                     attributes:@{
                                                                                                  NSForegroundColorAttributeName:[UIColor orangeColor],
                                                                                                  NSFontAttributeName:[UIFont systemFontOfSize:11 weight:UIFontWeightBold]
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            }];
//        [UIView animateWithDuration:0.5 animations:^{
//            [self.view layoutIfNeeded];
//        }];
//    });
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        self.tableViewHeight = 400;
//        [self.view setNeedsUpdateConstraints];
//        [self.view updateConstraintsIfNeeded];
//        [UIView animateWithDuration:1.0 animations:^{
//            [self.view layoutIfNeeded];
//        }];
//    });
    [self.remarkView.shootButton addTarget:self action:@selector(shoot:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)shoot:(UIButton *)sender{
    [self presentImagePicker:^(UIImage * image) {
        NSLog(@"%@",image);
    }];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
//    self.scrollView.frame = self.view.bounds;
}

//- (void)updateViewConstraints
//{
//    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.right.equalTo(self.view);
//        make.height.mas_equalTo(self.tableViewHeight);
//    }];
//    [super updateViewConstraints];
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCell.reuseid forIndexPath:indexPath];
    cell.model = @{};
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView fd_heightForCellWithIdentifier:TableViewCell.reuseid cacheByIndexPath:indexPath configuration:^(TableViewCell *cell) {
        cell.model = @{};
    }];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = ({
            UITableView *table = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
            [table registerClass:[TableViewCell class] forCellReuseIdentifier:TableViewCell.reuseid];
            table.delegate = self;
            table.dataSource = self;
            
            table;
        });
    }
    return _tableView;
}
- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
    }
    return _scrollView;
}

- (RemarkView *)remarkView
{
    if (!_remarkView) {
        _remarkView = [[RemarkView alloc]init];
    }
    return _remarkView;
}
- (AsyncView *)aView
{
    if (!_aView) {
        _aView = [[AsyncView alloc]init];
    }
     return _aView;
}
@end
