//
//  YLMomentCommentCell.m
//  TestOCProject
//
//  Created by wl on 2019/6/26.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLMomentCommentCell.h"


@interface YLMomentCommentCell()
@property (nonatomic,strong)UILabel *commentContent;
@property (nonatomic,strong)UIView *separator;
@end

@implementation YLMomentCommentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.commentContent = ({
            UILabel *label = UILabel.new;
            label.font = [UIFont systemFontOfSize:14.f];
            label.textColor = [UIColor darkGrayColor];
            label.numberOfLines = 0;
            
            label;
        });
        [self addSubview:self.commentContent];
        

        
        self.separator = UIView.new;
        self.separator.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.separator];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.commentContent.frame = CGRectMake(10,4, self.bounds.size.width - 20, self.bounds.size.height - 8);
    
    self.separator.yl_height = 1;
    self.separator.yl_width = self.bounds.size.width;
    self.separator.bottom = CGRectGetMaxY(self.bounds);
    self.separator.right = CGRectGetMaxX(self.bounds);
    
}

- (void)setComment:(NSString *)comment
{
    _comment = comment;
    self.commentContent.text = comment;
}

- (void)setFrame:(CGRect)frame
{
    frame.origin.x = 100;
    frame.size.width = frame.size.width - 100;
    [super setFrame:frame];
}

@end
