//
//  YLBViewController.m
//  TestOCProject
//
//  Created by wl on 2019/5/29.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLBViewController.h"
#import "YLRedView.h"
#import "YLBlueView.h"
#import "YLCView.h"
#import "YLShapeView.h"
#import "UIView+DotBadge.h"

@interface YLBViewController ()

@end

@implementation YLBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTranslucent:NO];
    
//    YLBaseView *view = [YLBaseView creatWithInt:1];
//    view.posid = @"123";
//    [view updateUI];
//    view.frame = CGRectMake(100, 100, 180, 50);
//    [self.view addSubview:view];
//
//    YLBaseView *view2 = [YLBaseView creatWithInt:0];
//    view2.posid = @"2222";
//    [view2 updateUI];
//    view2.frame = CGRectMake(100, 170, 180, 50);
//    [self.view addSubview:view2];
//
//    YLCView *view3 = [YLCView new];
//    view3.frame = CGRectMake(100, 250, 180, 50);
//    view3.posid = @"8888";
//    [self.view addSubview:view3];
    UIView *dotSuperView = [UIView new];
    dotSuperView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:dotSuperView];
    [dotSuperView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 50));
    }];
    
    [dotSuperView layoutIfNeeded];
    [dotSuperView showDotWithCorner:UIRectCornerTopLeft offset:CGPointZero];
    
    YLShapeView *shapeView = [YLShapeView new];
    shapeView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:shapeView];
    
    [shapeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.equalTo(self.view).insets(UIEdgeInsetsMake(0, 10, 10, 0));
        make.size.equalTo(@(CGSizeMake(100, 100)));
    }];
    
    UIView *container = [UIView new];
    container.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:container];
    
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.top.equalTo(self.view).insets(UIEdgeInsetsMake(10, 0, 0, 10));
    }];
    
    UILabel *amountLabel = [UILabel new];
    amountLabel.text = @"123.00";
    amountLabel.font = [UIFont systemFontOfSize:60 weight:UIFontWeightSemibold];
    [amountLabel sizeToFit];
    CGSize amountSize = amountLabel.bounds.size;
    [self.view addSubview:amountLabel];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = CGRectMake(10, 60, amountSize.width, amountSize.height);
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    gradientLayer.colors = @[(__bridge id)[[UIColor redColor] colorWithAlphaComponent:0.4].CGColor,(__bridge id)[UIColor redColor].CGColor];
    gradientLayer.mask = amountLabel.layer;
    [self.view.layer addSublayer:gradientLayer];
    
    if(1){
        UIImageView *icon = [UIImageView new];
        icon.layer.masksToBounds = YES;
//        icon.contentMode = UIViewContentModeScaleAspectFill;
        UIImage *iconImage = [UIImage imageNamed:@"v472_task_500_icon"];
        icon.image = iconImage;
        [container addSubview:icon];
        
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.equalTo(container).insets(UIEdgeInsetsMake(2, 2, 2, 0));
            make.width.height.equalTo(@(38));
//                    make.height.equalTo(@(60));
        }];
        
        UILabel *titleLabel = [UILabel new];
        titleLabel.text = @"123123123";
        titleLabel.textColor = [UIColor blackColor];
        [container addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(icon.mas_trailing).offset(2);
            make.top.bottom.equalTo(container);
            //        make.centerY.equalTo(container);
            make.width.lessThanOrEqualTo(@(60));
        }];
        
        UIImageView *nextImageView = [UIImageView new];
        nextImageView.image = [UIImage imageNamed:@"remind_add_img"];
        [container addSubview:nextImageView];
        
        [nextImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(titleLabel.mas_trailing).offset(2);
            make.trailing.equalTo(container.mas_trailing).offset(-2);
            make.centerY.equalTo(container);
        }];
    }else{
        UIImageView *icon = [UIImageView new];
        UIImage *iconImage = [UIImage imageNamed:@"架构分层 1.png"];
        icon.image = iconImage;
        [container addSubview:icon];
        
        CGFloat ratio = iconImage.size.width/iconImage.size.height;
        CGFloat maxWidth = UIScreen.mainScreen.bounds.size.width/2.0;
        CGFloat maxHeight = UIScreen.mainScreen.bounds.size.height/2.0;
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(container);
            if (iconImage.size.width > maxWidth || iconImage.size.height > maxHeight) {
                if (iconImage.size.width > iconImage.size.height) {
                    make.width.equalTo(@(maxWidth));
                    make.height.equalTo(@(maxWidth/ratio));
                }else{
                    make.height.equalTo(@(maxHeight));
                    make.width.equalTo(@(maxHeight*ratio));
                }
            }else{
                make.width.equalTo(@(iconImage.size.width));
                make.height.equalTo(@(iconImage.size.height));
            }
        }];
    }
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
}

@end
