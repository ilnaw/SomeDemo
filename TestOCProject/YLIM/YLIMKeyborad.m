//
//  YLIMKeyborad.m
//  TestOCProject
//
//  Created by wl on 2019/6/6.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLIMKeyborad.h"

static CGFloat const kEmojiHeight = 120;

@interface YLIMKeyborad()<YLIMToolBarDelegate>
@property (nonatomic, strong)UIView  *fakeEmojiView;
@property (nonatomic, assign)CGFloat keyboradHeight;
@end

@implementation YLIMKeyborad

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self _configUI];
        [self _addKeyBoradObserve];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.toolBar.top = 0;
    self.toolBar.left = 0;
    self.toolBar.yl_size = CGSizeMake(self.yl_width, self.toolBar.yl_height);
    
    self.fakeEmojiView.top = self.toolBar.bottom;
    self.fakeEmojiView.left = 0;
    self.fakeEmojiView.yl_size = CGSizeMake(self.yl_width, kEmojiHeight);
}

- (void)_configUI{
    self.toolBar = ({
        YLIMToolBar *bar = [YLIMToolBar new];
        bar.yl_height = 50;
        bar.delegate = self;
        bar;
    });
    [self addSubview:self.toolBar];
    
    UIView *emojiView = [UIView new];
    emojiView.backgroundColor = [UIColor yellowColor];
    [self addSubview:emojiView];
    self.fakeEmojiView = emojiView;
}

- (void)resignFirstResponder{
    [self.toolBar.textView resignFirstResponder];
    [self willHiddenEmoji:self.toolBar];
}

- (BOOL)isFirstResponder
{
    return self.toolBar.textView.isFirstResponder || !self.fakeEmojiView.isHidden;
}

- (void)_addKeyBoradObserve{
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(_keyboardWillShow:)
                                                name:UIKeyboardWillShowNotification
                                              object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(_keyboardWillHidden:)
                                                name:UIKeyboardWillHideNotification
                                              object:nil];
}

- (void)_keyboardWillShow:(NSNotification *)notification{
    CGRect keyboardRect = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.keyboradHeight = keyboardRect.size.height;
    [self _resetFrameKeyboradHeight:keyboardRect.size.height];
}

- (void)_keyboardWillHidden:(NSNotification *)notification{
    [self _resetFrameKeyboradHeight:0.f];
}


- (void)_resetFrameEmojiShow:(BOOL)emojiShowing{
    CGFloat superViewHeight = self.superview.bounds.size.height;
    CGFloat screenWidth = UIScreen.mainScreen.bounds.size.width;
    CGFloat toolBarHeight = self.toolBar.yl_height;
    
    [UIView animateWithDuration:0.2 animations:^{
        if (emojiShowing) {
            self.frame = CGRectMake(0, superViewHeight - toolBarHeight - self.fakeEmojiView.yl_height, screenWidth, toolBarHeight + self.fakeEmojiView.yl_height);
        }else{
            self.frame = CGRectMake(0, superViewHeight - toolBarHeight, screenWidth, toolBarHeight);
        }
    }];
}

- (void)_resetFrameKeyboradHeight:(CGFloat)keyboardHeight{
    CGFloat superViewHeight = self.superview.bounds.size.height;
    CGFloat screenWidth = UIScreen.mainScreen.bounds.size.width;
    CGFloat toolBarHeight = self.toolBar.yl_height;
    self.frame = CGRectMake(0, superViewHeight - keyboardHeight - toolBarHeight, screenWidth, toolBarHeight);
}

#pragma mark - delegate
- (void)willShowEmoji:(YLIMToolBar *)view
{
    self.fakeEmojiView.hidden = NO;
    [self.toolBar.textView resignFirstResponder];
    [self _resetFrameEmojiShow:YES];
}

- (void)willHiddenEmoji:(YLIMToolBar *)view
{
    self.fakeEmojiView.hidden = YES;
    [self _resetFrameEmojiShow:NO];
}

- (void)textViewFrameDidChange
{
    [self _resetFrameKeyboradHeight:self.keyboradHeight];
}

@end
