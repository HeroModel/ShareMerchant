//
//  BillViewController.m
//  ShareMerchant
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BillViewController.h"
#import "BillTableViewCell.h"

@interface BillViewController ()<UITableViewDelegate, UITableViewDataSource>

@end
static NSString * const BillCell = @"BillTableViewCell";
@implementation BillViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"账单";
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didLeftBarButton:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    [self createTableView];
}
- (void)createTableView
{
    UIView * line = [[UIView alloc] init];
    line.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
    line.frame = CGRectMake(0, 0, SCREEN_WIDTH, 10 * HEIGHTFIT);
    [self.view addSubview:line];
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, line.frame.size.height, SCREEN_WIDTH, SCREEN_HEIGHT - 10) style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    tableView.rowHeight = 63;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    [tableView registerClass:[BillTableViewCell class] forCellReuseIdentifier:BillCell];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BillTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:BillCell];
    cell.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
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
