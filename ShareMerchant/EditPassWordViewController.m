//
//  EditPassWordViewController.m
//  ShareMerchant
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "EditPassWordViewController.h"
#import "EditPassView.h"
#import "OldAndNewPassView.h"
#import "AlertView.h"

@interface EditPassWordViewController ()
<
EditPassViewDelegate,
OldAndNewPassViewDelegate
>
@end

@implementation EditPassWordViewController
{
    AlertView *aler;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"修改密码";
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didLeftBarButton:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    [self createView];
}
- (void)createView
{
    CALayer * layer = [CALayer layer];
    layer.frame = CGRectMake(35 * WIDTHFIT, 30 * HEIGHTFIT, 305 * WIDTHFIT, 46 * HEIGHTFIT);
    layer.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowOpacity = 0.5;
    layer.cornerRadius = 10.0f;
    [self.view.layer addSublayer:layer];
    
    EditPassView * editPass = [[EditPassView alloc] init];
    editPass.textField.placeholder = @"用户名";
    editPass.textField.textAlignment = NSTextAlignmentLeft;
    editPass.textField.keyboardType = UIKeyboardTypeDefault;
    editPass.delegate = self;
    [self.view addSubview:editPass];
    [editPass makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(30 * HEIGHTFIT);
        make.left.equalTo(35 * WIDTHFIT);
        make.right.equalTo(-35 * WIDTHFIT);
        make.height.equalTo(46 * HEIGHTFIT);
    }];
    
    CALayer * layer1 = [CALayer layer];
    layer1.frame = CGRectMake(35 * WIDTHFIT, 96 * HEIGHTFIT, 305 * WIDTHFIT, 92 * HEIGHTFIT);
    layer1.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
    layer1.shadowOffset = CGSizeMake(0, 0);
    layer1.shadowOpacity = 0.5;
    layer1.cornerRadius = 10.0f;
    [self.view.layer addSublayer:layer1];
    
    OldAndNewPassView * olwAndNews = [[OldAndNewPassView alloc] init];
    olwAndNews.oldTextField.placeholder = @"原密码";
    olwAndNews.oldTextField.textAlignment = NSTextAlignmentLeft;
    olwAndNews.oldTextField.keyboardType = UIKeyboardTypeDefault;
    olwAndNews.oldTextField.secureTextEntry = YES;
    olwAndNews.newsTextField.placeholder = @"新密码";
    olwAndNews.newsTextField.textAlignment = NSTextAlignmentLeft;
    olwAndNews.newsTextField.keyboardType = UIKeyboardTypeDefault;
    olwAndNews.newsTextField.secureTextEntry = YES;
    olwAndNews.delegate = self;
    [self.view addSubview:olwAndNews];
    [olwAndNews makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(editPass.bottom).offset(20 * HEIGHTFIT);
        make.left.equalTo(35 * WIDTHFIT);
        make.right.equalTo(-35 * WIDTHFIT);
        make.height.equalTo(92 * HEIGHTFIT);
    }];
    
    UIButton * button = [UIButton TextStringStlyWithType:UIButtonTypeCustom WithString:@"确 定" WithBackgroundColor:UIColorFromRGB(BLACK_COLOR) WithTextColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) WithFont:NAM_TITLE_B target:self action:@selector(didEnsureButton:)];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 21;
    [self.view addSubview:button];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(35 * WIDTHFIT);
        make.bottom.equalTo(-315 * HEIGHTFIT);
        make.right.equalTo(-35 * WIDTHFIT);
        make.height.equalTo(45 * HEIGHTFIT);
    }];
    
    
    aler = [[AlertView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
}
//新密码
- (void)editNewsText:(NSString *)string
{
    
}
//原密码
- (void)editOldText:(NSString *)string
{
    
}
//用户名
- (void)editTextString:(NSString *)string
{
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
//确定按钮
- (void)didEnsureButton:(UIButton *)sender
{
    
    [aler show];
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
