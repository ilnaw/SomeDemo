//
//  YLMomentFooterView.m
//  TestOCProject
//
//  Created by wl on 2019/6/27.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLMomentFooterView.h"

@interface YLMomentFooterView()
@property (nonatomic, strong)UIView *separator;
@end

@implementation YLMomentFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.separator = ({
            UIView *view = UIView.new;
            view.backgroundColor = UIColor.groupTableViewBackgroundColor;
            
            view;
        });
        [self addSubview:self.separator];
        [self.separator mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.left.right.equalTo(self);
            make.height.mas_equalTo(1);
        }];
    }
    return self;
}

@end
