//
//  TeamMultistageTableViewCell.m
//  ShareMerchant
//
//  Created by apple on 2017/9/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "TeamMultistageTableViewCell.h"
#import "MultistageTableViewCell.h"

@interface TeamMultistageTableViewCell ()<UITableViewDelegate, UITableViewDataSource>

@end
static NSString * const MultistageCell = @"MultistageTableViewCell";
@implementation TeamMultistageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CALayer * layer = [CALayer layer];
        layer.frame = CGRectMake(30 * WIDTHFIT, 25 * HEIGHTFIT, 315 * WIDTHFIT, 410 * HEIGHTFIT);
        layer.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
        layer.shadowOffset = CGSizeMake(0, 0);
        layer.shadowOpacity = 0.5;
        layer.cornerRadius = 10.0f;
        [self.contentView.layer addSublayer:layer];
        
        UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(30 * WIDTHFIT, 25 * HEIGHTFIT, 315 * WIDTHFIT, 410 * HEIGHTFIT) style:UITableViewStylePlain];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.showsHorizontalScrollIndicator = NO;
        tableView.rowHeight = 46 * HEIGHTFIT;
        tableView.bounces = NO;
        tableView.layer.masksToBounds = YES;
        tableView.layer.cornerRadius = 10;
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.contentView addSubview:tableView];
        [tableView registerClass:[MultistageTableViewCell class] forCellReuseIdentifier:MultistageCell];
        
    }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MultistageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:MultistageCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0) {
        cell.isSelede = NO;
    }else{
        cell.isSelede = YES;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(didSeledTableViewCell:)]) {
        [self.delegate didSeledTableViewCell:indexPath.row];
    }
}
@end
