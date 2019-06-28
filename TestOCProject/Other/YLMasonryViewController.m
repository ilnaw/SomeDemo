//
//  YLMasonryViewController.m
//  TestOCProject
//
//  Created by zfh on 2019/4/9.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLMasonryViewController.h"

@interface YLMasonryViewController ()
@property (strong, nonatomic)UILabel *labelA;
@property (strong, nonatomic)UILabel *labelB;
@property (strong, nonatomic)UILabel *labelC;
@property (strong, nonatomic)MASConstraint *top;
@end

@implementation YLMasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTranslucent:NO];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.labelA = ({
        UILabel *label = [[UILabel alloc]init];
        label.backgroundColor = [UIColor redColor];
        
        label;
    });
    
    self.labelB = ({
        UILabel *label = [[UILabel alloc]init];
        label.backgroundColor = [UIColor blueColor];
        
        label;
    });
    
    self.labelC = ({
        UILabel *label = [[UILabel alloc]init];
        label.backgroundColor = [UIColor greenColor];
        
        label;
    });
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(updateLayout:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [self.view addSubview:self.labelA];
    [self.view addSubview:self.labelB];
    [self.view addSubview:self.labelC];
    
    [self.labelA mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 15, 0, 15));
        make.height.mas_equalTo(100);
    }];
    
    [self.labelB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 15, 0, 15));
        make.height.mas_equalTo(100);
        make.top.equalTo(self.labelA.mas_bottom).offset(15);
    }];
    
    [self.labelC mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 15, 0, 15));
        make.height.mas_equalTo(100);
        self.top = make.top.equalTo(self.labelB.mas_bottom).offset(15).priorityMedium();
        make.top.equalTo(self.labelA.mas_bottom).offset(15).priorityLow();
    }];
    
    [button mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.labelC.mas_bottom).offset(15);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
}

- (void)updateLayout:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    self.labelB.hidden = sender.selected;
    if (sender.selected) {
        [self.top uninstall];
    }
    else{
        [self.top install];
    }

    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:8 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        
    }];
}

@end
