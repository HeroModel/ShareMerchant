//
//  MessageViewController.m
//  ShareMerchant
//
//  Created by apple on 2017/9/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MessageViewController.h"
#import "MessTableViewCell.h"
#import "NewsDetailsViewController.h"

@interface MessageViewController ()
<UITableViewDelegate, UITableViewDataSource>
@end
static NSString * const MessCell = @"MessTableViewCell";
@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"消息";
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didLeftBarButton:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    [self createTableView];
}
- (void)createTableView
{
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    tableView.rowHeight = 77 * HEIGHTFIT;
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
    [tableView registerClass:[MessTableViewCell class] forCellReuseIdentifier:MessCell];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MessTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:MessCell];
    cell.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsDetailsViewController * newVC = [[NewsDetailsViewController alloc] init];
    [self.navigationController pushViewController:newVC animated:YES];
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
