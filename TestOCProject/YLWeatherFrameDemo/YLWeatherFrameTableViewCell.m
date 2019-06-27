//
//  YLTimeLineTableViewCell.m
//  TestOCProject
//
//  Created by wl on 2019/6/21.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLWeatherFrameTableViewCell.h"
#import "YLGradientLabel.h"

@interface YLWeatherFrameTableViewCell()
@property (nonatomic, strong)YLGradientLabel  *label;
@end

@implementation YLWeatherFrameTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        YLGradientLabel *label = YLGradientLabel.new;
        self.label = label;
        [self addSubview:self.label];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-10);
            make.centerX.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(100, 40));
        }];
//        self.label.contentMode = UIViewContentModeRedraw;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
//    [self.label setNeedsDisplay];
}

- (void)data{
    //
    [self.label layoutIfNeeded];
    [self.label setNeedsDisplay];
}

- (void)setFrame:(CGRect)frame
{
    frame.origin.x = 100;
    frame.size.width = UIScreen.mainScreen.bounds.size.width - 100;
    [super setFrame:frame];
}
@end
