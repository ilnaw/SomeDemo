//
//  ASViewController.h
//  TestOCProject
//
//  Created by wanli on 2019/4/4.
//  Copyright © 2019 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

enum EOCState {
    EOCStateStart,
    EOCStateEnd,
};

typedef NS_OPTIONS(NSUInteger, WLState) {
    WLStateNone = 0,
    WLStateTop = 1 << 0,
    WLStateRight = 1 << 1,
    WLStateBottom = 1 << 2,
    WLStateLeft = 1 << 3,
};

typedef enum EOCState EState;

@interface MessageCell : ASCellNode

@end

@interface AsyncViewController : UIViewController

@property (assign, nonatomic)EState state;

@property (assign, nonatomic)WLState wlState;
@end

NS_ASSUME_NONNULL_END
