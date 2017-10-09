//
//  HeaderMessageViewController.m
//  ShareMerchant
//
//  Created by apple on 2017/9/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "HeaderMessageViewController.h"
#import "TeamMinuteTableViewCell.h"
#import "TeamAddressTableViewCell.h"
@interface HeaderMessageViewController ()<UITableViewDelegate, UITableViewDataSource>

@end
static NSString * const TeamMinuteCell = @"TeamMinuteTableViewCell";
static NSString * const TeamAddressCell = @"TeamAddressTableViewCell";
@implementation HeaderMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"商家信息";
    self.view.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didLeftBarButton:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    [self create];
}
- (void)create
{
    
    CALayer * layer = [CALayer layer];
    layer.frame = CGRectMake(20 * WIDTHFIT, 25 * HEIGHTFIT, 335 * WIDTHFIT, 200 * HEIGHTFIT);
    layer.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowOpacity = 0.5;
    layer.cornerRadius = 10.0f;
    [self.view.layer addSublayer:layer];
    
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(20 * WIDTHFIT, 25 * HEIGHTFIT, 335 * WIDTHFIT, 200 * HEIGHTFIT) style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.layer.masksToBounds = YES;
    tableView.layer.cornerRadius = 10;
    tableView.bounces = NO;
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
    [tableView registerClass:[TeamMinuteTableViewCell class] forCellReuseIdentifier:TeamMinuteCell];
    [tableView registerClass:[TeamAddressTableViewCell class] forCellReuseIdentifier:TeamAddressCell];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            TeamMinuteTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:TeamMinuteCell];
            cell.isHidden = NO;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.label.text = @"店铺名称";
            cell.label1.text = @"芯维手机维修";
            return cell;
        }
            break;
        case 1:
        {
            TeamMinuteTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:TeamMinuteCell];
            cell.isHidden = YES;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.label.text = @"负责人";
            cell.label1.text = @"白壮壮";
            return cell;
        }
            break;
        case 2:
        {
            TeamAddressTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:TeamAddressCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.label.text = @"店铺地址";
            cell.label1.text = @"杭州市西湖区文三路文锦大厦B座905";
            return cell;
        }
            break;
        case 3:
        {
            TeamMinuteTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:TeamMinuteCell];
            cell.isHidden = YES;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.label.text = @"负责区域";
            cell.label1.text = @"杭州西湖区";
            return cell;
        }
            break;
        default:
            break;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 2) {
        return 69 * HEIGHTFIT;
    }else{
        return 43 * HEIGHTFIT;
    }
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
