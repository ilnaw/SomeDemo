//
//  YLIMToolBar.h
//  TestOCProject
//
//  Created by wl on 2019/6/6.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YLIMToolBar;

NS_ASSUME_NONNULL_BEGIN

@protocol YLIMToolBarDelegate <NSObject>

- (void)willShowEmoji:(YLIMToolBar *)view;
- (void)willHiddenEmoji:(YLIMToolBar *)view;
- (void)textViewFrameDidChange;

@end

@interface YLIMToolBar : UIView
@property (nonatomic,strong)UITextView *textView;
@property (nonatomic,strong)UIButton *addButton;
@property (nonatomic,weak)id<YLIMToolBarDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
