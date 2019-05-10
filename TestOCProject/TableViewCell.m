//
//  TableViewCell.m
//  TestOCProject
//
//  Created by wanli on 2019/3/18.
//  Copyright © 2019 wanli. All rights reserved.
//

#import "TableViewCell.h"
#import "Masonry.h"

@interface TableViewCell()
@property(strong, nonatomic)UILabel *contentLabel;
@property(strong, nonatomic)UILabel *timeLabel;
@property(strong, nonatomic)UIView *container;
@property(strong, nonatomic)UIButton *watchButton;
@property(strong, nonatomic)UIView *separator;

@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        self.backgroundColor = UIColor.groupTableViewBackgroundColor;
        [self.contentView addSubview:self.container];
        [self.container addSubview:self.contentLabel];
        [self.container addSubview:self.timeLabel];
        [self.container addSubview:self.watchButton];
        [self.container addSubview:self.separator];
        
        [self setConstraints];

    }
    return self;
}

//+ (BOOL)requiresConstraintBasedLayout
//{
//    return  true;
//}
//
//- (void)updateConstraints
//{
//    CGFloat padding = 10;
//    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(UIEdgeInsetsMake(padding, padding, padding, padding));
//    }];
//    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.equalTo(self.container).offset(padding);
//        make.right.equalTo(self.container).offset(-padding);
//    }];
//    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.contentLabel.mas_bottom).offset(padding);
//        make.left.right.equalTo(self.contentLabel);
//    }];
//    [self.separator mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.mas_equalTo(1);
//        make.top.equalTo(self.timeLabel.mas_bottom).offset(padding);
//        make.left.right.equalTo(self.timeLabel);
//    }];
//    [self.watchButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.separator.mas_bottom).offset(padding);
//        make.size.mas_equalTo(CGSizeMake(100, 30));
//        make.centerX.equalTo(self.container);
//        make.bottom.equalTo(self.container).offset(-padding).priorityHigh();
//    }];
//
//    [super updateConstraints];
//}

- (void)setConstraints
{
    CGFloat padding = 10;
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(padding, padding, padding, padding));
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.container).offset(padding);
        make.trailing.equalTo(self.container).offset(-padding);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLabel.mas_bottom).offset(padding);
        make.leading.trailing.equalTo(self.contentLabel);
    }];
    [self.separator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.top.equalTo(self.timeLabel.mas_bottom).offset(padding);
        make.leading.trailing.equalTo(self.timeLabel);
    }];
    [self.watchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.separator.mas_bottom).offset(padding);
        make.size.mas_equalTo(CGSizeMake(100, 30));
        make.centerX.equalTo(self.container);
        make.bottom.equalTo(self.container).offset(-padding).priorityHigh();
    }];

}

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//    CGFloat padding = 10;
//    self.container.frame = CGRectMake(padding, padding, self.frame.size.width - padding*2, self.frame.size.height - padding*2);
//    self.contentLabel.frame = CGRectMake(padding, padding, self.container.frame.size.width - padding*2, 0);
//    self.timeLabel.frame = CGRectMake(padding, CGRectGetMaxY(self.contentLabel.frame) + padding, CGRectGetWidth(self.contentLabel.frame), 20);
//}
////
//- (CGSize)sizeThatFits:(CGSize)size
//{
//    CGFloat padding = 10;
//    CGFloat cellHeight = 0;
//    cellHeight = [self.contentLabel sizeThatFits:CGSizeMake(size.width - padding*2, CGFLOAT_MAX)].height + padding*4 + 20;
//
//    return CGSizeMake(size.width,  cellHeight);
//}

- (void)setModel:(NSDictionary *)model
{
    _model = model;
    self.contentLabel.text = @"您有新的带看单您有新的带看单您有新的带看单您有新的带看单您有新的带看单您有新的带看单您有新的带看单您有新的带看单您有新的带看单您有新的带看单您有新的带看单";
    self.timeLabel.text = @"2019-08-09 11:03";
}

- (UIButton *)watchButton
{
    if (!_watchButton) {
        _watchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_watchButton setTitle:@"查看" forState:UIControlStateNormal];
        [_watchButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        _watchButton.layer.cornerRadius = 15;
        _watchButton.layer.borderColor = UIColor.lightGrayColor.CGColor;
        _watchButton.layer.borderWidth = 1;
    }
    return _watchButton;
}
- (UIView *)separator
{
    if (!_separator) {
        _separator = [[UIView alloc]init];
        _separator.backgroundColor = UIColor.groupTableViewBackgroundColor;
    }
    return _separator;
}
- (UIView *)container
{
    if (!_container) {
        _container = [[UIView alloc]init];
        _container.backgroundColor = [UIColor whiteColor];
        _container.layer.cornerRadius = 10;
    }
    return _container;
}
- (UILabel *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.font = [UIFont systemFontOfSize:14.f];
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}
- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:12.f];
        _timeLabel.textColor = UIColor.lightGrayColor;
        _timeLabel.numberOfLines = 0;
    }
    return _timeLabel;
}

@end
