//
//  SecondMasonryViewController.m
//  TestOCProject
//
//  Created by wl on 2019/4/28.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "SecondMasonryViewController.h"
#import <Masonry/Masonry.h>
#import "UIView+WXFrame.h"
#import "SnapViewController.h"

@interface LinkCell : UIView
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel *contenLabel;
@property (nonatomic, strong) UIControl *containerView;
@end

@implementation LinkCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        
        self.containerView = ({
            UIControl *view = UIControl.new;
            view.backgroundColor = [UIColor orangeColor];
            view.layer.cornerRadius = 20;
            [view addTarget:self action:@selector(linkCellDidTap) forControlEvents:UIControlEventTouchUpInside];
            
            view;
        });
        
        self.contenLabel = ({
            UILabel *label = UILabel.new;
            label.font = [UIFont systemFontOfSize:14.0];
            label.textColor = [UIColor darkGrayColor];
            label.numberOfLines = 1;
            
            label;
        });
        
        self.button = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setBackgroundImage:[UIImage imageNamed:@"tx-yytg-tips-icon"] forState:UIControlStateNormal];
            
            button;
        });
        
        [self addSubview:self.containerView];
        [self.containerView addSubview:self.contenLabel];
        [self.containerView addSubview:self.button];
        
        [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.height.equalTo(@(40));
        }];
        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.containerView).offset(12);
            make.centerY.equalTo(self.containerView);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        [self.contenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.button.mas_trailing).offset(12);
            make.trailing.equalTo(self.containerView).offset(-12);
            make.centerY.equalTo(self.containerView);
            make.width.lessThanOrEqualTo(@(UIScreen.mainScreen.bounds.size.width - 12*5 - 20));
        }];
    }
    return self;
}

- (void)configData{
    self.contenLabel.text = @"123123123123123123112312312312312312311231231231231231231";
}

- (void)linkCellDidTap
{
    NSLog(@"点击了linkcell");
}

@end

@interface VerticalView : UIView
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UIView *nextView;
@end

@implementation VerticalView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor greenColor];
        self.nameLabel = ({
            UILabel *label = [[UILabel alloc]init];
            label.font = [UIFont systemFontOfSize:14.0];
            label.textColor = [UIColor orangeColor];
            label.numberOfLines = 0;
            label.backgroundColor = [UIColor whiteColor];
            
            label;
        });
        self.nextView = ({
            UIView *view = [[UIView alloc]init];
            view.backgroundColor = [UIColor blueColor];
            
            view;
        });
        
        [self addSubview:self.nameLabel];
        [self addSubview:self.nextView];
        
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.trailing.equalTo(self).insets(UIEdgeInsetsMake(0, 12, 0, 12));
        }];
        [self.nextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.trailing.equalTo(self.nameLabel);
            make.top.equalTo(self.nameLabel.mas_bottom);
            make.height.equalTo(@(100));
        }];
        
    }
    return self;
}
- (void)configData{
    self.nameLabel.text = @"asdajsdasdausioduaoisudoiasudoiuaoudoiasdlasdlkajsldkjlaksjdlk";
}

@end

@interface VerticalCell : UITableViewCell
@property (nonatomic, strong)UIView *container;
@property (nonatomic, strong)UILabel *labelA;
@property (nonatomic, strong)UILabel *labelB;
@property (nonatomic, strong)UILabel *labelC;
@end

@implementation VerticalCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        self.container = ({
            UIView *view = [UIView new];
            view.backgroundColor = [UIColor whiteColor];
            view.layer.cornerRadius = 10;
            
            view;
        });
        
        self.labelA = ({
            UILabel *label = [UILabel new];
            label.font = [UIFont systemFontOfSize:14];
            label.textColor = [UIColor darkGrayColor];
            label.numberOfLines = 0;
            
            label;
        });
        self.labelB = ({
            UILabel *label = [UILabel new];
            label.font = [UIFont systemFontOfSize:14];
            label.textColor = [UIColor darkGrayColor];
            label.numberOfLines = 0;
            
            label;
        });
        self.labelC = ({
            UILabel *label = [UILabel new];
            label.font = [UIFont systemFontOfSize:14];
            label.textColor = [UIColor darkGrayColor];
            label.numberOfLines = 0;
            
            label;
        });
        
        [self addSubview:self.container];
        [self.container addSubview:self.labelA];
        [self.container addSubview:self.labelB];
        [self.container addSubview:self.labelC];
        
        [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(5, 10, 5, 10));
        }];
        [self.labelA mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.container).offset(8);
            make.trailing.leading.equalTo(self.container).insets(UIEdgeInsetsMake(0, 10, 0, 10));
        }];
        [self.labelB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.leading.equalTo(self.labelA);
            make.top.equalTo(self.labelA.mas_bottom).offset(8);
        }];
        [self.labelC mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.leading.equalTo(self.labelB);
            make.top.equalTo(self.labelB.mas_bottom).offset(8);
            make.bottom.equalTo(self.container.mas_bottom).offset(-8);
        }];
    }
    return self;
}

- (void)configData:(NSDictionary *)data
{
    self.labelA.text = data[@"A"];
    self.labelB.text = data[@"B"];
    self.labelC.text = data[@"C"];
}

@end

@interface YLADBannerView : UIControl
@property (nonatomic, strong)UIImageView *imageView;
@end

@implementation YLADBannerView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.equalTo(self).insets(UIEdgeInsetsMake(50, 50, 50, 0));
            make.width.height.equalTo(@(30));
        }];
    }
    return self;
}

- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.backgroundColor = [UIColor redColor];
    }
    return _imageView;
}

@end

@interface SecondMasonryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)LinkCell *linkCell;
@property (nonatomic, strong)VerticalView *verticalView;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSArray *data;
@property (nonatomic, strong)NSArray *heightArray;
@property (nonatomic, strong)YLADBannerView *bannerView;
@property (nonatomic, strong)CADisplayLink *displayLink;
@property (nonatomic, assign)CFTimeInterval currentTime;
@property (nonatomic, strong)UIView *content;
@end

@implementation SecondMasonryViewController
@synthesize configDic = _otherName;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:self.tableView];
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
//
////    self.configDic = @{@"key":@"wanli"};
//    _otherName = @{@"key":@"wanli"};
//
//    self.data = @[
//                  @{@"A":@"12312312312312312312312312312311231231231231231231231231231231",
//                    @"B":@"22222222222",
//                    @"C":@"kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk12312312312312312312312312312311231231231231231231231231231231"
//                    },
//                  @{@"A":@"kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk12312312312312312312312312312311231231231231231231231231231231",
//                    @"B":@"22222222222",
//                    @"C":@"1231231231231231231231231231231"
//                    },
//                  @{@"A":@"1231231231231231231231231231231sssssssssssssssssssssss",
//                    @"B":@"22222222222eeeeeeeeeeeeeeeeeeeeeeeee",
//                    @"C":@"kkkkkkkkkkkkkkkkkkkkkkkkkkkkksssssssssssssssssssssss"
//                    }
//                  ];
//    [self calculateCellHeight];
//    [self startTimer];
    
    UIView *content = UIView.new;
    content.backgroundColor = [UIColor blueColor];
    [self.view addSubview:content];
    
    CALayer *bottomLine = CALayer.new;
    bottomLine.frame = CGRectMake(content.yl_width/2.0, 0, 1, 40);
    bottomLine.backgroundColor = [UIColor orangeColor].CGColor;
    [content.layer addSublayer:bottomLine];
    
    NSLog(@"--------%lf",content.yl_width);
    
    [content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(230));
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).multipliedBy(0.8);
    }];
    
    UIView *container = UIView.new;
    container.backgroundColor = [UIColor redColor];
    [content addSubview:container];

    
    UILabel *label1 = UILabel.new;
    label1.textColor = [UIColor whiteColor];
    label1.numberOfLines = 0;
    [container addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(container);
    }];
    
    UILabel *label2 = UILabel.new;
    label2.textColor = [UIColor whiteColor];
    label2.numberOfLines = 0;
    [container addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(container);
        make.top.equalTo(label1.mas_bottom).offset(4);
    }];
    
    label1.text = @"123123123123123123123123123123132131231231231231231231231231231231321312312312312312312312312312312313213";
    label2.text = @"123";
    
    UIView *bottomContaniner = [UIView new];
    bottomContaniner.backgroundColor = [UIColor orangeColor];
    [container addSubview:bottomContaniner];

    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(content).insets(UIEdgeInsetsMake(0, 20, 0, 20));
        make.top.equalTo(@(30));
    }];
    
    [bottomContaniner mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(content).insets(UIEdgeInsetsMake(0, 20, 0, 20));
        make.top.equalTo(container.mas_bottom).offset(30);
        make.bottom.equalTo(content.mas_bottom).offset(-30);
        make.height.equalTo(@(1000));
    }];
    
    self.content = content;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(snap)];
    [self.view addGestureRecognizer:tap];
    
//    self.linkCell = ({
//        LinkCell *cell = [[LinkCell alloc]init];
//
//        cell;
//    });
//
//    self.verticalView = ({
//        VerticalView *view = [[VerticalView alloc]init];
//
//        view;
//    });
//
//    [self.view addSubview:self.linkCell];
//    [self.view addSubview:self.verticalView];
//
//    [self.verticalView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.linkCell.mas_bottom);
//        make.centerX.equalTo(self.view);
//        make.width.equalTo(@(200));
//    }];
//    [self.linkCell mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(@(100));
//        make.centerX.equalTo(self.view);
//        make.height.equalTo(@(60));
//        make.width.mas_equalTo(self.view.frame.size.width);
//    }];
//
//    [self.linkCell configData];
//    [self.verticalView configData];
    
//    [self.view addSubview:self.bannerView];
//    [self.bannerView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.top.equalTo(self.view).offset(100);
//    }];
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.bannerView.imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.left.bottom.equalTo(self.bannerView).insets(UIEdgeInsetsMake(10, 10, 10, 0));
//            make.width.equalTo(@(100));
//            make.height.equalTo(@(100));
//        }];
//    });

}

- (void)snap{
    SnapViewController *vc = [[SnapViewController alloc]init];
    vc.snapImg = [self captureView:self.content];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UIImage *)captureView:(UIView *)view{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [UIScreen mainScreen].scale);
//    if (drawBlock) {
//        drawBlock();
//    } else {
        [self.content drawViewHierarchyInRect:view.bounds
                   afterScreenUpdates:NO];
//    }
//    if (block) {
//        CGContextRef context = UIGraphicsGetCurrentContext();
//        block(context);
//    }
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

- (void)startTimer
{
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(timerTick:)];
    _displayLink.frameInterval = 60;
    self.currentTime = CACurrentMediaTime();
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)timerTick:(CADisplayLink *)displayLink{
    NSInteger time = displayLink.timestamp - self.currentTime;
    if (10 - time <= 0) {
        [displayLink setPaused:true];
        [displayLink invalidate];
    }
    NSLog(@"------------%@",_otherName);
}

- (YLADBannerView *)bannerView
{
    if (!_bannerView) {
        _bannerView = [[YLADBannerView alloc]init];
        _bannerView.backgroundColor = [UIColor blueColor];
    }
    return _bannerView;
}

- (void)calculateCellHeight{
    NSMutableArray *tmp = NSMutableArray.new;
    for (NSDictionary *data in self.data) {
        CGFloat heightA = [data[@"A"] boundingRectWithSize:CGSizeMake(UIScreen.mainScreen.bounds.size.width - 40, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine |  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height;
        CGFloat heightB = [data[@"B"] boundingRectWithSize:CGSizeMake(UIScreen.mainScreen.bounds.size.width - 40, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine |  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height;
        CGFloat heightC = [data[@"C"] boundingRectWithSize:CGSizeMake(UIScreen.mainScreen.bounds.size.width - 40, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine |  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height;
        CGFloat height = ceil(heightA) + ceil(heightB) + ceil(heightC) + 10 + 8*4;
        
        [tmp addObject:@(height)];
    }
    self.heightArray = tmp.copy;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VerticalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [cell configData:self.data[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.heightArray[indexPath.row] floatValue];
}


- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[VerticalCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
}

@end
