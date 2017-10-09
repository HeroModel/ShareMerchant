//
//  TeamMessageTableViewCell.m
//  ShareMerchant
//
//  Created by mac on 2017/9/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "TeamMessageTableViewCell.h"
#import "TeamMinuteTableViewCell.h"
#import "TeamAddressTableViewCell.h"
#import "didSeletedTableViewCell.h"

@interface TeamMessageTableViewCell ()<UITableViewDataSource, UITableViewDelegate>

@end
static NSString * const TeamMinuteCell = @"TeamMinuteTableViewCell";
static NSString * const TeamAddressCell = @"TeamAddressTableViewCell";
static NSString * const didSeletedCell = @"didSeletedTableViewCell";
@implementation TeamMessageTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CALayer * layer = [CALayer layer];
        layer.frame = CGRectMake(20 * WIDTHFIT, 25 * HEIGHTFIT, 335 * WIDTHFIT, 200 * HEIGHTFIT);
        layer.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
        layer.shadowOffset = CGSizeMake(0, 0);
        layer.shadowOpacity = 0.5;
        layer.cornerRadius = 10.0f;
        [self.contentView.layer addSublayer:layer];
        
        UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(20 * WIDTHFIT, 25 * HEIGHTFIT, 335 * WIDTHFIT, 200 * HEIGHTFIT) style:UITableViewStylePlain];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.userInteractionEnabled = YES;
        tableView.bounces = NO;
        tableView.layer.masksToBounds = YES;
        tableView.layer.cornerRadius = 10;
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.contentView addSubview:tableView];
        [tableView registerClass:[TeamMinuteTableViewCell class] forCellReuseIdentifier:TeamMinuteCell];
        [tableView registerClass:[TeamAddressTableViewCell class] forCellReuseIdentifier:TeamAddressCell];
        [tableView registerClass:[didSeletedTableViewCell class] forCellReuseIdentifier:didSeletedCell];
    }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
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
            cell.label.text = @"姓名";
            cell.label1.text = @"张琳琳";
            return cell;
        }
            break;
        case 1:
        {
            TeamMinuteTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:TeamMinuteCell];
            cell.isHidden = YES;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.label.text = @"联系电话";
            cell.label1.text = @"13212345678";
            return cell;
        }
            break;
        case 2:
        {
            TeamAddressTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:TeamAddressCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.label.text = @"联系地址";
            cell.label1.text = @"杭州市西湖区文三路文锦大厦B座905";
            return cell;
        }
            break;
        case 3:
        {
            didSeletedTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:didSeletedCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.label.text = @"成交订单";
            cell.label1.text = @"12单";
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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 3) {
        if ([self.delegate respondsToSelector:@selector(didTableViewCelleIndex:)]) {
            [self.delegate didTableViewCelleIndex:indexPath.row];
        }
    }
    return;
}
@end
