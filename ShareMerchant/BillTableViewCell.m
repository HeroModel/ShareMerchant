//
//  BillTableViewCell.m
//  ShareMerchant
//
//  Created by mac on 2017/9/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BillTableViewCell.h"

@implementation BillTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel * label = [UILabel StringWithFont:TIMER_TITLE_FONT WithTextColor:UIColorFromRGB(GLOBAL_SIGN_COLOR)];
        label.text = @"星期四";
        label.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:label];
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(20 * HEIGHTFIT);
            make.left.equalTo(20 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(50 * WIDTHFIT, 11 * HEIGHTFIT));
        }];
        
        UILabel * label1 = [UILabel StringWithFont:TIMER_TITLE_FONT WithTextColor:UIColorFromRGB(GLOBAL_SIGN_COLOR)];
        label1.text = @"07-22";
        label1.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:label1];
        [label1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label.bottom).offset(10 * HEIGHTFIT);
            make.left.equalTo(20 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(50 * WIDTHFIT, 11 * HEIGHTFIT));
        }];
        
        UIImageView * image = [[UIImageView alloc] init];
        image.image = [UIImage imageNamed:@"header-1"];
        image.contentMode = UIViewContentModeScaleToFill;
        image.layer.masksToBounds = YES;
        image.layer.cornerRadius = 23;
        [self.contentView addSubview:image];
        [image makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(9 * HEIGHTFIT);
            make.left.equalTo(label1.right).offset(18 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(46 * WIDTHFIT, 46 * HEIGHTFIT));
        }];
        
        UILabel * label2 = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        label2.text = @"+212.12";
        label2.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:label2];
        [label2 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(15 * HEIGHTFIT);
            make.left.equalTo(image.right).offset(20 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(50 * WIDTHFIT, 11 * HEIGHTFIT));
        }];
        
        UILabel * label3 = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        label3.text = @"租赁成功,订单号 - 1590";
        label3.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:label3];
        [label3 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label2.bottom).offset(10 * HEIGHTFIT);
            make.left.equalTo(image.right).offset(20 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(180 * WIDTHFIT, 14 * HEIGHTFIT));
        }];
        
        UIView * line = [UIView lineWithView];
        [self.contentView addSubview:line];
        [line makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(20 * WIDTHFIT);
            make.right.equalTo(-20 * WIDTHFIT);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];
    }
    return self;
}


@end
