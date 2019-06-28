//
//  AttributeStrView.m
//  TestOCProject
//
//  Created by wl on 2019/5/7.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "AttributeStrView.h"

@interface AttributeStrView()

@end

@implementation AttributeStrView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
        [self configData];
    }
    return self;
}

- (void)configUI{
    self.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [UILabel new];
    label.numberOfLines = 0;
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    _contentLabel = label;
}

- (void)configData{
    NSArray *array = @[
                       @{
                           @"key":@"出行",
                           @"value":@"大师的空间哦哦气温达按揭客户SD卡去武汉科技还看见爱上大表情看见爱上的"
                         }
                       ,
                       @{
                           @"key":@"搬家",
                           @"value":@"大家了深刻的宁波我我去额阿萨德大神带拉手大石街道哈会计师按实际考得好会计核算的开奖号啊可接受的看就安徽省空间打开手机端快捷暗红色的接口很加锁"
                           },
                       @{
                           @"key":@"造车器",
                           @"value":@"大叔大婶大所"
                           },
                       @{
                           @"key":@"作灶",
                           @"value":@"啊实打实的委屈我看见卡萨丁"
                           },
                       @{
                           @"key":@"成人礼",
                           @"value":@"大师大会上的金卡和数据库等哈就开始对健康奥术大师大所大所大所"
                           }
                       ];
    
    _contentLabel.attributedText = [self getAttributeStrWithContent:array];
}

- (NSAttributedString *)getAttributeStrWithContent:(NSArray *)array{
    NSMutableAttributedString *result = [[NSMutableAttributedString alloc]init];
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [result appendAttributedString:[self getAttriButeStrWithKey:obj[@"key"] value:obj[@"value"]]];
        
        [result appendAttributedString:[[NSAttributedString alloc]initWithString:@"\n\n" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}]];
    }];
    
    return result;
}
- (NSAttributedString *)getAttriButeStrWithKey:(NSString *)key value:(NSString *)value
{
    NSMutableAttributedString *result = [[NSMutableAttributedString alloc]init];
    
    NSMutableParagraphStyle *lineParagraph = [[NSMutableParagraphStyle alloc]init];
    lineParagraph.lineSpacing = 4;
    
    NSAttributedString *keyAttr = [[NSAttributedString alloc]initWithString:key attributes:@{
                                                                                             NSFontAttributeName : [UIFont systemFontOfSize:16],
                                                                                             NSForegroundColorAttributeName : [UIColor blueColor],
                                                                                             NSParagraphStyleAttributeName : lineParagraph
                                                                                             }];

    NSAttributedString *valueAttr = [[NSAttributedString alloc]initWithString:value attributes:@{
                                                                                                 NSFontAttributeName : [UIFont systemFontOfSize:20],
                                                                                                 NSForegroundColorAttributeName : [UIColor blackColor],
                                                                                                 NSParagraphStyleAttributeName : lineParagraph
                                                                                                 }];
    [result appendAttributedString:keyAttr];
    [result appendAttributedString:[[NSAttributedString alloc]initWithString:@"\n\n" attributes:@{
                                                                                                NSFontAttributeName : [UIFont systemFontOfSize:16]
                                                                                                }]];
    NSTextAttachment *attachment = [[NSTextAttachment alloc]initWithData:nil ofType:nil];
    attachment.image = [UIImage imageNamed:@"remind_add_img"];
    attachment.bounds = CGRectMake(0, 0, 100, 30);
//    [result appendAttributedString:[NSAttributedString attributedStringWithAttachment:attachment]];
    [result appendAttributedString:valueAttr];
    [result insertAttributedString:[NSAttributedString attributedStringWithAttachment:attachment] atIndex:keyAttr.length + 3];
    
    [result addAttribute:NSBackgroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(0, keyAttr.length)];
    [result addAttribute:NSKernAttributeName value:@(5) range:NSMakeRange(keyAttr.length + 1, valueAttr.length)];
    [result addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlineStyleSingle) range:NSMakeRange(keyAttr.length + 1, valueAttr.length)];
    [result addAttribute:NSStrikethroughColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(keyAttr.length + 1, valueAttr.length)];
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowOffset = CGSizeMake(5, 5);
//    shadow.shadowColor = [UIColor lightGrayColor];
    shadow.shadowBlurRadius = 5;
    [result addAttribute:NSShadowAttributeName value:shadow range:NSMakeRange(key.length + 1, value.length)];
//    [result addAttribute:NSAttachmentAttributeName value:attachment range:NSMakeRange(key.length, 1)];
//    NSAttributedString *imageStr = [NSAttributedString attributedStringWithAttachment:attachment];
//    [result insertAttributedString:imageStr atIndex:key.length];
    
    return result;
}
@end
