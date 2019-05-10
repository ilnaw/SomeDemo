//
//  RACViewController.m
//  TestOCProject
//
//  Created by wanli on 2019/4/3.
//  Copyright © 2019 wanli. All rights reserved.
//

#import "RACViewController.h"

@interface RACViewController ()
{
    UILabel *_label;
    UIButton *_button;
    UITextField *_textFiled;
    UITextView *_textView;
}
@property (strong, nonatomic)RACSubject *status;
@property (strong, nonatomic)RACBehaviorSubject *dataSource;
@property (nonatomic, copy)NSString *scrollInfo;
@property (nonatomic, copy)NSString *index;
@end

@implementation RACViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _label = [[UILabel alloc]init];
    _label.text = @"123";
    
    _button = [UIButton buttonWithType:UIButtonTypeSystem];
    [_button setTitle:@"button" forState:UIControlStateNormal];
    
    _textFiled = [UITextField new];
    _textFiled.placeholder = @"请输入电话号码";
    
    _textView = [UITextView new];
    _textView.layer.cornerRadius = 10;
    _textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _textView.layer.borderWidth = 1;
    
    [self.view addSubview:_label];
    [self.view addSubview:_button];
    [self.view addSubview:_textFiled];
    [self.view addSubview:_textView];
    
    [self.navigationController.navigationBar setTranslucent:false];
    
    RAC(_label,text) = [[_textFiled rac_textSignal]flattenMap:^__kindof RACSignal * _Nullable(NSString * _Nullable value) {
        if ([value isEqualToString:@"kobe"]) {
             return [RACSignal return:@"leborn"];
        }
        return [RACSignal empty];
    }];
    
    _button.rac_command = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [self buttonAction];
    }];
    
    [[[RACSignal return:@"123"]
      subscribeOn:[RACScheduler mainThreadScheduler]]
     subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
    [[_button.rac_command.executionSignals.switchToLatest catch:^RACSignal * _Nonnull(NSError * _Nonnull error) {
        NSLog(@"----error%@",error);
        return [RACSignal empty];
    }]subscribeNext:^(id  _Nullable x) {
        NSLog(@"======%@",x);
    }];
  
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.status sendNext:@"3333"];
    });
    
    [self.status subscribeNext:^(id  _Nullable x) {
        NSLog(@"状态%@",x);
    }];

    self.dataSource = [RACBehaviorSubject behaviorSubjectWithDefaultValue:@1];
    NSLog(@"----%@",self.dataSource);
    
    [self.dataSource subscribeNext:^(id  _Nullable x) {
        NSLog(@"----%@",x);
    }];
    
    [[_button rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
        
    }];
    
    [[_textFiled rac_signalForControlEvents:UIControlEventEditingDidBegin]subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"开始编辑");
    }];
    
    NSString *schemeUrl = @"youloft://main?tab=1&scrollInfo=1&index=2";
    NSURL *url = [NSURL URLWithString:schemeUrl];
    NSDictionary *parameters = [self dictionaryWithUrlQuery:url.query];
    NSLog(@"----parameters:%@",parameters);
    [parameters enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [self setValue:obj forKey:key];
    }];
    NSLog(@"scrollInfo=%@",self.scrollInfo);
    NSLog(@"index=%@",self.index);
    
    [self p_setNavigationStyle:[UIColor whiteColor]
                         title:@"title"
                          item:nil];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

- (NSDictionary *)dictionaryWithUrlQuery:(NSString *)query
{
    NSArray *array = [query componentsSeparatedByString:@"&"];
    NSMutableDictionary *param = [NSMutableDictionary dictionaryWithCapacity:0];
    for (NSString *parameters in array) {
        NSArray *detailArray = [parameters componentsSeparatedByString:@"="];
        if (detailArray && detailArray.count == 2) {
            if ([detailArray[0] length] != 0 && [detailArray[1] length] != 0)  {
                 [param setObject:detailArray[1] forKey:detailArray[0]];
            }
        }
    }
    return [param copy];
}

- (void)p_setNavigationStyle:(UIColor *)backgroundColor
                       title:(NSString *)titleStr
                        item:(UINavigationItem *)navigationItem
{
    
}

- (RACSignal *)buttonAction{
    return  [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendError:[NSError errorWithDomain:NSURLErrorDomain code:-1 userInfo:@{@"key":@"111111"}]];
        [subscriber sendNext:@"kobe"];
        [subscriber sendCompleted];
        return  [RACDisposable disposableWithBlock:^{
            NSLog(@"完成 释放咯");
        }];
    }];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    _label.frame = CGRectMake(0, 0, 100, 20);
    _button.frame = CGRectMake(0, 20, 100, 20);
    _textFiled.frame = CGRectMake(0, 40, 100, 20);
    _textView.frame = CGRectMake(0, 60, 100, 100);
}

- (RACSubject *)status
{
    if (!_status) {
        _status = [RACSubject subject];
    }
    return _status;
}
@end
