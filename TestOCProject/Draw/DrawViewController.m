//
//  DrawViewController.m
//  TestOCProject
//
//  Created by wl on 2019/4/15.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "DrawViewController.h"
#import "DrawView.h"
#import "YLCustomDrawView.h"
#import "YLCustomBottomLineView.h"
#import "UIViewController+SafeArea.h"

@interface DrawViewController ()<YLCustomDrawViewDelegate>
@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)dispatch_semaphore_t sema;
@property (nonatomic, strong)NSMutableArray *dataSource;
@property (nonatomic) dispatch_queue_t syncSaveQueen;
@end

@implementation DrawViewController
//同时重写get和set 需同步成员变量
@synthesize name = _name;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setTranslucent:NO];
    
    YLCustomBottomLineView *view = [[YLCustomBottomLineView alloc]init];
    view.frame = self.view.frame;
    view.delegate = self;
    [self.view addSubview:view];
    
//    NSLog(@"**********************");
//    NSLog(@"asyncArray=%@",[self fetchDataFromServe]);
//    NSLog(@"**********************");
    
    self.syncSaveQueen = dispatch_queue_create("sync_save_data", NULL);
    
    self.dataSource = [NSMutableArray arrayWithCapacity:0];
    dispatch_async(self.syncSaveQueen, ^{
        [self saveData:@"1"];
        [self saveData:@"2"];
        [self saveData:@"3"];
        [self saveData:@"4"];
    });
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSLog(@"dataSource=%@",self.dataSource);
//    });
    NSLog(@"========semaphore只会阻塞当前线程");
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"%@",NSStringFromUIEdgeInsets(self.safeArea));
}

- (void)didSelectedDrawview:(id)view index:(NSInteger)index
{
    NSLog(@"-----点击了按钮");
}

- (void)getData{
    [self getData:false a:@"1" b:@"2"];
}

- (void)getData:(BOOL)refresh a:(NSString *)a b:(NSString *)b
{
    
}

- (NSString *)name
{
    return @"123";
}
- (dispatch_semaphore_t)sema
{
    if (!_sema) {
        _sema = dispatch_semaphore_create(1);
    }
    return _sema;
}

- (void)saveData:(id)obj
{
    dispatch_semaphore_wait(self.sema, DISPATCH_TIME_FOREVER);
    NSLog(@"###################%@",obj);
    NSMutableArray * array = [NSMutableArray arrayWithCapacity:0];
    //下面这个来代替我们平时常用的异步网络请求
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i=0; i<1000000; i++) {
            [array addObject:[NSNumber numberWithInt:i]];
        }
        NSLog(@"array = %ld ",array.count);
        dispatch_semaphore_signal(self.sema);
    });
}
- (__kindof NSArray  *)fetchDataFromServe{
    
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    //假如下面这个数组是用来存放数据的
    NSMutableArray * array = [NSMutableArray arrayWithCapacity:0];
    //下面这个来代替我们平时常用的异步网络请求
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        for (int i=0; i<10; i++) {
            [array addObject:[NSNumber numberWithInt:i]];
        }
        NSLog(@"array = %@",array);
        dispatch_semaphore_signal(sema);
    });
    
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    return array;
}



@end
