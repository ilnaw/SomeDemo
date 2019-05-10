//
//  NormalRefreshHeader.m
//  TestOCProject
//
//  Created by wanli on 2019/3/25.
//  Copyright © 2019 wanli. All rights reserved.
//

#import "NormalRefreshHeader.h"

@implementation NormalRefreshHeader

- (void)prepare
{
    [super prepare];
    self.stateLabel.hidden = true;
    self.lastUpdatedTimeLabel.hidden = true;
}
@end
