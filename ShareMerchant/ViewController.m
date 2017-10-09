//
//  ViewController.m
//  ShareMerchant
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "EditPassWordViewController.h"
#import "ShareMainViewController.h"

@interface ViewController ()
/** <#注释#> */
@property(nonatomic, strong) PassWordView * nameView;
/** <#注释#> */
@property(nonatomic, strong) PassWordView * passView;
@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //监听键盘是否呼出
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didClickKeyboard:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didKboardDisappear:) name:UIKeyboardWillHideNotification object:nil];
    
    [self createLoginView];
    
}
- (void)createLoginView
{
    UIImageView * imageLogo = [[UIImageView alloc] init];
    imageLogo.image = [UIImage imageNamed:@"logo"];
    imageLogo.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageLogo];
    [imageLogo makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(115 * HEIGHTFIT);
        make.centerX.equalTo(self.view);
        make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 60 * HEIGHTFIT));
    }];
    
    UILabel * label = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
    label.text = @"商家系统1.01";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageLogo.bottom).offset(15 * HEIGHTFIT);
        make.centerX.equalTo(self.view);
        make.size.equalTo(CGSizeMake(80 * WIDTHFIT, 14 * HEIGHTFIT));
    }];
    
    CALayer * layer = [CALayer layer];
    layer.frame = CGRectMake(35 * WIDTHFIT, 239 * HEIGHTFIT, 305 * WIDTHFIT, 43 * HEIGHTFIT);
    layer.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowOpacity = 0.5;
    layer.cornerRadius = 10.0f;
    [self.view.layer addSublayer:layer];
    
    self.nameView = [[PassWordView alloc] init];
    self.nameView.image.image = [UIImage imageNamed:@"icon-phone"];
    self.nameView.textField.placeholder = @"请输入手机号";
    self.nameView.textField.keyboardType = UIKeyboardTypePhonePad;
    self.nameView.textField.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:_nameView];
    [_nameView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.bottom).offset(35 * HEIGHTFIT);
        make.left.equalTo(35 * WIDTHFIT);
        make.right.equalTo(-35 * WIDTHFIT);
        make.height.equalTo(43 * HEIGHTFIT);
    }];
    
    
    CALayer * layer1 = [CALayer layer];
    layer1.frame = CGRectMake(35 * WIDTHFIT, 302 * HEIGHTFIT, 305 * WIDTHFIT, 43 * HEIGHTFIT);
    layer1.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
    layer1.shadowOffset = CGSizeMake(0, 0);
    layer1.shadowOpacity = 0.5;
    layer1.cornerRadius = 10.0f;
    [self.view.layer addSublayer:layer1];
    
    self.passView = [[PassWordView alloc] init];
    self.passView.image.image = [UIImage imageNamed:@"icon-passport"];
    self.passView.textField.placeholder = @"请输入密码";
    self.passView.textField.keyboardType = UIKeyboardTypeDefault;
    self.passView.textField.textAlignment = NSTextAlignmentLeft;
    self.passView.textField.secureTextEntry = YES;
    [self.view addSubview:_passView];
    [_passView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameView.bottom).offset(20 * HEIGHTFIT);
        make.left.equalTo(35 * WIDTHFIT);
        make.right.equalTo(-35 * WIDTHFIT);
        make.height.equalTo(43 * HEIGHTFIT);
    }];

    UIButton * button = [UIButton TextStringStlyWithType:UIButtonTypeCustom WithString:@"修改密码" WithBackgroundColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) WithTextColor:UIColorFromRGB(BLACK_COLOR) WithFont:NAM_TITLE_B target:self action:@selector(didButtonPushVC:)];
    [self.view addSubview:button];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_passView.bottom).offset(15 * HEIGHTFIT);
        make.right.equalTo(-35 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(80 * WIDTHFIT, 25 * HEIGHTFIT));
    }];
    
    UIButton * button1 = [UIButton TextStringStlyWithType:UIButtonTypeCustom WithString:@"登 录" WithBackgroundColor:UIColorFromRGB(BLACK_COLOR) WithTextColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) WithFont:NAM_TITLE_B target:self action:@selector(didLoginButoon:)];
    button1.layer.masksToBounds = YES;
    button1.layer.cornerRadius = 22;
    [self.view addSubview:button1];
    [button1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_passView.bottom).offset(65 * HEIGHTFIT);
        make.left.equalTo(35 * WIDTHFIT);
        make.right.equalTo(-35 * WIDTHFIT);
        make.height.equalTo(44 * HEIGHTFIT);
    }];
    
}
#pragma mark --- 修改密码
- (void)didButtonPushVC:(UIButton *)sender
{
    EditPassWordViewController * editVC = [[EditPassWordViewController alloc] init];
    [self.navigationController pushViewController:editVC animated:YES];
}
#pragma mark --- 登录
- (void)didLoginButoon:(UIButton *)sender
{
    ShareMainViewController * shareVC = [[ShareMainViewController alloc] init];
    [self.navigationController pushViewController:shareVC animated:NO];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    
}
#pragma mark -      键盘即将跳出

- (void)didClickKeyboard:(NSNotification *)sender{
    
    CGFloat durition = [sender.userInfo[@"UIKeyboardAnimationDurationUserInfoKey"] doubleValue];
    
    CGRect keyboardRect = [sender.userInfo[@"UIKeyboardFrameEndUserInfoKey"] CGRectValue];
    
    CGFloat keyboardHeight = (keyboardRect.size.height / 2 - 20 ) * HEIGHTFIT;
    
    [UIView animateWithDuration:durition animations:^{
        
        self.view.transform = CGAffineTransformMakeTranslation(0, -keyboardHeight);
        
    }];
    
}
#pragma mark -      当键盘即将消失

- (void)didKboardDisappear:(NSNotification *)sender{
    
    CGFloat duration = [sender.userInfo[@"UIKeyboardAnimationDurationUserInfoKey"] doubleValue];
    
    [UIView animateWithDuration:duration animations:^{
        
        self.view.transform = CGAffineTransformIdentity;
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
