//
//  YLBaseView.h
//  TestOCProject
//
//  Created by wl on 2019/5/29.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLBaseView : UIView
+ (instancetype)creatWithInt:(NSInteger)index;

@property (nonatomic, strong)NSString *posid;

@property (nonatomic, strong)UIView *containerView;


- (void)updateUI;
@end

NS_ASSUME_NONNULL_END
