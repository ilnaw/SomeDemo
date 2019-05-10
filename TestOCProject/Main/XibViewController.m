//
//  XibViewController.m
//  TestOCProject
//
//  Created by zfh on 2019/4/10.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "XibViewController.h"
#import "XibView.h"

@interface XibViewController ()
@property (weak, nonatomic) IBOutlet XibView *xibView;

@end

@implementation XibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor blueColor];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
