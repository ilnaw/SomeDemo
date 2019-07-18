//
//  PayCardViewController.m
//  TestOCProject
//
//  Created by wl on 2019/7/18.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "PayCardViewController.h"
#import <PayCardsRecognizer/PayCardsRecognizer.h>

@interface PayCardViewController ()<PayCardsRecognizerPlatformDelegate>;
@property (nonatomic, strong)PayCardsRecognizer *r;
@end

@implementation PayCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.r = [[PayCardsRecognizer alloc]initWithDelegate:self
                                              resultMode:PayCardsRecognizerResultModeSync
                                               container:self.view
                                              frameColor:[UIColor greenColor]];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.r startCamera];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.r stopCamera];
}

- (void)payCardsRecognizer:(PayCardsRecognizer *)payCardsRecognizer didRecognize:(PayCardsRecognizerResult *)result
{
    
}
@end
