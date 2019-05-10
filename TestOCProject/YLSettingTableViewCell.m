//
//  YLSettingTableViewCell.m
//  TestOCProject
//
//  Created by zfh on 2019/4/9.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLSettingTableViewCell.h"

@interface YLSettingTableViewCell()
@property (nonatomic, strong)UILabel *detailLabel;
@property (nonatomic, strong)UIImageView *rightImageView;
@end

@implementation YLSettingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.detailLabel];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.right.equalTo(self.contentView);
        }];
    }
    return self;
}

- (void)setData:(NSDictionary *)data
{
    _data = data;
    self.textLabel.text = data[@"title"];
    self.detailLabel.text = data[@"subTitle"];
    self.accessoryType = [data[@"image"] length] ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
    if ([data[@"image"] length]) {
        return;
    }
    [self.detailLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-15);
    }];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//- (void)setSelected:(BOOL)selected
//{
//    if (selected) {
//        self.contentView.backgroundColor = [UIColor blackColor];
//    }else
//    {
//        self.contentView.backgroundColor = [UIColor orangeColor];
//    }
//}
- (UILabel *)detailLabel
{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.textColor = [UIColor lightGrayColor];
    }
    return _detailLabel;
}

@end
