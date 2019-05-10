//
//  EatViewController.m
//  TestOCProject
//
//  Created by wl on 2019/4/28.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "EatViewController.h"
#import "ChinaEatViewController.h"
#import "EuropeEatViewController.h"
#import "AmericanEatViewController.h"

@interface EatViewController ()

@end

@implementation EatViewController

+ (instancetype)eatWithFoodList:(NSDictionary *)foodList
{
    NSString *location = foodList[@"address"];
    NSArray *foods = foodList[@"foods"];
    if ([location isEqualToString:@"C"]) {
        ChinaEatViewController *vc = [[ChinaEatViewController alloc]init];
        vc.foods = foods.copy;
        return vc;
    }else if ([location isEqualToString:@"E"]){
        EuropeEatViewController *vc = [[EuropeEatViewController alloc]init];
        vc.foods = foods.copy;
        return vc;
    }
    else if ([location isEqualToString:@"A"]){
        AmericanEatViewController *vc = [[AmericanEatViewController alloc]init];
        vc.foods = foods.copy;
        return vc;
    }
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)moriningEat
{
    
}

- (void)moonEat
{
    
}

- (void)dinnerEat
{
    
}

@end
