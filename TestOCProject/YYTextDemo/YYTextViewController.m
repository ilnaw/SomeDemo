//
//  YYTextViewController.m
//  TestOCProject
//
//  Created by wl on 2019/6/21.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YYTextViewController.h"
#import "MGJRouter.h"
#import "YYText.h"

@interface YYTextViewController ()
@property (nonatomic, strong)YYLabel *label;
@end

@implementation YYTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [MGJRouter registerURLPattern:@"youloft.419805549://mainTab/:query" toHandler:^(NSDictionary *routerParameters) {
        NSLog(@"--------%@",routerParameters[@"query"]);
        NSLog(@"--------%@",routerParameters);
    }];
    
    [MGJRouter openURL:@"youloft.419805549://mainTab/detail?index=1&name=wanli"];
    
    NSString *html = @"<a href=\"https://www.baidu.com/?tn=48021271_19_hao_pg\">你好</a><p>123123123123123123123123123123123123123123123123123</p>";
    
    YYLabel *label = YYLabel.new;
    label.numberOfLines = 0;
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.mas_equalTo(200);
    }];
    self.label = label;
    
    UIView *red = [UIView new];
    red.backgroundColor = [UIColor redColor];
    [self.view addSubview:red];
    [red mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(10);
        make.width.equalTo(label);
        make.centerX.equalTo(label);
        make.height.mas_equalTo(100);
    }];
    
    NSData *data = [html dataUsingEncoding:NSUnicodeStringEncoding];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithData:data
                                                               options:@{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType}
                                                    documentAttributes:nil
                                                                 error:nil];
    [attr enumerateAttributesInRange:attr.yy_rangeOfAll options:0 usingBlock:^(NSDictionary<NSAttributedStringKey,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
        if ([attrs.allKeys containsObject:NSLinkAttributeName]) {
            YYTextHighlight *light = [YYTextHighlight new];
            light.tapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
                NSLog(@"---------%@",text.yy_attributes[NSLinkAttributeName]);
            };
            [attr yy_setTextHighlight:light range:range];
        }
    }];
    self.label.attributedText = attr;
    

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        YYTextContainer *textContainer = [YYTextContainer containerWithSize:CGSizeMake(200, CGFLOAT_MAX)];
        YYTextLayout *layout = [YYTextLayout layoutWithContainer:textContainer text:attr];
        [self.view setNeedsLayout];
        
        [UIView animateWithDuration:1.0 animations:^{
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(layout.textBoundingSize.height);
            }];
            [self.view layoutIfNeeded];
        }];
    });
}

@end
