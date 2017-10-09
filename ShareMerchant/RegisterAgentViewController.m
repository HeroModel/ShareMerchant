//
//  RegisterAgentViewController.m
//  ShareMerchant
//
//  Created by apple on 2017/9/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "RegisterAgentViewController.h"
#import "ShareRegisterView.h"

@interface RegisterAgentViewController ()

@end

@implementation RegisterAgentViewController
{
    ShareRegisterView * shareView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    self.navigationItem.title = @"注册商家代理账号";
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didLeftBarButton:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    [self createView];
    [shareView.nameTextField becomeFirstResponder];
}
- (void)createView
{
    CALayer * layer = [CALayer layer];
    layer.frame = CGRectMake(20 * WIDTHFIT, 40 * HEIGHTFIT, 335 * WIDTHFIT, 335 * HEIGHTFIT);
    layer.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowOpacity = 0.5;
    layer.cornerRadius = 10.0f;
    [self.view.layer addSublayer:layer];
    
    shareView = [[ShareRegisterView alloc] initWithFrame:CGRectMake(20 * WIDTHFIT, 40 * HEIGHTFIT, 335 * WIDTHFIT, 335 * HEIGHTFIT)];
    shareView.backgroundColor = [UIColor whiteColor];
    shareView.layer.masksToBounds = YES;
    shareView.layer.cornerRadius = 10;
    [self.view addSubview:shareView];
    
    UIButton * button = [UIButton TextStringStlyWithType:UIButtonTypeCustom WithString:@"注 册" WithBackgroundColor:UIColorFromRGB(BLACK_COLOR) WithTextColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) WithFont:NAM_TITLE_B target:self action:@selector(didRegisterButton:)];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 22;
    [self.view addSubview:button];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(shareView.bottom).offset(50 * HEIGHTFIT);
        make.left.equalTo(35 * WIDTHFIT);
        make.right.equalTo(-35 * WIDTHFIT);
        make.height.equalTo(44 * HEIGHTFIT);
    }];
}
- (void)didRegisterButton:(UIButton *)sendr
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
