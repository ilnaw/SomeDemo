//
//  StackViewController.m
//  TestOCProject
//
//  Created by wl on 2019/7/18.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "StackViewController.h"
#import "YLCountDownButton.h"
#import <Photos/Photos.h>

@interface StackViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (nonatomic, strong)UIStackView *stackView;
@property (nonatomic, strong)YLCountDownButton *bt;
@end

@implementation StackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIStackView *stackView = [[UIStackView alloc]init];
    [self.view addSubview:stackView];
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.equalTo(self.view);
        make.height.mas_equalTo(50);
    }];
    self.stackView = stackView;
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.alignment = UIStackViewAlignmentCenter;
    stackView.distribution = UIStackViewDistributionFillEqually;
    stackView.spacing = 20;
    
    UILabel *label1 = [UILabel new];
    label1.text = @"111111111111111111";
    label1.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [stackView addArrangedSubview:label1];
    
    UILabel *label2 = [UILabel new];
    label2.text = @"222222222222222222";
    label2.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [stackView addArrangedSubview:label2];
    
    UILabel *label3 = [UILabel new];
    label3.text = @"333333333333333333";
    label3.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [stackView addArrangedSubview:label3];
    
    UILabel *label4 = [UILabel new];
    label4.text = @"44444";
    label4.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [stackView addArrangedSubview:label4];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [stackView removeArrangedSubview:label4];
    });
    
    YLCountDownButton *bt = [YLCountDownButton buttonWithTime:10
                                                 defaultTitle:@"查看验证码"];
    [bt addTarget:self action:@selector(_clicked:) forControlEvents:UIControlEventTouchUpInside];
    bt.backgroundColor = [UIColor whiteColor];
    bt.formatBlock = ^NSString * _Nonnull(NSInteger time) {
        return [NSString stringWithFormat:@"剩余%lds",time];
    };
    [self.view addSubview:bt];
    self.bt = bt;
    
    [bt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(stackView.mas_bottom);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 40));
    }];
    
    self.bt.layer.shadowOffset = CGSizeMake(10, 10);
    self.bt.layer.shadowColor = [UIColor blackColor].CGColor;
    self.bt.layer.shadowRadius = 1;
    self.bt.layer.shadowOpacity = 1;
}

- (void)_clicked:(YLCountDownButton *)sender{
    [sender startTimer];
//    UIImagePickerController *picker= [[UIImagePickerController alloc]init];
//    picker.delegate = self;
//    picker.mediaTypes = [NSArray arrayWithObjects:@"public.movie", nil];
//    picker.videoQuality = UIImagePickerControllerQualityTypeHigh;
//    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    picker.allowsEditing = false;
//
//    [self presentViewController:picker animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info
{

        NSURL *url = info[UIImagePickerControllerReferenceURL];
        PHFetchResult *asset = [PHAsset fetchAssetsWithALAssetURLs:@[url] options:nil];
        [[PHImageManager defaultManager] requestAVAssetForVideo:asset.firstObject options:nil resultHandler:^(AVAsset * _Nullable asset, AVAudioMix * _Nullable audioMix, NSDictionary * _Nullable info) {
            if (asset) {
                AVURLAsset *a = (AVURLAsset *)asset;
                //上传这个url
                NSURL *url = a.URL;
                [self debugWidth:url];
            }
        }];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)debugWidth:(NSURL *)url{
    AVAsset *asset = [AVAsset assetWithURL:url];
    NSArray *tracks = [asset tracksWithMediaType:AVMediaTypeVideo];
    if([tracks count] > 0) {
        AVAssetTrack *videoTrack = [tracks objectAtIndex:0];
        CGAffineTransform t = videoTrack.preferredTransform;//这里的矩阵有旋转角度，转换一下即可
        NSLog(@"=====hello  width:%f===height:%f",videoTrack.naturalSize.width,videoTrack.naturalSize.height);//宽高
    }
}

@end
