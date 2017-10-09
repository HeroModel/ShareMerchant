//
//  ParticularsViewController.m
//  ShareMerchant
//
//  Created by apple on 2017/9/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ParticularsViewController.h"
#import "ParticularsTableViewCell.h"

@interface ParticularsViewController ()<UITableViewDelegate, UITableViewDataSource>
/** <#注释#> */
@property(nonatomic, strong) UITableView * tableView;
@end
static NSString * const ParticularsCell = @"ParticularsTableViewCell";
@implementation ParticularsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"提现详情";
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didLeftBarButton:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    [self createTableView];
    [self createHeader];
}
- (void)createTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.rowHeight = 63 * HEIGHTFIT;
    _tableView.delegate = self;
    _tableView.dataSource = self;
#ifdef __IPHONE_11_0
    if ([_tableView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
    }
#endif
    [self.view addSubview:_tableView];
    [_tableView registerClass:[ParticularsTableViewCell class] forCellReuseIdentifier:ParticularsCell];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            ParticularsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ParticularsCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.leftLabel.text = @"支付宝账户";
            cell.rightLabel.text = @"13512345678";
            return cell;
        }
            break;
        case 1:
        {
            ParticularsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ParticularsCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.leftLabel.text = @"创建时间";
            cell.rightLabel.text = @"2017-09-09";
            return cell;
        }
            break;
        case 2:
        {
            ParticularsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ParticularsCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.leftLabel.text = @"订单号";
            cell.rightLabel.text = @"13512345678";
            return cell;
        }
            break;
        default:
            break;
    }
    return nil;
}
- (void)createHeader
{
    UIView * back = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 90 * HEIGHTFIT)];
    back.backgroundColor = [UIColor whiteColor];
    
    UILabel * label = [UILabel StringWithFont:NUMBER_TITLE WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
    label.text = @"-1280.00";
    label.textAlignment = NSTextAlignmentCenter;
    [back addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(30 * HEIGHTFIT);
        make.centerX.equalTo(back);
        make.size.equalTo(CGSizeMake(200 * WIDTHFIT, 24 * HEIGHTFIT));
    }];
    
    UILabel * label1 = [UILabel StringWithFont:TIMER_TITLE_FONT WithTextColor:UIColorFromRGB(GLOBAL_SIGN_COLOR)];
    label1.text = @"提现成功";
    label1.textAlignment = NSTextAlignmentCenter;
    [back addSubview:label1];
    [label1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.bottom).offset(10 * HEIGHTFIT);
        make.centerX.equalTo(back);
        make.size.equalTo(CGSizeMake(100 * WIDTHFIT, 11 * HEIGHTFIT));
    }];
   
    self.tableView.tableHeaderView = back;
    
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
