//
//  PromotionViewController.m
//  ShareMerchant
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "PromotionViewController.h"

@interface PromotionViewController ()
/** <#注释#> */
@property(nonatomic, strong) UIImageView * imageViews;
@end

@implementation PromotionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"推广二维码";
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didLeftBarButton:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    [self createView];
    [self createCIFilter];
}

- (void)createView
{
    UIView * view = [[UIView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:view];
    
    UIImageView * image = [[UIImageView alloc] init];
    image.image = [UIImage imageNamed:@"popup-1_L"];
    image.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:image];
    [image makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(30 * WIDTHFIT);
        make.right.equalTo(-30 * WIDTHFIT);
        make.bottom.equalTo(-165 * HEIGHTFIT);
        make.height.equalTo(385 * HEIGHTFIT);
    }];
    
    UILabel * label = [UILabel StringWithFont:NAM_TITLE_FONT WithTextColor:UIColorFromRGB(GLOBAL_PAGE_COLOR)];
    label.text = @"共享成功后即可获得奖金";
    label.textAlignment = NSTextAlignmentCenter;
    [image addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(75 * WIDTHFIT);
        make.right.equalTo(-75 * WIDTHFIT);
        make.bottom.equalTo(-19 * HEIGHTFIT);
        make.height.equalTo(15 * HEIGHTFIT);
    }];
    
    UILabel * label1 = [UILabel StringWithFont:NAM_TITLE_FONT WithTextColor:UIColorFromRGB(GLOBAL_PAGE_COLOR)];
    label1.text = @"用户扫描注册";
    label1.textAlignment = NSTextAlignmentCenter;
    [image addSubview:label1];
    [label1 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(75 * WIDTHFIT);
        make.right.equalTo(-75 * WIDTHFIT);
        make.bottom.equalTo(label.top).offset(-5 * HEIGHTFIT);
        make.height.equalTo(15 * HEIGHTFIT);
    }];
    
    self.imageViews = [[UIImageView alloc] init];
    _imageViews.contentMode = UIViewContentModeScaleToFill;
    [image addSubview:_imageViews];
    [_imageViews makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(70 * WIDTHFIT);
        make.right.equalTo(-70 * WIDTHFIT);
        make.bottom.equalTo(label1.top).offset(-65 * HEIGHTFIT);
        make.height.equalTo(165 * HEIGHTFIT);
    }];
    
    UIImageView * header = [[UIImageView alloc] init];
    header.contentMode = UIViewContentModeScaleToFill;
    header.image = [UIImage imageNamed:@"header-1"];
    [_imageViews addSubview:header];
    [header makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_imageViews);
        make.size.equalTo(CGSizeMake(40 * WIDTHFIT, 40 * HEIGHTFIT));
    }];
}
- (void)createCIFilter
{
    // 1. 创建一个二维码滤镜实例(CIFilter)
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 滤镜恢复默认设置
    [filter setDefaults];
    
    // 2. 给滤镜添加数据
    NSString *string = @"测试二维码";
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    // 使用KVC的方式给filter赋值
    [filter setValue:data forKeyPath:@"inputMessage"];
    
    // 3. 生成二维码
    CIImage *image = [filter outputImage];
    
    // 4. 显示二维码
    self.imageViews.image = [self createNonInterpolatedUIImageFormCIImage:image withSize:165 * WIDTHFIT];
    
}
- (void)didLeftBarButton:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
//显示高清二维码图片
- (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size {
    
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
