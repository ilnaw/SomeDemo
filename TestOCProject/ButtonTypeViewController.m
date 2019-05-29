//
//  ButtonTypeViewController.m
//  TestOCProject
//
//  Created by wl on 2019/5/14.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "ButtonTypeViewController.h"
#import "UIButton+YLButtonLayoutType.h"

@interface ButtonTypeViewController ()

@end

@implementation ButtonTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTranslucent:NO];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *normalButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"标题" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"jiankys14_icon"] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor whiteColor];

        button;
    });
    
    UIButton *rightButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"这是一个很长的标题" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"jiankys14_icon"] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor whiteColor];
        
        button;
    });
    
    UIButton *topButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"这是一个很长的标题" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"jiankys14_icon"] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor whiteColor];
        
        button;
    });
    
    UIButton *bottomButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"这是一个很长的标题" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"jiankys14_icon"] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor whiteColor];
        
        button;
    });
    
    [self.view addSubview:normalButton];
    [normalButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(@(50));
        make.size.mas_equalTo(CGSizeMake(120, 100));
    }];
    [normalButton yl_setButtonLayoutType:YLButtonLayoutTypeImageTop];
    
}

@end
