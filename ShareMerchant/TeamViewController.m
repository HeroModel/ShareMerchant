//
//  TeamViewController.m
//  ShareMerchant
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "TeamViewController.h"
#import "TeamMessageViewController.h"
#import "TeamTableViewCell.h"
#import "TeamMultistageTableViewCell.h"

@interface TeamViewController ()<UITableViewDelegate, UITableViewDataSource, TeamMultistageTableViewCellDelegate>

@end
static NSString * const TeamCell = @"TeamTableViewCell";
static NSString * const TeamMultistageCell = @"TeamMultistageTableViewCell";
@implementation TeamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"团队";
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didLeftBarButton:)];
    self.navigationItem.leftBarButtonItem = leftButton;
//    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-mesage"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didRightBarButton:)];
//    self.navigationItem.rightBarButtonItem = rightButton;
    [self createTableView];
}
- (void)createTableView
{

    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 70) style:UITableViewStylePlain];
//    tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    tableView.bounces = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.scrollEnabled = NO;
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
    [tableView registerClass:[TeamTableViewCell class] forCellReuseIdentifier:TeamCell];
    [tableView registerClass:[TeamMultistageTableViewCell class] forCellReuseIdentifier:TeamMultistageCell];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 1;
            break;
        default:
            break;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            TeamTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:TeamCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;
        case 1:
        {
            TeamMultistageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:TeamMultistageCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.delegate = self;
            return cell;
        }
            break;
        default:
            break;
    }
    return nil;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
        {
            NSString * string = @"一代经销";
            return string;
        }
            break;
        case 1:
        {
            NSString * string = @"二代经销";
            return string;
        }
            break;
        default:
            break;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return 66 * HEIGHTFIT;
            break;
        case 1:
            return 470 * HEIGHTFIT;
            break;
        default:
            break;
    }
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TeamMessageViewController * teamVC = [[TeamMessageViewController alloc] init];
    [self.navigationController pushViewController:teamVC animated:YES];
}
- (void)didSeledTableViewCell:(NSInteger)index
{
    TeamMessageViewController * teamVC = [[TeamMessageViewController alloc] init];
    [self.navigationController pushViewController:teamVC animated:YES];
}
- (void)didLeftBarButton:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didRightBarButton:(UIBarButtonItem *)sender
{
    
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
