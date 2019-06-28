//
//  YLChain.m
//  TestOCProject
//
//  Created by wl on 2019/4/23.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLChain.h"

@interface YLChain()
@property (nonatomic, copy)NSString *name;
@property (nonatomic, assign)NSInteger age;
@property (nonatomic, assign)BOOL gender; //1man  2women
@property (nonatomic, copy)NSString *address;
@property (nonatomic, copy)NSString *love;
@end

@implementation YLChain
+ (YLChain *)man
{
    YLChain *man = YLChain.new;
    man.gender = 1;

    return man;
}

+ (YLChain *)women
{
    YLChain *women = YLChain.new;
    women.gender = 0;

    return women;
}

- (YLChain *)direction
{
    self.address = @"南方";
    return self;
}

- (YLChain *)laker
{
    self.love = @"湖人";
    return self;
}

- (YLChain *)big
{
    self.age = 60;
    return self;
}

- (NSString * _Nonnull (^)(NSString * _Nonnull))peopleInfo
{
    __weak typeof (self) self_weak = self;
    return ^(NSString *name){
        return [NSString stringWithFormat:@"name:%@ gender:%@ age=%ld岁 区域:%@ 喜好:%@",name,self_weak.gender ? @"男":@"女",self_weak.age,self_weak.address,self_weak.love];
    };
}
@end
