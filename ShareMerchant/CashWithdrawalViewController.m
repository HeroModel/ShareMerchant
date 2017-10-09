//
//  CashWithdrawalViewController.m
//  ShareMerchant
//
//  Created by apple on 2017/9/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "CashWithdrawalViewController.h"
#import "YYAccountView.h"
#import "YYPhoneCodeView.h"
#import "RecordViewController.h"

@interface CashWithdrawalViewController ()<YYAccountViewDelegate, YYPhoneCodeViewDelegate>

@end

@implementation CashWithdrawalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"提现";
    self.view.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didLeftBarButton:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    UIButton * button = [UIButton TextStringStlyWithType:UIButtonTypeCustom WithString:@"历史记录" WithBackgroundColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) WithTextColor:UIColorFromRGB(GLOBAL_PAGE_COLOR) WithFont:NAM_TITLE target:self action:@selector(didRightButton:)];
    button.frame = CGRectMake((SCREEN_WIDTH - 60) * WIDTHFIT, 10 * HEIGHTFIT, 60 * WIDTHFIT, 20 * HEIGHTFIT);
    UIBarButtonItem * right = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = right;
    [self createView];
}
- (void)createView
{
    UILabel * label = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_SIGN_COLOR)];
    label.text = @"佣金余额";
    label.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(25 * HEIGHTFIT);
        make.left.equalTo(30 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 14 * HEIGHTFIT));
    }];
    
    UILabel * label1 = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GR_COLOR)];
    label1.text = @"2158元";
    label1.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label1];
    [label1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(25 * HEIGHTFIT);
        make.left.equalTo(label.right).offset(0);
        make.size.equalTo(CGSizeMake(150 * WIDTHFIT, 14 * HEIGHTFIT));
    }];
    
    CALayer * layer1 = [CALayer layer];
    layer1.frame = CGRectMake(30 * WIDTHFIT, 49 * HEIGHTFIT, 315 * WIDTHFIT, 139 * HEIGHTFIT);
    layer1.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
    layer1.shadowOffset = CGSizeMake(0, 0);
    layer1.shadowOpacity = 0.5;
    layer1.cornerRadius = 10.0f;
    [self.view.layer addSublayer:layer1];
    
    
    YYAccountView * accView = [[YYAccountView alloc] init];
    accView.moneyTextField.placeholder = @"请输入金额";
    accView.nameTextField.placeholder = @"请输入姓名";
    accView.accountTextField.placeholder = @"请输入支付宝账户";
    accView.delegate = self;
    [self.view addSubview:accView];
    [accView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.bottom).offset(10 * HEIGHTFIT);
        make.left.equalTo(30 * WIDTHFIT);
        make.right.equalTo(-30 * WIDTHFIT);
        make.height.equalTo(139 * HEIGHTFIT);
    }];
    
    UILabel * label2 = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_SIGN_COLOR)];
    label2.text = @"请验证手机号";
    label2.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label2];
    [label2 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(accView.bottom).offset(30 * HEIGHTFIT);
        make.left.equalTo(30 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(100 * WIDTHFIT, 14 * HEIGHTFIT));
    }];
    
    CALayer * layer = [CALayer layer];
    layer.frame = CGRectMake(30 * WIDTHFIT, 243 * HEIGHTFIT, 315 * WIDTHFIT, 92 * HEIGHTFIT);
    layer.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowOpacity = 0.5;
    layer.cornerRadius = 10.0f;
    [self.view.layer addSublayer:layer];
    
    YYPhoneCodeView * phoneView = [[YYPhoneCodeView alloc] init];
    phoneView.phoneTextField.placeholder = @"请输入手机号";
    phoneView.codeTextField.placeholder = @"请输入验证码";
    phoneView.delegate = self;
    [self.view addSubview:phoneView];
    [phoneView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label2.bottom).offset(10 * HEIGHTFIT);
        make.left.equalTo(30 * WIDTHFIT);
        make.right.equalTo(-30 * WIDTHFIT);
        make.height.equalTo(92 * HEIGHTFIT);
    }];
    
    UIButton * button = [UIButton TextStringStlyWithType:UIButtonTypeCustom WithString:@"提 现" WithBackgroundColor:UIColorFromRGB(BLACK_COLOR) WithTextColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) WithFont:NAM_TITLE_B target:self action:@selector(didButtonBoot:)];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 22;
    [self.view addSubview:button];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phoneView.bottom).offset(60 * HEIGHTFIT);
        make.left.equalTo(35 * WIDTHFIT);
        make.right.equalTo(-35 * WIDTHFIT);
        make.height.equalTo(44 * HEIGHTFIT);
    }];
}
//提现金额
- (void)acquiringMoney:(NSString *)string
{
    
}
//姓名
- (void)acquiringName:(NSString *)string
{
    
}
//支付宝账户
- (void)acquiringAccount:(NSString *)string
{
    
}
//获取手机号
- (void)acquiringPhone:(NSString *)string
{
    
}
//获取验证码
- (void)acquiringCode:(NSString *)string
{
    
}
//验证码按钮
- (void)didButtonOpen
{
    
}
//提现按钮
- (void)didButtonBoot:(UIButton *)sender
{
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (void)didLeftBarButton:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didRightButton:(UIBarButtonItem *)sender
{
    RecordViewController * recVC = [[RecordViewController alloc] init];
    [self.navigationController pushViewController:recVC animated:YES];
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
