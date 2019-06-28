//
//  UIViewController+ImagePicker.h
//  TestOCProject
//
//  Created by wanli on 2019/3/21.
//  Copyright © 2019 wanli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (ImagePicker)<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (copy, nonatomic)void (^didFinishPick)(UIImage *);
- (void)presentImagePicker:(void (^)(UIImage *))finishPick;
@end

NS_ASSUME_NONNULL_END
