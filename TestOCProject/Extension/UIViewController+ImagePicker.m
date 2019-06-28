//
//  UIViewController+ImagePicker.m
//  TestOCProject
//
//  Created by wanli on 2019/3/21.
//  Copyright © 2019 wanli. All rights reserved.
//

#import "UIViewController+ImagePicker.h"
#import <objc/runtime.h>

static char imagePickerKey;
@implementation UIViewController (ImagePicker)

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:true completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    self.didFinishPick(image);
    [picker dismissViewControllerAnimated:true completion:nil];
}

- (void)presentImagePicker:(void (^)(UIImage * _Nonnull))finishPick
{
    self.didFinishPick = ^(UIImage *image) {
        finishPick(image);
    };
    
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:nil
                                message:nil
                                preferredStyle:UIAlertControllerStyleActionSheet];
    [alert addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.delegate = self;
        [self presentViewController:picker animated:true completion:nil];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        picker.delegate = self;
        [self presentViewController:picker animated:true completion:nil];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self dismissViewControllerAnimated:true completion:nil];
    }]];
    
    [self presentViewController:alert animated:true completion:nil];
}

- (void (^)(UIImage * _Nonnull))didFinishPick
{
    return objc_getAssociatedObject(self, &imagePickerKey);
}

- (void)setDidFinishPick:(void (^)(UIImage * _Nonnull))didFinishPick
{
    objc_setAssociatedObject(self, &imagePickerKey, didFinishPick, OBJC_ASSOCIATION_RETAIN);
}

@end
