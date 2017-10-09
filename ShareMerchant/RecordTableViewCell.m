//
//  RecordTableViewCell.m
//  ShareMerchant
//
//  Created by apple on 2017/9/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "RecordTableViewCell.h"

@implementation RecordTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel * label = [UILabel StringWithFont:NAV_TITLE_N WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        label.text = @"佣金提现";
        label.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:label];
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(25 * HEIGHTFIT);
            make.left.equalTo(30 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(100 * WIDTHFIT, 18 * HEIGHTFIT));
        }];
        
        UILabel * label1 = [UILabel StringWithFont:TIMER_TITLE_FONT WithTextColor:UIColorFromRGB(GLOBAL_SIGN_COLOR)];
        label1.text = @"2017-09-07";
        label1.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:label1];
        [label1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(15 * HEIGHTFIT);
            make.right.equalTo(-30 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(70 * WIDTHFIT, 11 * HEIGHTFIT));
        }];
        
        UILabel * label2 = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        label2.text = @"-1025.00";
        label2.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:label2];
        [label2 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label1.bottom).offset(10 * HEIGHTFIT);
            make.right.equalTo(-30 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(70 * WIDTHFIT, 14 * HEIGHTFIT));
        }];
        
        UIView * line = [UIView lineWithView];
        [self.contentView addSubview:line];
        [line makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(20 * WIDTHFIT);
            make.right.equalTo(-20 * WIDTHFIT);
            make.bottom.equalTo(self);
            make.height.equalTo(0.5);
        }];
    }
    return self;
}

@end
