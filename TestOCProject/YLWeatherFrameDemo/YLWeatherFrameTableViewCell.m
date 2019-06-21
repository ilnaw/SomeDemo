//
//  YLTimeLineTableViewCell.m
//  TestOCProject
//
//  Created by wl on 2019/6/21.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLWeatherFrameTableViewCell.h"

@implementation YLWeatherFrameTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFrame:(CGRect)frame
{
    frame.origin.x = 100;
    frame.size.width = UIScreen.mainScreen.bounds.size.width - 100;
    [super setFrame:frame];
}
@end
