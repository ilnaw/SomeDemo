//
//  ScrollViewProtocol.h
//  TestOCProject
//
//  Created by wl on 2019/5/27.
//  Copyright © 2019年 wanli. All rights reserved.
//

#ifndef ScrollViewProtocol_h
#define ScrollViewProtocol_h
#import <UIKit/UIKit.h>

@protocol PageScrollViewDelegate <NSObject>

@property (nonatomic, weak)id<UIScrollViewDelegate>  scrollDelegate;
@property (nonatomic, readonly)UIScrollView *sc;

@end

#endif /* ScrollViewProtocol_h */
