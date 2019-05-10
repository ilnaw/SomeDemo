//
//  ViewReusableProtocol.h
//  TestOCProject
//
//  Created by wanli on 2019/3/18.
//  Copyright © 2019 wanli. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ViewReusableProtocol <NSObject>
@property(copy, nonatomic, readonly, class) NSString *reuseid;
@end

NS_ASSUME_NONNULL_END
