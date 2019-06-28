//
//  YLPopoverView.m
//  TestOCProject
//
//  Created by wl on 2019/5/15.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "YLPopoverView.h"

@interface YLPopoverAction()

@property (nonatomic ,strong)UIImage *icon;
@property (nonatomic ,copy)NSString *title;
@property (nonatomic ,copy)void (^handler)(YLPopoverAction *action);
@end

@implementation YLPopoverAction

+ (instancetype)actionWithTitle:(NSString *)title actionHandler:(void (^)(YLPopoverAction * _Nonnull))handler
{
    return [self actionWithTitle:title icon:nil actionHandler:handler];
}

+ (instancetype)actionWithTitle:(NSString *)title icon:(nullable UIImage *)icon actionHandler:(void (^)(YLPopoverAction * _Nonnull))handler
{
    YLPopoverAction *action = [YLPopoverAction new];
    action.title = title;
    action.icon = icon;
    action.handler = handler;
    
    return action;
}
@end

@interface YLPopoverViewCell : UITableViewCell
@property (nonatomic, strong)UIButton *button;
@end

@implementation YLPopoverViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubview:self.button];
        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(5, 15, 5, 15));
        }];
    }
    return self;
}

- (void)configData:(YLPopoverAction *)action{
    [_button setImage:action.icon forState:UIControlStateNormal];
    [_button setTitle:action.title forState:UIControlStateNormal];
    _button.titleEdgeInsets = action.icon ? UIEdgeInsetsMake(0, 8, 0, -8) : UIEdgeInsetsZero;
}

@end


static CGFloat const kPopoverViewMargin = 8.f;
static CGFloat const kPopoverViewCellHeight = 40.f;
static CGFloat const kPopoverViewArrowHeight = 13.f;

@interface YLPopoverView()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)NSMutableArray *actions;
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UIControl *maskView;

@property (nonatomic, assign)BOOL  arrowUp;
@property (nonatomic, assign)YLPopoverViewStyle style;
@property (nonatomic, strong)UIWindow  *keyWindow;
@property (nonatomic, assign)CGFloat windowWidth;
@property (nonatomic, assign)CGFloat windowHeight;
@end

@implementation YLPopoverView

+ (instancetype)popoverWithPreferredStyle:(YLPopoverViewStyle)popoverStyle
{
    YLPopoverView *view = [YLPopoverView new];
    view.style = popoverStyle;
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _tableView.frame = self.bounds;
}

- (void)configUI{
    self.backgroundColor = [UIColor whiteColor];
    _keyWindow = [UIApplication sharedApplication].keyWindow;
    _windowWidth = CGRectGetWidth(_keyWindow.bounds);
    _windowHeight = CGRectGetHeight(_keyWindow.bounds);
    
    _maskView = [UIControl new];
    _maskView.backgroundColor = [UIColor clearColor];
    _maskView.bounds = _keyWindow.bounds;
    [_maskView addTarget:self action:@selector(_dismissPopover:) forControlEvents:UIControlEventTouchUpInside];
    
    [_keyWindow addSubview:_maskView];
    
    
    _tableView = ({
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.showsVerticalScrollIndicator = false;
        tableView.scrollEnabled = false;
        tableView.backgroundColor = [UIColor clearColor];
        tableView.layer.cornerRadius = 8;
        [tableView registerClass:YLPopoverViewCell.class forCellReuseIdentifier:YLPopoverViewCell.reuseid];
        
        tableView;
    });
    [self addSubview:_tableView];
}

- (void)addAction:(YLPopoverAction *)action
{
    [self.actions addObject:action];
}

- (void)showToView:(UIView *)view
{
    CGRect viewRect = [view.superview convertRect:view.frame toView:_keyWindow];
    CGFloat top = CGRectGetMinY(viewRect);
    CGFloat bottom = _windowHeight - CGRectGetMaxX(viewRect);
    
    _arrowUp = top <= bottom;
    
    CGFloat pointY = 0;
    if (top > bottom) {
        pointY = top - 5;
    }else{
        pointY = bottom + 5;
    }
    
    [self showToPoint:CGPointMake(CGRectGetMidX(viewRect), pointY)];
}

- (void)showToPoint:(CGPoint)point
{
    
}

- (void)_dismissPopover:(void (^)(void))completion{
    [UIView animateWithDuration:0.25f animations:^{
        self.alpha = 0.f;
        self.maskView.alpha = 0.f;
        self.transform = CGAffineTransformMakeScale(0.01f, 0.01f);
    } completion:^(BOOL finished) {
        [self.maskView removeFromSuperview];
        [self removeFromSuperview];
        if (completion) {
            completion();
        }
    }];
}

#pragma mark - tableViewDelegate and dataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YLPopoverViewCell *cell = [tableView dequeueReusableCellWithIdentifier:YLPopoverViewCell.reuseid forIndexPath:indexPath];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.actions.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kPopoverViewCellHeight;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self _dismissPopover:^{
        YLPopoverAction *action = self.actions[indexPath.row];
        if (action.handler) {
            action.handler(action);
        }
    }];
}


#pragma mark - getter
- (NSMutableArray *)actions
{
    if (!_actions) {
        _actions = @[].mutableCopy;
    }
    return _actions;
}
@end
