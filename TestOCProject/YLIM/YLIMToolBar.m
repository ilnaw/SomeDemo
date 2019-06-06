//
//  YLIMToolBar.m
//  TestOCProject
//
//  Created by wl on 2019/6/6.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLIMToolBar.h"

@interface YLIMToolBar()<UITextViewDelegate>

@end

@implementation YLIMToolBar

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        [self _configUI];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.textView.frame = CGRectMake(50, 5, self.yl_width - 100, self.yl_height - 10);
    
    self.addButton.yl_size = CGSizeMake(40, 40);
    self.addButton.bottom = self.yl_height - 5;
    self.addButton.right = self.right - 5;
    
}

- (void)_configUI{
    UITextView *textView = [[UITextView alloc]init];
    textView.backgroundColor = [UIColor whiteColor];
    textView.font = [UIFont systemFontOfSize:15.f];
    textView.returnKeyType = UIReturnKeyDone;
    textView.delegate = self;
    textView.placeholder = @"请输入聊天内容";
    [self addSubview:textView];
    self.textView = textView;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor blackColor];
    [button addTarget:self action:@selector(addAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    self.addButton = button;

}
- (void)addAction:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        [self.delegate willShowEmoji:self];
    }else{
        [self.delegate willHiddenEmoji:self];
    }
}

#pragma mark - delegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    self.addButton.selected = NO;
    [self.delegate willHiddenEmoji:self];
    return YES;
}
@end
