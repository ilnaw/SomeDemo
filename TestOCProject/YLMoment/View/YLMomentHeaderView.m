//
//  YLMomentHeaderView.m
//  TestOCProject
//
//  Created by wl on 2019/6/27.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLMomentHeaderView.h"

@interface YLMomentHeaderView()<YLMomentContainerDelegate>

@end

@implementation YLMomentHeaderView

+ (instancetype)initWithTableView:(UITableView *)tableView type:(YLMomentContentType)type{
    NSString *headerReuseId = @"headerReuseId";
    switch (type) {
        case YLMomentContentTypePhotos:
            headerReuseId = [headerReuseId stringByAppendingString:@"_photos"];
            break;
        case YLMomentContentTypeShares:
            headerReuseId = [headerReuseId stringByAppendingString:@"_shares"];
            break;
        case YLMomentContentTypeVideos:
            headerReuseId = [headerReuseId stringByAppendingString:@"_videos"];
            break;
        default:
            break;
    }
    
    YLMomentHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerReuseId];
    if (!header) {
        header = [[self.class alloc]initWithReuseIdentifier:headerReuseId];
    }
    return header;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        [self _initUI];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    YLMomentLayout *layout = self.model.layout;
    
    self.avator.left = layout.padding;
    self.avator.top = layout.padding;
    self.avator.yl_size = layout.avatarSize;
    
    self.nameLabel.left = self.avator.right + layout.padding;
    self.nameLabel.top = self.avator.top;
    self.nameLabel.yl_size = layout.nameSize;
    
    CGFloat contentY = self.nameLabel.bottom + layout.padding;
    self.contentLabel.left = self.nameLabel.left;
    self.contentLabel.top = contentY;
    self.contentLabel.yl_size = layout.textSize;
    
    CGFloat contentTop = layout.textSize.height == 0 ? 0 : layout.padding;
    self.content.left = self.nameLabel.left;
    self.content.top = contentY + layout.textSize.height + contentTop;
    self.content.yl_size = layout.contentSize;
    
    CGFloat timeTop = layout.contentSize.height == 0 ? 0 : layout.padding;
    self.timeLabel.left = self.nameLabel.left;
    self.timeLabel.top = self.content.bottom + timeTop;
    self.timeLabel.yl_size = layout.timeSize;
    
    self.moreButton.yl_size = layout.moreButtonSize;
    self.moreButton.bottom = self.timeLabel.bottom;
    self.moreButton.right = CGRectGetMaxX(self.bounds) - 15;
}

- (void)_initUI{
    
    //头像
    self.avator = ({
        UIImageView *imageView = [UIImageView new];
        imageView.layer.cornerRadius = 4;
        imageView.layer.masksToBounds = YES;
        
        imageView;
    });
    [self addSubview:self.avator];
    
    //name
    self.nameLabel = ({
        UILabel *label = UILabel.new;
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor darkGrayColor];
        
        label;
    });
    [self addSubview:self.nameLabel];
    
    //content
    self.contentLabel = ({
        UILabel *label = UILabel.new;
        label.font = [UIFont systemFontOfSize:15 weight:UIFontWeightMedium];
        label.textColor = [UIColor darkGrayColor];
        label.numberOfLines = 0;
        
        label;
    });
    [self addSubview:self.contentLabel];
    
    //time
    self.timeLabel = ({
        UILabel *label = UILabel.new;
        label.font = [UIFont systemFontOfSize:13];
        label.textColor = [UIColor lightGrayColor];
        
        label;
    });
    [self addSubview:self.timeLabel];
    
    //更多按钮
    self.moreButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.moreButton.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.moreButton addTarget:self action:@selector(_moreClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.moreButton];
    
    //弹出按钮
    self.moreView = [[YLMomentMoreView alloc]init];
    [self addSubview:self.moreView];
}

- (void)setModel:(YLMomentModel *)model
{
    _model = model;
    //setupData
    self.nameLabel.text = model.name;
    self.contentLabel.text = model.content;
    self.timeLabel.text = model.time;
    self.avator.backgroundColor = [UIColor redColor];
  
    if (!_content) {
        self.content = [YLMomentContainerView contentWithModel:model];
        self.content.delegate = self;
        [self addSubview:self.content];
    }
    [self.content refreshData:self.model];
    
    [self layoutIfNeeded];
}

- (void)_moreClicked:(UIButton *)sender{
    //固定位置
    self.moreView.centerY = self.moreButton.centerY;
    self.moreView.right = self.moreButton.left - 15;
    
    self.moreView.isShowing ? [self.moreView hiddenAnimation:YES]:[self.moreView showAnimation:YES];
    [self layoutIfNeeded];
}


- (void)catchEvent:(YLMomentEvent *)event
{
    [self.deleagte catchEventCell:self event:event];
}
@end
