//
//  YLMomentViewModel.h
//  TestOCProject
//
//  Created by wl on 2019/6/27.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YLMomentModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YLMomentViewModel : NSObject
@property (nonatomic, readonly, strong)NSArray<YLMomentModel *>  *dataSource;
@end

NS_ASSUME_NONNULL_END
