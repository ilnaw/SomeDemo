//
//  SnapViewController.m
//  TestOCProject
//
//  Created by wl on 2019/5/13.
//  Copyright © 2019年 wanli. All rights reserved.
//

#import "SnapViewController.h"
#import "UIButton+YLButtonLayoutType.h"

@interface ShareCell : UICollectionViewCell
@property (nonatomic, strong)UIButton  *iconButton;
@end

@implementation ShareCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.iconButton = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:@"QQ" forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:@"jiankys14_icon"] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            button;
        });
        
        [self addSubview:self.iconButton];
        [self.iconButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(8, 15, 8, 15));
        }];
        [self.iconButton yl_setButtonLayoutType:YLButtonLayoutTypeImageTop];
    }
    return self;
}
@end

@interface SnapViewController ()<CAAnimationDelegate,UICollectionViewDataSource>
@property (nonatomic, strong)UIButton *openButton;
@property (nonatomic, strong)CAShapeLayer *shapeLayer;
@property (nonatomic, strong)UICollectionView *collction;
@property (nonatomic, assign)BOOL isAnimation;
@end

@implementation SnapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTranslucent:NO];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *bg = [UIImageView new];
    bg.image = [UIImage imageNamed:@"mz"];
    bg.contentMode = UIViewContentModeScaleAspectFill;
    bg.userInteractionEnabled = YES;
    [self.view addSubview:bg];
    [bg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    UITapGestureRecognizer *cancel = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancel)];
    [bg addGestureRecognizer:cancel];
    
    
//    UIScrollView *scrollView = [[UIScrollView alloc]init];
//    [self.view addSubview:scrollView];
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc]initWithEffect:blur];
    visualEffectView.alpha = 0.9;
    
    [bg addSubview:visualEffectView];
    [visualEffectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(bg);
    }];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.layer.masksToBounds = YES;
    imageView.image = self.snapImg;
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, 50, 0, 50));
        make.top.greaterThanOrEqualTo(self.view).offset(30);
        make.bottom.lessThanOrEqualTo(self.view).offset(-120);
        make.width.equalTo(imageView.mas_height).multipliedBy(self.snapImg.size.width/self.snapImg.size.height);
//        make.centerX.equalTo(self.view);
    }];
    
//    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
//
//    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(scrollView);
//        make.height.mas_equalTo(self.snapImg.size.height);
//        make.width.mas_equalTo(self.snapImg.size.width);
//    }];
    
    UIView *redView = [UIView new];
    redView.backgroundColor = [UIColor redColor];
    redView.layer.cornerRadius = 10;
    [self.view addSubview:redView];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 300));
    }];
    
    self.openButton = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.layer.cornerRadius = 40;
        [button setTitle:@"打开" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor whiteColor]];
        [button addTarget:self action:@selector(_openRed) forControlEvents:UIControlEventTouchUpInside];
        
        button;
    });
    
    [redView addSubview:self.openButton];
    [self.openButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).multipliedBy(1.2);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];

    UIBezierPath *shapePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 200, 170) byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
    CGPoint startPoint = CGPointMake(0, 170);
    CGPoint endPoint = CGPointMake(200, 170);
    CGPoint controlPoint = CGPointMake(100, 240);
    [shapePath moveToPoint:startPoint];
    [shapePath addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.path = shapePath.CGPath;
    shape.fillColor = [UIColor orangeColor].CGColor;
    [redView.layer insertSublayer:shape atIndex:0];
    
    self.shapeLayer = shape;
    
    self.collction = ({
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        UICollectionView *view = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        view.showsHorizontalScrollIndicator = NO;
        view.backgroundColor = [UIColor whiteColor];
        [view registerClass:ShareCell.class forCellWithReuseIdentifier:ShareCell.reuseid];
        view.dataSource = self;
        view.backgroundColor = [UIColor clearColor];
      
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width / 5.0, 100);
        flowLayout.sectionInset = UIEdgeInsetsZero;
        flowLayout.minimumLineSpacing = 0.f;
        flowLayout.minimumInteritemSpacing = 0.f;
        
        view;
    });
    
    [self.view addSubview:self.collction];
    [self.collction mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(100);
    }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ShareCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ShareCell.reuseid forIndexPath:indexPath];
    return cell;
}

- (void)cancel{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)_openRed{
    if (_isAnimation) {
        return;
    }
    CABasicAnimation *rolateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rolateAnimation.toValue = @(2*M_PI);
    rolateAnimation.repeatCount = CGFLOAT_MAX;
    rolateAnimation.duration = 1.0;
    rolateAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    rolateAnimation.fillMode = kCAFillModeForwards;
    rolateAnimation.removedOnCompletion = NO;
    rolateAnimation.delegate = self;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = @1;
    scaleAnimation.toValue = @1.3;
    scaleAnimation.duration = 1.5;
    scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.removedOnCompletion = NO;
    scaleAnimation.delegate = self;
    
    CAAnimationGroup *openGroup = [CAAnimationGroup animation];
    openGroup.animations = @[rolateAnimation,scaleAnimation];
    openGroup.duration = 3.0;
    openGroup.delegate = self;
    openGroup.fillMode = kCAFillModeForwards;
    openGroup.removedOnCompletion = NO;
    
    self.openButton.layer.zPosition = 100;
    [self.openButton.layer addAnimation:openGroup forKey:@"openbutton"];
    _isAnimation = YES;
}

- (void)startShapeAnimation{
//    [self.openButton removeFromSuperview];
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, -240, 200, 170) byRoundingCorners:UIRectCornerTopRight | UIRectCornerTopLeft cornerRadii:CGSizeMake(10, 10)];
    CGPoint startPoint = CGPointMake(0, -70);
    CGPoint endPoint = CGPointMake(200, -70);
    CGPoint controlPoint = CGPointMake(100, 0);
    [path moveToPoint:startPoint];
    [path addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    pathAnimation.duration = 0.5;
    pathAnimation.toValue = (id)path.CGPath;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.delegate = self;
    
    //        self.shapeLayer.path = path.CGPath;
    [self.shapeLayer addAnimation:pathAnimation forKey:@"pathA"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    _isAnimation = NO;
    if (anim == [self.shapeLayer animationForKey:@"pathA"]) {
        [self.shapeLayer removeFromSuperlayer];
    }
    if (anim == [self.openButton.layer animationForKey:@"openbutton"]) {
        [self.openButton removeFromSuperview];
        [self startShapeAnimation];
    }
}

- (UIImage *)gaussianBlur:(UIImage *)image {
    CIImage *sourceImage = [CIImage imageWithCGImage:image.CGImage];
    CIContext *context   = [CIContext contextWithOptions:nil];
    
    NSString *gaussianBlurFilterName = @"CIGaussianBlur";
    CIFilter *gaussianBlur           = [CIFilter filterWithName:gaussianBlurFilterName];
    
    if (!gaussianBlur) { return nil; }
    
    [gaussianBlur setValue:sourceImage
                    forKey:kCIInputImageKey];
    [gaussianBlur setValue:[NSNumber numberWithFloat:3]
                    forKey:@"inputRadius"];
    
    CIImage *gaussianBlurResult = [gaussianBlur valueForKey:kCIOutputImageKey];
    
    CGImageRef cgImage = [context createCGImage:gaussianBlurResult
                                       fromRect:[sourceImage extent]];
    
    UIImage *blurredImage = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    return blurredImage;
}
@end


