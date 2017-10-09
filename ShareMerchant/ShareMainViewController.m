//
//  ShareMainViewController.m
//  ShareMerchant
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ShareMainViewController.h"
#import "ImageAndLabelCollectionViewCell.h"
#import "MessageViewController.h"
#import "PromotionViewController.h"
#import "BillViewController.h"
#import "TeamViewController.h"
#import "UsersViewController.h"
#import "RegisterAgentViewController.h"
#import "CashWithdrawalViewController.h"
#import "PassPhoneViewController.h"
#import "HeaderMessageViewController.h"

@interface ShareMainViewController ()
<UICollectionViewDelegate, UICollectionViewDataSource>
/** <#注释#> */
@property(nonatomic, strong) NSArray * array;
/** <#注释#> */
@property(nonatomic, strong) NSArray * label;
@end
static NSString * const ImageAndLabelCell = @"ImageAndLabelCollectionViewCell";
@implementation ShareMainViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [self.navigationItem setHidesBackButton:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"汇享侠";
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-mesage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didLeftBarButton:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    UIImage * image = [UIImage imageNamed:@"icon_team"];
    UIImage * image1 = [UIImage imageNamed:@"icon_user"];
    UIImage * image2 = [UIImage imageNamed:@"icon_qrcode"];
    UIImage * image3 = [UIImage imageNamed:@"icon_bill"];
    self.array = @[image, image1, image2, image3];

    self.label = @[@"团队", @"用户", @"推广二维码", @"账单"];
    [self createView];
}
- (void)createView
{
    UIView * backView = [[UIView alloc] init];
    backView.backgroundColor = [UIColor whiteColor];
    backView.userInteractionEnabled = YES;
    [self.view addSubview:backView];
    [backView makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.equalTo(0);
        make.height.equalTo(90 * HEIGHTFIT);
    }];
    UIImageView * images = [[UIImageView alloc] init];
    images.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapPushHeaderVC:)];
    [images addGestureRecognizer:tap];
    images.image = [UIImage imageNamed:@"header-1.jpg"];
    images.contentMode = UIViewContentModeScaleToFill;
    images.layer.masksToBounds = YES;
    images.layer.cornerRadius = 22;
    [backView addSubview:images];
    [images makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(20 * HEIGHTFIT);
        make.left.equalTo(35 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(44 * WIDTHFIT, 44 * HEIGHTFIT));
    }];
    
    UILabel * label = [UILabel StringWithFont:NAM_TITLE_FONT_M WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
    label.text = @"13512345678";
    label.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapPushHeaderVC:)];
    [label addGestureRecognizer:tap1];
    label.textAlignment = NSTextAlignmentLeft;
    [backView addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(20 * HEIGHTFIT);
        make.left.equalTo(images.right).offset(15 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(150 * WIDTHFIT, 20 * HEIGHTFIT));
    }];
    
    UILabel * label1 = [UILabel StringWithFont:NAM_TITLE_FONT WithTextColor:UIColorFromRGB(GLOBAL_PAGE_COLOR)];
    label1.text = @"注册商家代理账号";
    label1.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapPushHeaderVC:)];
    [label1 addGestureRecognizer:tap2];
    label1.textAlignment = NSTextAlignmentCenter;
    [backView addSubview:label1];
    [label1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.bottom).offset(10 * HEIGHTFIT);
        make.left.equalTo(images.right).offset(15 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(120 * WIDTHFIT, 20 * HEIGHTFIT));
    }];
    
    
    UIButton * but = [UIButton ImageButtonWithType:UIButtonTypeCustom WithString:@"btn-return" target:self action:@selector(didTapPushVC:)];
    [backView addSubview:but];
    [but makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(-35 * WIDTHFIT);
        make.bottom.equalTo(-13 * HEIGHTFIT);
        make.size.equalTo(CGSizeMake(30 * WIDTHFIT, 30 * HEIGHTFIT));
    }];
    
    
    
    UIView * line = [UIView lineWithView];
    [backView addSubview:line];
    [line makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.bottom.and.right.equalTo(0);
        make.height.equalTo(5 * HEIGHTFIT);
    }];
    
    UILabel * label2 = [UILabel StringWithFont:NAME_TIT_FONT WithTextColor:UIColorFromRGB(GLOBAL_SIGN_COLOR)];
    label2.text = @"可提金额";
    label2.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label2];
    [label2 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.bottom).offset(10 * HEIGHTFIT);
        make.left.equalTo(35 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 12 * HEIGHTFIT));
    }];
    
    UILabel * label3 = [UILabel StringWithFont:NAV_TITLE_N WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
    label3.text = @"¥";
    label3.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label3];
    [label3 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label2.bottom).offset(20 * HEIGHTFIT);
        make.left.equalTo(35 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(18 * WIDTHFIT, 18 * HEIGHTFIT));
    }];
    
    UILabel * label4 = [UILabel StringWithFont:TIMER_TITLE_SIX WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
    label4.text = @"3125.00";
    label4.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label4];
    [label4 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label2.bottom).offset(10 * HEIGHTFIT);
        make.left.equalTo(label3.right);
        make.size.equalTo(CGSizeMake(220 * WIDTHFIT, 30 * HEIGHTFIT));
    }];
    
    UIButton * button = [UIButton TextStringStlyWithType:UIButtonTypeCustom WithString:@"申请提现" WithBackgroundColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) WithTextColor:UIColorFromRGB(BLACK_COLOR) WithFont:NAM_TITLE_FONT target:self action:@selector(didWithdrawButton:)];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5;
    button.layer.borderColor = UIColorFromRGB(BLACK_COLOR).CGColor;
    button.layer.borderWidth = 1;
    [self.view addSubview:button];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(backView.bottom).offset(25 * HEIGHTFIT);
        make.right.equalTo(-35 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(62 * WIDTHFIT, 28 * HEIGHTFIT));
    }];
    UIView * line1 = [UIView lineWithView];
    [self.view addSubview:line1];
    [line1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label4.bottom).offset(10 * HEIGHTFIT);
        make.left.and.right.equalTo(0);
        make.height.equalTo(0.5);
    }];
    
    UIButton * button1 = [UIButton TextStringStlyWithType:UIButtonTypeCustom WithString:@"上传用户签约照片" WithBackgroundColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) WithTextColor:UIColorFromRGB(BLACK_COLOR) WithFont:NAM_TITLE_FONT target:self action:@selector(didPhotoButton:)];
    [self.view addSubview:button1];
    [button1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.bottom).offset(15 * HEIGHTFIT);
        make.right.equalTo(-35 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(150 * WIDTHFIT, 15 * HEIGHTFIT));
    }];
    
    CALayer * layer = [CALayer layer];
    layer.frame = CGRectMake(35 * WIDTHFIT, 217 * HEIGHTFIT, 307 * WIDTHFIT, 199 * HEIGHTFIT);
    layer.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowOpacity = 0.5;
    layer.cornerRadius = 10.0f;
    [self.view.layer addSublayer:layer];
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(305 / 2 * WIDTHFIT, 196 / 2 * HEIGHTFIT);
    flowLayout.minimumLineSpacing = 2.5;
    flowLayout.minimumInteritemSpacing = 1;
    UICollectionView * colllectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(35 * WIDTHFIT, 217 * HEIGHTFIT, 307 * WIDTHFIT, 199 * HEIGHTFIT) collectionViewLayout:flowLayout];
    colllectionView.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
    colllectionView.showsHorizontalScrollIndicator = NO;
    colllectionView.showsVerticalScrollIndicator = NO;
    colllectionView.layer.masksToBounds = YES;
    colllectionView.layer.cornerRadius = 10;
    colllectionView.bounces = NO;
    colllectionView.delegate = self;
    colllectionView.dataSource = self;
    [self.view addSubview:colllectionView];
    [colllectionView registerClass:[ImageAndLabelCollectionViewCell class] forCellWithReuseIdentifier:ImageAndLabelCell];
    
    UIButton * button2 = [UIButton TextStringStlyWithType:UIButtonTypeCustom WithString:@"退 出" WithBackgroundColor:UIColorFromRGB(BLACK_COLOR) WithTextColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) WithFont:NAM_TITLE_B target:self action:@selector(didOutButton:)];
    button2.layer.masksToBounds = YES;
    button2.layer.cornerRadius = 22;
    [self.view addSubview:button2];
    [button2 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(35 * WIDTHFIT);
        make.right.equalTo(-35 * WIDTHFIT);
        make.bottom.equalTo(-98 * HEIGHTFIT);
        make.height.equalTo(44 * HEIGHTFIT);
    }];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _array.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageAndLabelCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:ImageAndLabelCell forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.image.image = _array[indexPath.item];
    cell.label.text = _label[indexPath.item];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.item) {
        case 0:
        {
            TeamViewController * temVC = [[TeamViewController alloc] init];
            [self.navigationController pushViewController:temVC animated:YES];
        }
            break;
         case 1:
        {
            UsersViewController * userVC = [[UsersViewController alloc] init];
            [self.navigationController pushViewController:userVC animated:YES];
        }
            break;
        case 2:
        {
            PromotionViewController * promVC = [[PromotionViewController alloc] init];
            [self.navigationController pushViewController:promVC animated:YES];
        }
            break;
        case 3:
        {
            BillViewController * billVC = [[BillViewController alloc] init];
            [self.navigationController pushViewController:billVC animated:YES];
        }
            break;
        default:
            break;
    }
}
- (void)didTapPushVC:(UIButton *)tap
{
    RegisterAgentViewController * regVC = [[RegisterAgentViewController alloc] init];
    [self.navigationController pushViewController:regVC animated:YES];
}
- (void)didTapPushHeaderVC:(UITapGestureRecognizer *)tap
{
    HeaderMessageViewController * heaVC = [[HeaderMessageViewController alloc] init];
    [self.navigationController pushViewController:heaVC animated:YES];
}
- (void)didWithdrawButton:(UIButton *)sender
{
    CashWithdrawalViewController * cashVC = [[CashWithdrawalViewController alloc] init];
    [self.navigationController pushViewController:cashVC animated:YES];
}
- (void)didPhotoButton:(UIButton *)sender
{
    PassPhoneViewController * passVC = [[PassPhoneViewController alloc] init];
    [self.navigationController pushViewController:passVC animated:YES];

}
- (void)didLeftBarButton:(UIBarButtonItem *)sender
{
    MessageViewController * messVC = [[MessageViewController alloc] init];
    [self.navigationController pushViewController:messVC animated:YES];
}
- (void)didOutButton:(UIButton *)sender
{
//    NSString * phone = [UserDefaults objectForKey:@"phoneNumber"];
//    NSString * token = [UserDefaults objectForKey:@"token"];
//
//    if (isValidString(phone)) {
//        [UserDefaults removeObjectForKey:@"phoneNumber"];
//    }
//
//    if (isValidString(token)) {
//        [UserDefaults removeObjectForKey:@"token"];
//    }
    [self.navigationController popViewControllerAnimated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
