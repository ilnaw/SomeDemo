//
//  AppDelegate.m
//  TestOCProject
//
//  Created by wanli on 2019/3/14.
//  Copyright © 2019 wanli. All rights reserved.
//

#import "AppDelegate.h"
#import "TableViewController.h"
#import "MainViewController.h"
#import "RACViewController.h"
#import "AsyncViewController.h"
#import "APNSManager.h"
#import "YLExampleViewController.h"
#import "YLStaticViewController.h"
#import "XibViewController.h"
#import "YLDateManager.h"
#import "NSString+Percent.h"
#import "YLMasonryViewController.h"
#import "DrawViewController.h"
#import "PageViewController.h"
#import "NSArray+Blocks.h"
#import "NSDictionary+Blocks.h"
#import "CopyModel.h"
#import "UIView+ReuseIdentifier.h"
#import "YLCustomDrawView.h"
#import "YLCustomBottomLineView.h"
#import "YLChain.h"
#import "Tclass.h"
#import "ViewController.h"
#import "SecondMasonryViewController.h"
#import "EatViewcontroller.h"
#import "AlertWindowVC.h"
#import "ScrollOffsetViewController.h"
#import "YLDrawDestinyViewController.h"
#import "YLDrawXibViewController.h"
#import "YLLayerViewController.h"
#import "FakeScrollViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
     CGFloat level = [[UIDevice currentDevice] batteryLevel];
    
    self.window.frame = UIScreen.mainScreen.bounds;
    EatViewController *vc = [EatViewController eatWithFoodList:@{
                                                                 @"address":@"C",
                                                                 @"foods":@[
                                                                         @"猪肉",
                                                                         @"白菜",
                                                                         @"粉条"
                                                                         ]
                                                                 }];
    
    NSLog(@"%@",vc.foods);
    [vc moonEat];
    
    NSDictionary *dic = @{@"key":@"123"};
    NSString *key = nil;
    NSString *value22 = dic[key];
    

    NSLog(@"--------ceilf=%ld",(NSInteger)ceilf(4.0/3));

    
    ViewController *rac = [[ViewController alloc]init];
    
    NSLog(@"=========%@",rac);
    
    NSMutableArray *countArray = [NSMutableArray arrayWithCapacity:3];
    NSLog(@"-------%ld",countArray.count);
    
//    PageViewController *page = [[PageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationVertical options:nil];
//    page.vcs = @[
//                          [[DrawViewController alloc]init],
//                          [[YLMasonryViewController alloc]init],
//                          ];
//    [page setViewControllers:@[page.vcs.firstObject] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
//    
    
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:rac];
    
    [self.window makeKeyAndVisible];
    
    [[APNSManager shared]handleJumpWithDetailID:@1
                                           type:YLNotificationTypeInit(@"IM")
                                       userInfo:@{}];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:YLNotificationRefreshList object:nil];
    NSLog(@"---HHHHHH%@",kNoSure);
    
    [[YLDateManager shared] beginTrack];
    
    NSLog(@"======%@",[@"10000" toPercent]);
    
#pragma mark - blocks
    NSLog(@"=========================================================blocks");
    NSArray *friends = @[@"123",@"2222",@"万里",@"3333",@"詹姆斯",@"万里"];
    NSArray *finalFriends = [friends map:^id(NSString *object) {
        return [object stringByAppendingString:@"old"];
    }];
    NSArray *bigFriends = [friends filter:^BOOL(NSString *object) {
        return object.length > 3;
    }];
    
    NSString *name = [friends detect:^BOOL(id object) {
        return [object isEqualToString:@"万里"];
     }];
    
    NSArray *reduceArray = [friends reduce:^id(id accumulator, id object) {
        return [NSString stringWithFormat:@"%@+%@",accumulator,object];
    }];
    
    NSLog(@"finalFriends=%@",finalFriends);
    NSLog(@"bigFriends=%@",bigFriends);
    NSLog(@"name=%@",name);
    NSLog(@"reduce=%@",reduceArray);
    
    NSDictionary *stars = @{
                            @"name" : @"123",
                            @"age" : @2,
                            @"gender" : @1,
                            @"address" : @"重庆"
                            };
    NSArray *starsArray = [stars map:^id(id key, id value) {
        return [NSString stringWithFormat:@"%@=%@",key,value];
    }];
    
    NSDictionary *pickKeys =  [stars pick:@[@"name",@"age"]];
    
    NSLog(@"starsArray=%@",starsArray);
    NSLog(@"pickDictionary=%@",pickKeys);
    
    CopyModel *model1 = [CopyModel new];
    CopyModel *model2 = [CopyModel new];
    NSMutableArray *mutableArray = @[model1,model2].mutableCopy;
    
    NSArray *modelArray = mutableArray.copy;
    NSLog(@"%@",modelArray);
    model1.name = @"万里";
    NSLog(@"%@",modelArray);

    NSLog(@"-----%@",YLCustomDrawView.reuseid);
    NSLog(@"=====%@",YLCustomBottomLineView.reuseid);
    
    NSLog(@"ooooooooooooooooooooooooO%@",YLChain.man.big.laker.direction.laker.peopleInfo(@"万里"));
    
    Tclass<NSNumber *> *ttt = Tclass.new;
    NSNumber *tttttt= [ttt returnaT:@1];
    NSLog(@"!!!!!!!!!!!!!!!!!!!!!!%@",tttttt);
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
