//
//  TeamMessageViewController.m
//  ShareMerchant
//
//  Created by mac on 2017/9/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "TeamMessageViewController.h"
#import "IfDoneViewController.h"
#import "TeamMessageTableViewCell.h"
#import "ResetAlertView.h"
#import "SucceedAlertView.h"

@interface TeamMessageViewController ()<UITableViewDelegate, UITableViewDataSource,TeamMessageTableViewCellDelegate, ResetAlertViewDelegate>

@end
static NSString * const TeamMessageCell = @"TeamMessageTableViewCell";
@implementation TeamMessageViewController
{
    ResetAlertView * reset;
    SucceedAlertView * succeed;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"团员信息";
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didLeftBarButton:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIButton * button = [UIButton TextStringStlyWithType:UIButtonTypeCustom WithString:@"重置密码" WithBackgroundColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) WithTextColor:UIColorFromRGB(GLOBAL_PAGE_COLOR) WithFont:NAM_TITLE target:self action:@selector(didRightButton:)];
    button.frame = CGRectMake((SCREEN_WIDTH - 60) * WIDTHFIT, 10 * HEIGHTFIT, 60 * WIDTHFIT, 20 * HEIGHTFIT);
    UIBarButtonItem * right = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = right;
    reset = [[ResetAlertView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    reset.delegate = self;
    succeed = [[SucceedAlertView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self createTable];
}
- (void)createTable
{
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
    tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.delegate = self;
    tableView.dataSource = self;
#ifdef __IPHONE_11_0
    if ([tableView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
        if (@available(iOS 11.0, *)) {
            tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
    }
#endif
    [self.view addSubview:tableView];
    [tableView registerClass:[TeamMessageTableViewCell class] forCellReuseIdentifier:TeamMessageCell];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TeamMessageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:TeamMessageCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 249 * HEIGHTFIT;
}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    IfDoneViewController * ifVC = [[IfDoneViewController alloc] init];
//    [self.navigationController pushViewController:ifVC animated:YES];
//}
#pragma mark --- 点击成交订单按钮(不好用,待修改)
- (void)didTableViewCelleIndex:(NSInteger)index
{
    IfDoneViewController * ifVC = [[IfDoneViewController alloc] init];
    [self.navigationController pushViewController:ifVC animated:YES];
}
- (void)didLeftBarButton:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didRightButton:(UIBarButtonItem *)sender
{
    [reset show];
}
- (void)didButtonSucceedShow
{
    [reset dismiss];
    [succeed SucceedShow];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
