//
//  TeamTableViewCell.m
//  ShareMerchant
//
//  Created by apple on 2017/9/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "TeamTableViewCell.h"

@implementation TeamTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CALayer * layer = [CALayer layer];
        layer.frame = CGRectMake(30 * WIDTHFIT, 10 * HEIGHTFIT, 315 * WIDTHFIT, 46 * HEIGHTFIT);
        layer.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
        layer.shadowOffset = CGSizeMake(0, 0);
        layer.shadowOpacity = 0.5;
        layer.cornerRadius = 10.0f;
        [self.contentView.layer addSublayer:layer];
        
        UIView * back = [[UIView alloc] init];
        back.backgroundColor = [UIColor whiteColor];
        back.layer.masksToBounds = YES;
        back.layer.cornerRadius = 10;
        [self.contentView addSubview:back];
        [back makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(10 * HEIGHTFIT);
            make.left.equalTo(30 * WIDTHFIT);
            make.right.equalTo(-30 * WIDTHFIT);
            make.height.equalTo(46 * HEIGHTFIT);
        }];
        
        UILabel * label = [UILabel StringWithFont:NAM_TITLE_B WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        label.text = @"张琳琳";
        label.textAlignment = NSTextAlignmentLeft;
        [back addSubview:label];
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(15 * HEIGHTFIT);
            make.left.equalTo(10 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(80 * WIDTHFIT, 16 * HEIGHTFIT));
        }];
        
        UILabel * label1 = [UILabel StringWithFont:NAM_TITLE_B WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        label1.text = @"13212345678";
        label1.textAlignment = NSTextAlignmentRight;
        [back addSubview:label1];
        [label1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(15 * HEIGHTFIT);
            make.right.equalTo(-10 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(130 * WIDTHFIT, 16 * HEIGHTFIT));
        }];
    }
    return self;
}

@end
