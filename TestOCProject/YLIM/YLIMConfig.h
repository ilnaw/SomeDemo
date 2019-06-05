//
//  YLIMConfig.h
//  TestOCProject
//
//  Created by wl on 2019/6/5.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLIMConfig : NSObject
+ (instancetype)sharedConfig;

@property (nonatomic, assign)CGFloat nickNameFont;
@end

NS_ASSUME_NONNULL_END
