//
//  PassPhoneViewController.m
//  ShareMerchant
//
//  Created by apple on 2017/9/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "PassPhoneViewController.h"
#import "YYNamePassWrodView.h"
#import "YYCodeView.h"
#import "PassPhotoCollectionViewCell.h"
#import "PassPhotoBCollectionViewCell.h"
#import "PassPhotoCCollectionViewCell.h"
#import "PassPhotoDCollectionViewCell.h"

@interface PassPhoneViewController ()
<
YYNamePassWrodViewDelegate,
YYCodeViewDelegate,
UICollectionViewDelegate,
UICollectionViewDataSource,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate
>
/** <#注释#> */
@property(nonatomic, strong) UICollectionView * collectionView;
/** <#注释#> */
@property(nonatomic, strong) UIImage * imageA;
/** <#注释#> */
@property(nonatomic, strong) UIImage * imageB;
/** <#注释#> */
@property(nonatomic, strong) UIImage * imageC;
/** <#注释#> */
@property(nonatomic, strong) UIImage * imageD;
/** <#注释#> */
@property(nonatomic, strong) UIScrollView * scrollView;

@end
static NSString * const PassPhotoCell = @"PassPhotoCollectionViewCell";
static NSString * const PassBPhotoCell = @"PassPhotoBCollectionViewCell";
static NSString * const PassCPhotoCell = @"PassPhotoCCollectionViewCell";
static NSString * const PassDPhotoCell = @"PassPhotoDCollectionViewCell";
@implementation PassPhoneViewController
{
    YYNamePassWrodView * passWordView;
    YYCodeView * codeView;
    NSInteger  itemCount;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"上传签约照片";
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didLeftBarButton:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    [self createView];
}
- (void)createView
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 700 * HEIGHTFIT);
    _scrollView.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    _scrollView.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
#ifdef __IPHONE_11_0
    if ([_scrollView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
        if (@available(iOS 11.0, *)) {
            _scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
    }
#endif
    [self.view addSubview:_scrollView];
    
    UILabel * label = [UILabel StringWithFont:NAME_TIT_FONT WithTextColor:UIColorFromRGB(GLOBAL_PAGE_COLOR)];
    label.text = @"为确保用户签约顺利完成，请商家提醒并监督用户在汇享侠上签电子协议时正常签名。";
    label.frame = CGRectMake(40 * WIDTHFIT, 20 * HEIGHTFIT, 295 * WIDTHFIT, 35 * HEIGHTFIT);
    label.textAlignment = NSTextAlignmentLeft;
    label.numberOfLines = 0;
    [_scrollView addSubview:label];


    CALayer * layer = [CALayer layer];
    layer.frame = CGRectMake(30 * WIDTHFIT, 70 * HEIGHTFIT, 315 * WIDTHFIT, 40 * HEIGHTFIT);
    layer.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowOpacity = 0.5;
    layer.cornerRadius = 10.0f;
    [_scrollView.layer addSublayer:layer];

    passWordView = [[YYNamePassWrodView alloc] initWithFrame:CGRectMake(30 * WIDTHFIT, 70 * HEIGHTFIT, 315 * WIDTHFIT, 40 * HEIGHTFIT)];
    passWordView.label.text = @"用户名";
    passWordView.textField.placeholder = @"请输入用户名";
    passWordView.delegate = self;
    [_scrollView addSubview:passWordView];

    CALayer * layer1 = [CALayer layer];
    layer1.frame = CGRectMake(30 * WIDTHFIT, 120 * HEIGHTFIT, 315 * WIDTHFIT, 40 * HEIGHTFIT);
    layer1.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
    layer1.shadowOffset = CGSizeMake(0, 0);
    layer1.shadowOpacity = 0.5;
    layer1.cornerRadius = 10.0f;
    [_scrollView.layer addSublayer:layer1];

    codeView = [[YYCodeView alloc] initWithFrame:CGRectMake(30 * WIDTHFIT, 120 * HEIGHTFIT, 315 * WIDTHFIT, 40 * HEIGHTFIT)];
    codeView.label.text = @"订单号";
    codeView.textField.placeholder = @"请输入订单号";
    codeView.delegate = self;
    [_scrollView addSubview:codeView];

    UILabel * label1 = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.text = @"请上传用户签约时照片";
    [_scrollView addSubview:label1];
    [label1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(codeView.bottom).offset(20 * HEIGHTFIT);
        make.centerX.equalTo(_scrollView);
        make.size.equalTo(CGSizeMake(200 * WIDTHFIT, 14 * HEIGHTFIT));
    }];
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(315 / 2 * WIDTHFIT, 354 / 2 * HEIGHTFIT);
    flowLayout.minimumLineSpacing = 2 * HEIGHTFIT;
    flowLayout.minimumInteritemSpacing = 1 * WIDTHFIT;
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(30 * WIDTHFIT, 201 * HEIGHTFIT, 317 * WIDTHFIT, 356 * HEIGHTFIT) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [_scrollView addSubview:_collectionView];
    [self.collectionView registerClass:[PassPhotoCollectionViewCell class] forCellWithReuseIdentifier:PassPhotoCell];//A
    [self.collectionView registerClass:[PassPhotoBCollectionViewCell class] forCellWithReuseIdentifier:PassBPhotoCell];//B
    [self.collectionView registerClass:[PassPhotoCCollectionViewCell class] forCellWithReuseIdentifier:PassCPhotoCell];//C
    [self.collectionView registerClass:[PassPhotoDCollectionViewCell class] forCellWithReuseIdentifier:PassDPhotoCell];//D
    
    
    UIButton * button = [UIButton TextStringStlyWithType:UIButtonTypeCustom WithString:@"上 传" WithBackgroundColor:UIColorFromRGB(BLACK_COLOR) WithTextColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) WithFont:NAM_TITLE_B target:self action:@selector(didUpDateButoon:)];
    button.frame = CGRectMake(35 * WIDTHFIT, 574.5 * HEIGHTFIT, 315 * WIDTHFIT, 44 * HEIGHTFIT);
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 22;
    [_scrollView addSubview:button];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.item) {
        case 0:
        {
            PassPhotoCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:PassPhotoCell forIndexPath:indexPath];
            cell.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
            cell.label.text = @"用户手持证件照";
            if (self.imageA) {
                cell.strImageView.image = _imageA;
            }else{
                cell.strImageView.image = nil;
            }
            return cell;
        }
            break;
        case 1:
        {
            PassPhotoBCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:PassBPhotoCell forIndexPath:indexPath];
            cell.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
            cell.label.text = @"手机串号 + 身份证正面";
            if (self.imageB) {
                cell.strImageView.image = _imageB;
            }else{
                cell.strImageView.image = nil;
            }
            return cell;
        }
            break;
        case 2:
        {
            PassPhotoCCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:PassCPhotoCell forIndexPath:indexPath];
            cell.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
            cell.label.text = @"手机串号 + 身份证背面";
            if (self.imageC) {
                cell.strImageView.image = _imageC;
            }else{
                cell.strImageView.image = nil;
            }
            return cell;
        }
            break;
        case 3:
        {
            PassPhotoDCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:PassDPhotoCell forIndexPath:indexPath];
            cell.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
            cell.label.text = @"其他";
            if (self.imageD) {
                cell.strImageView.image = _imageD;
                cell.isSeledPhoto = YES;
            }else{
                cell.strImageView.image = nil;
                cell.isSeledPhoto = NO;
            }
            return cell;
            
        }
            break;
        default:
            break;
    }
    return nil;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    itemCount = indexPath.item;
    UIImagePickerController * imagePickerController = [[UIImagePickerController alloc] init];
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertAction setValue:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) forKey:@"titleTextColor"];
    UIAlertAction * picturesAlert = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];//读取设备授权状态
        if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
            
            UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"相机权限未开启，请进入系统【设置】>【隐私】>【相机】中开启相机功能" message:nil preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction * dismiss = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:dismiss];
            //            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
            
        }else{
            
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;//调用相机
                imagePickerController.delegate = self;//设置代理
                imagePickerController.allowsEditing = YES;//挑选图片是否可以编辑
                imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;//模态出图片库
                [self.navigationController presentViewController:imagePickerController animated:YES completion:^{
                }];
                
            }
            else
            {
                [MBProgressShow ShowMBProgress:@"该设备没有拍照功能" WithTimer:2 WithView:self.view];
            }
            
        }
        
    }];
    [picturesAlert setValue:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) forKey:@"titleTextColor"];
    UIAlertAction *albumAlert = [UIAlertAction actionWithTitle:@"相册选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
        if (status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied)
        {
            UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"相机权限未开启，请进入系统【设置】>【隐私】>【相册】中开启相册功能" message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction * dismiss = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:dismiss];
            //            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
        }else{
            
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;//调用相册
                imagePickerController.delegate = self;//设置代理
                imagePickerController.allowsEditing = YES;//挑选图片是否可以编辑
                imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;//模态出图片库
                [self.navigationController presentViewController:imagePickerController animated:YES completion:^{
                    
                }];
            }
        }
    }];
    [albumAlert setValue:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) forKey:@"titleTextColor"];
    [alert addAction:picturesAlert];
    [alert addAction:albumAlert];
    [alert addAction:alertAction];
    
    UILabel *appearanceLabel = [UILabel appearanceWhenContainedIn:UIAlertController.class, nil];
    UIFont *font = NAV_TITLE_FONT_S;
    [appearanceLabel setAppearanceFont:font];
    [self presentViewController:alert animated:YES completion:nil];

}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        UIImage *image = [info valueForKey:UIImagePickerControllerEditedImage];
        switch (itemCount) {
            case 0:
                self.imageA = image;
                break;
            case 1:
                self.imageB = image;
                break;
            case 2:
                self.imageC = image;
                break;
            case 3:
                self.imageD = image;
                break;
            default:
                break;
        }
        
        
    } else {
        UIImage *image = [info valueForKey:UIImagePickerControllerEditedImage];
        
        switch (itemCount) {
            case 0:
                self.imageA = image;
                break;
            case 1:
                self.imageB = image;
                break;
            case 2:
                self.imageC = image;
                break;
            case 3:
                self.imageD = image;
                break;
            default:
                break;
        }
        
    }
    [self.collectionView reloadData];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - 取消图片挑选
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //  NSLog(@"取消挑选");
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

//用户名
- (void)passTextString:(NSString *)string
{
    
}
//订单号
- (void)passTextCodeString:(NSString *)string
{
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.scrollView endEditing:YES];
}
- (void)didUpDateButoon:(UIButton *)sender
{
    
}

- (void)didLeftBarButton:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
