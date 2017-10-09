//
//  OrderTableViewCell.m
//  ShareMerchant
//
//  Created by mac on 2017/9/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "OrderTableViewCell.h"
#import "OrderMessageTableViewCell.h"
@interface OrderTableViewCell ()<UITableViewDelegate, UITableViewDataSource>

@end
static NSString * const OrderMessageCell = @"OrderMessageTableViewCell";
@implementation OrderTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CALayer * layer = [CALayer layer];
        layer.frame = CGRectMake(20 * WIDTHFIT, 25 * HEIGHTFIT, 335 * WIDTHFIT, 270 * HEIGHTFIT);
        layer.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
        layer.shadowOffset = CGSizeMake(0, 0);
        layer.shadowOpacity = 0.5;
        layer.cornerRadius = 10.0f;
        [self.contentView.layer addSublayer:layer];
        
        UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(20 * WIDTHFIT, 25 * HEIGHTFIT, 335 * WIDTHFIT, 270 * HEIGHTFIT) style:UITableViewStylePlain];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.rowHeight = 44 * HEIGHTFIT;
        tableView.bounces = NO;
        tableView.layer.masksToBounds = YES;
        tableView.layer.cornerRadius = 10;
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.contentView addSubview:tableView];
        [tableView registerClass:[OrderMessageTableViewCell class] forCellReuseIdentifier:OrderMessageCell];
    }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            OrderMessageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:OrderMessageCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.isHidden = NO;
            cell.label.text = @"用户";
            cell.label1.text = @"王川川";
            return cell;
        }
            break;
        case 1:
        {
            OrderMessageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:OrderMessageCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.isHidden = YES;
            cell.label.text = @"订单号";
            cell.label1.text = @"1280";
            return cell;
        }
            break;
        case 2:
        {
            OrderMessageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:OrderMessageCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.isHidden = YES;
            cell.label.text = @"联系电话";
            cell.label1.text = @"13212345678";
            return cell;
        }
            break;
        case 3:
        {
            OrderMessageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:OrderMessageCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.isHidden = YES;
            cell.label.text = @"订单状态";
            cell.label1.text = @"租赁中";
            return cell;
        }
            break;
        case 4:
        {
            OrderMessageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:OrderMessageCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.isHidden = YES;
            cell.label.text = @"手机型号";
            cell.label1.text = @"iPhone 7";
            return cell;
        }
            break;
        case 5:
        {
            OrderMessageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:OrderMessageCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.isHidden = YES;
            cell.label.text = @"支付金额";
            cell.label1.text = @"1280元";
            return cell;
        }
            break;
        default:
            break;
    }
    
        return nil;
}
@end
