//
//  YLMomentViewModel.m
//  TestOCProject
//
//  Created by wl on 2019/6/27.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLMomentViewModel.h"

@interface YLMomentViewModel()
@property (nonatomic, strong)NSArray<YLMomentModel *>  *dataSource;
@end

@implementation YLMomentViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self _initData];
    }
    return self;
}

//@property (nonatomic, strong)NSString *name;
//@property (nonatomic, strong)NSString *avator;
//@property (nonatomic, strong)NSString *content;
//@property (nonatomic, strong)NSString *time;
//@property (nonatomic, strong)NSArray *comments;
//@property (nonatomic, strong)NSArray *photos;
- (void)_initData{
    NSArray *data = @[
                      @{
                          @"type" : @(1),
                          @"name" : @"万里",
                          @"avator" : @"",
                          @"content" : @"这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容",
                          @"time" : @"09:40",
                          @"photos":@[
                                  
                                  ],
                          @"comments":@[
                                  @"这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论",
                                  @"这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论",
                                  ]
                              },
                      @{
                          @"name" : @"万里2",
                          @"avator" : @"",
                          @"content" : @"这是内容这是内容这是内容这是内容这",
                          @"time" : @"09:40",
                          @"photos":@[
                                  [UIImage imageNamed:@"jiankys14_icon"],
                                  ],
                          @"comments":@[
                                  @"这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论",
                                  @"这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论",
                                  ]
                          },
                      @{
                          @"name" : @"万里3",
                          @"avator" : @"",
                          @"content" : @"这是内容这是",
                          @"time" : @"09:40",
                          @"photos":@[
                                  [UIImage imageNamed:@"jiankys14_icon"],
                                  [UIImage imageNamed:@"jiankys14_icon"],
                                  [UIImage imageNamed:@"jiankys14_icon"],
                                  [UIImage imageNamed:@"jiankys14_icon"],
                                  ],
                          @"comments":@[
                                  @"这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论",
                                  @"这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论",
                                  ]
                          },
                      @{
                          @"type" : @(2),
                          @"name" : @"万里4",
                          @"avator" : @"",
                          @"content" : @"这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容",
                          @"time" : @"09:40",
                          @"photos":@[
                                  ],
                          @"comments":@[
                                  ]
                          },
                      @{
                          @"name" : @"万里5",
                          @"avator" : @"",
                          @"content" : @"这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容这是内容11111",
                          @"time" : @"09:41",
                          @"photos":@[
                                  [UIImage imageNamed:@"jiankys14_icon"],
                                  [UIImage imageNamed:@"jiankys14_icon"],
                                  [UIImage imageNamed:@"jiankys14_icon"],
                                  [UIImage imageNamed:@"jiankys14_icon"],
                                  [UIImage imageNamed:@"jiankys14_icon"],
                                  [UIImage imageNamed:@"jiankys14_icon"],
                                  ],
                          @"comments":@[
                                  @"这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论",
                                  @"这是评论这是评论这是评论这是评论这是评论",
                                  ]
                          },
                      @{
                          @"name" : @"万里6",
                          @"avator" : @"",
                          @"content" : @"",
                          @"time" : @"09:41",
                          @"photos":@[
                                  [UIImage imageNamed:@"jiankys14_icon"],
                                  [UIImage imageNamed:@"jiankys14_icon"],
                                  [UIImage imageNamed:@"jiankys14_icon"],
                                  [UIImage imageNamed:@"jiankys14_icon"],
                                  [UIImage imageNamed:@"jiankys14_icon"],
                                  [UIImage imageNamed:@"jiankys14_icon"],
                                  ],
                          @"comments":@[
                                  @"这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论",
                                  @"这是评论这是评论这是评论这是评论这是评论",
                                  ]
                          },
                      @{
                          @"name" : @"万里7",
                          @"avator" : @"",
                          @"content" : @"123123",
                          @"time" : @"09:41",
                          @"photos":@[
                                  ],
                          @"comments":@[
                                  @"这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论这是评论",
                                  @"这是评论这是评论这是评论这是评论这是评论",
                                  ]
                          },
                      ];
    NSMutableArray *temp = @[].mutableCopy;
    for (NSDictionary *dic in data) {
        YLMomentModel *model = [[YLMomentModel alloc]initWithDic:dic];
        [temp addObject:model];
    }
    self.dataSource = temp.copy;
}
@end
