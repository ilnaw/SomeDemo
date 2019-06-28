//
//  ASViewController.m
//  TestOCProject
//
//  Created by wanli on 2019/4/4.
//  Copyright © 2019 wanli. All rights reserved.
//

#import "AsyncViewController.h"

@interface MessageCell()
@property (strong, nonatomic)ASDisplayNode *backgroundNode;
@property (strong, nonatomic)ASTextNode *contentLabel;
@property (strong, nonatomic)ASTextNode *timeLabel;
@property (strong, nonatomic)ASDisplayNode *separator;
@property (strong, nonatomic)ASButtonNode *watchButton;
@end

@implementation MessageCell

- (instancetype)initWithData:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.automaticallyManagesSubnodes = true;
        self.contentLabel.attributedText = [[NSAttributedString alloc]initWithString:dic[@"content"] attributes:@{
                                                                                               NSForegroundColorAttributeName: [UIColor darkGrayColor],
                                                                                               NSFontAttributeName: [UIFont systemFontOfSize:13.0]
                                                                                               }];
        self.timeLabel.attributedText = [[NSAttributedString alloc]initWithString:dic[@"time"] attributes:@{
                                                                                                        NSForegroundColorAttributeName : [UIColor darkGrayColor],
                                                                                                        NSFontAttributeName: [UIFont systemFontOfSize:13.0]
                                                                                                        }];
        [self.watchButton setTitle:@"查看" withFont:[UIFont systemFontOfSize:15.0] withColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    }
    return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{
    ASCenterLayoutSpec *buttonCenter = [[ASCenterLayoutSpec alloc]initWithHorizontalPosition:ASRelativeLayoutSpecPositionCenter
                                                                            verticalPosition:ASRelativeLayoutSpecPositionNone
                                                                                sizingOption:ASRelativeLayoutSpecSizingOptionMinimumWidth
                                                                                       child:self.watchButton];
    ASStackLayoutSpec *spec = [ASStackLayoutSpec stackLayoutSpecWithDirection:ASStackLayoutDirectionVertical
                                                                      spacing:15
                                                               justifyContent:ASStackLayoutJustifyContentStart
                                                                   alignItems:ASStackLayoutAlignItemsStretch
                                                                     children:@[
                                                                                self.contentLabel,
                                                                                self.timeLabel,
                                                                                self.separator,
                                                                                buttonCenter
                                                                                ]];
    ASBackgroundLayoutSpec *background = [ASBackgroundLayoutSpec backgroundLayoutSpecWithChild:[ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) child:spec] background:self.backgroundNode];
    
    return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsMake(5, 15, 5, 15) child:background];
}

- (ASDisplayNode *)backgroundNode
{
    if (!_backgroundNode) {
        _backgroundNode = [[ASDisplayNode alloc]init];
        _backgroundNode.cornerRadius = 10;
        _backgroundNode.backgroundColor = [UIColor whiteColor];
    }
    return _backgroundNode;
}

- (ASTextNode *)contentLabel
{
    if (!_contentLabel) {
        _contentLabel = [[ASTextNode alloc]init];
    }
    return _contentLabel;
}

- (ASTextNode *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [[ASTextNode alloc]init];
    }
    return _timeLabel;
}

- (ASDisplayNode *)separator
{
    if (!_separator) {
        _separator = [[ASDisplayNode alloc]init];
        CGSize size = _separator.style.preferredSize;
        size.height = 1;
        _separator.style.preferredSize = size;
        _separator.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _separator;
}

- (ASButtonNode *)watchButton
{
    if (!_watchButton) {
        _watchButton = [[ASButtonNode alloc]init];
        _watchButton.style.preferredSize = CGSizeMake(110, 30);
        _watchButton.cornerRadius = 15;
        _watchButton.borderWidth = 1;
        _watchButton.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    }
    return _watchButton;
}


@end

@interface AsyncViewController ()<ASTableDelegate,ASTableDataSource>
@property (strong ,nonatomic)ASTableNode *tableView;
@property (assign, nonatomic,getter=isOn)BOOL on;
@end

@implementation AsyncViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTranslucent:false];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubnode:self.tableView];
    [self.tableView.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.wlState = WLStateTop | WLStateLeft | WLStateRight;
    
    if (self.wlState & WLStateTop) {
        NSLog(@"-----这是top");
    }
    if (self.wlState & WLStateBottom) {
        NSLog(@"------这是bottom");
    }
    
    NSLog(@"====%@",self.isOn?@"YES":@"NO");
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p,%@>",
            self.class,
            self,
            @{
              @"title":@"name"
              }
            ];
}

- (NSString *)debugDescription
{
    return @"111111";
}

- (BOOL)isOn
{
    return false;
}

#pragma mark - delegate and dataSource
- (ASCellNode *)tableNode:(ASTableNode *)tableNode nodeForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ASCellNode *node = [[MessageCell alloc]initWithData:@{@"content":@"测试推送测试推送测试推送测试推送测试推送测试推送测试推送测试推送测试推送测试推送测试推送测试推送测试推送测试推送测试推送测试推送",@"time":@"2019-10-18"}];
    return node;
}
- (NSInteger)tableNode:(ASTableNode *)tableNode numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (void)tableNode:(ASTableNode *)tableNode didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableNode deselectRowAtIndexPath:indexPath animated:false];
}
- (ASTableNode *)tableView
{
    if (!_tableView) {
        _tableView = [[ASTableNode alloc]initWithStyle:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.view.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    }
    return _tableView;
}
@end
