//
//  FakeScrollViewController.m
//  TestOCProject
//
//  Created by wl on 2019/5/9.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "FakeScrollViewController.h"

@interface FakeScrollViewController ()
@property (nonatomic, strong)UIView  *tempView;
@property (nonatomic, strong)UIView  *currentView;
@end

@implementation FakeScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTranslucent:NO];
    
    self.currentView = [[UIView alloc]init];
    self.currentView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.currentView];
    self.currentView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    self.tempView = [[UIView alloc]init];
    self.tempView.hidden = YES;
    [self.view addSubview:self.tempView];
    
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(left)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self.view addGestureRecognizer:leftSwipe];
    
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(right)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:rightSwipe];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
}

- (void)left{
    [self swipeWithAnimation:UISwipeGestureRecognizerDirectionLeft];
}

- (void)right{
    [self swipeWithAnimation:UISwipeGestureRecognizerDirectionRight];
}

//临时tempView的方法
//- (void)swipeWithAnimation:(UISwipeGestureRecognizerDirection)dirction{
//
//    UIView *nextView = [[UIView alloc]init];
//    [self.view addSubview:nextView];
//    //数据
//    int colorR = arc4random() % 256;
//    int colorG = arc4random() % 256;
//    int colorB = arc4random() % 256;
//    nextView.backgroundColor = [UIColor colorWithRed:colorR/255.0 green:colorG/255.0 blue:colorB/255.0 alpha:1];
//    [self.view addSubview:nextView];
//
//    CGFloat x = self.view.frame.size.width;
//    CGFloat width = x;
//    CGFloat height = self.view.frame.size.height;
//    nextView.frame = CGRectMake(dirction == UISwipeGestureRecognizerDirectionLeft ? x : -x, 0, width, height);
//
//    UIView *temp = self.currentView;
//    self.currentView = nextView;
//
//    [UIView animateWithDuration:0.3 animations:^{
//        nextView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
//        temp.frame = CGRectMake(dirction == UISwipeGestureRecognizerDirectionLeft ? -x : x, 0, width, height);;
//    } completion:^(BOOL finished) {
//        [temp removeFromSuperview];
//    }];
//}

//tempview的方法
- (void)swipeWithAnimation:(UISwipeGestureRecognizerDirection)dirction{

    self.tempView.backgroundColor = self.currentView.backgroundColor;
    self.tempView.hidden = NO;
    
    //数据
    int colorR = arc4random() % 256;
    int colorG = arc4random() % 256;
    int colorB = arc4random() % 256;
    self.currentView.backgroundColor = [UIColor colorWithRed:colorR/255.0 green:colorG/255.0 blue:colorB/255.0 alpha:1];
    
    CGFloat x = self.view.frame.size.width;
    CGFloat width = x;
    CGFloat height = self.view.frame.size.height;
    self.currentView.frame = CGRectMake(dirction == UISwipeGestureRecognizerDirectionLeft ? x : -x, 0, width, height);
    self.tempView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [UIView animateWithDuration:0.3 animations:^{
        self.currentView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        self.tempView.frame = CGRectMake(dirction == UISwipeGestureRecognizerDirectionLeft ? -x : x, 0, width, height);
    } completion:^(BOOL finished) {
        self.tempView.hidden = YES;
    }];
}


@end
