//
//  YLIMMessageBaseCell.m
//  TestOCProject
//
//  Created by wl on 2019/6/4.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLIMMessageCell.h"
#import "YLIMMessageBubbleView.h"

@interface YLIMMessageCell()<YLIMMessageBubbleViewDelegate>

@end

@implementation YLIMMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self configBaseUI];
    }
    return self;
}

- (void)configBaseUI{
    UILabel *nameLabel = [UILabel new];
    nameLabel.font = [UIFont systemFontOfSize:15];
    nameLabel.textColor = [UIColor orangeColor];
    [self addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    UIImageView *avator = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    avator.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:avator];
    self.avator = avator;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //各个view的frame设置
    [self layoutNameLabel];
    [self layoutAvator];
    [self layoutBubble];
}

- (void)setModel:(YLIMMessageModel *)model
{
    _model = model;
    [self configData];
}

- (void)configData{
    [self _addBubbleViewIfNotExist];
    
    self.nameLabel.text = @"万里";
    self.nameLabel.hidden = !self.model.layout.showNickName;
    self.nameLabel.textAlignment = self.model.layout.showLeft ? NSTextAlignmentLeft : NSTextAlignmentRight;
    
    self.avator.image = [UIImage imageNamed:@"jiankys14_icon"];
    
    [self.bubbleView refreshData:self.model];
    [self.bubbleView setNeedsLayout];
}

- (void)_addBubbleViewIfNotExist{
    if (_bubbleView == nil) {
        self.bubbleView = [YLIMMessageBubbleView bubbleViewWithMessage:self.model];
        [self.bubbleView refreshData:self.model];
        self.bubbleView.delegate = self;
        [self addSubview:self.bubbleView];
    }
}

- (void)layoutNameLabel{
    YLIMMessageLayoutConfig *layout = self.model.layout;
    if (layout.showNickName) {
        CGFloat originX = layout.avatarMargin.x + layout.avatarSize.width + layout.nickNameMargin.x;
        CGFloat originY = layout.nickNameMargin.y;
        CGSize size = CGSizeMake(200, 20);
        CGFloat rightOriginX = self.yl_width - originX - size.width;
        self.nameLabel.frame = layout.showLeft ? CGRectMake(originX, originY, size.width, size.height) : CGRectMake(rightOriginX, originY, size.width, size.height);
    }
}

- (void)layoutAvator{
    YLIMMessageLayoutConfig *layout = self.model.layout;
    CGFloat originX = layout.avatarMargin.x;
    CGFloat originY = layout.avatarMargin.y;
    CGSize size = layout.avatarSize;
    CGFloat rightOriginX = self.yl_width - originX - size.width;
    self.avator.frame = layout.showLeft ? CGRectMake(originX, originY, size.width, size.height) : CGRectMake(rightOriginX, originY, size.width, size.height);
}

- (void)layoutBubble{
    YLIMMessageLayoutConfig *layout = self.model.layout;
    //内边距
    UIEdgeInsets insets = layout.bubbleViewInsets;
    //内容大小
    CGSize bubbleSize = layout.contentSize;
    bubbleSize.width = insets.left + insets.right + bubbleSize.width;
    bubbleSize.height = insets.top + insets.bottom + bubbleSize.height;
    //整个汽泡大小 = 内容大小+内边距
    self.bubbleView.yl_size = bubbleSize;
    
    //气泡外边距
    UIEdgeInsets outInset = layout.bubbleViewOutInsets;
    if (!layout.showLeft) {
        CGFloat right = self.yl_width - outInset.left - self.bubbleView.yl_width;
        outInset.left = right;
    }
    
    self.bubbleView.top = outInset.top;
    self.bubbleView.left = outInset.left;
}

#pragma mark - bubbleDelegate
- (void)catchEvent:(YLIMEvent *)event
{
    if([self.delegate respondsToSelector:@selector(catchEvent:)]){
        [self.delegate catchEventCell:self event:event];
    }
}
@end
