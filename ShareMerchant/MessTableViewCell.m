//
//  MessTableViewCell.m
//  ShareMerchant
//
//  Created by apple on 2017/9/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MessTableViewCell.h"

@implementation MessTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView * image = [[UIImageView alloc] init];
        image.image = [UIImage imageNamed:@"icon-message"];
        image.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:image];
        [image makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(20 * HEIGHTFIT);
            make.left.equalTo(20 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(44 * WIDTHFIT, 44 * WIDTHFIT));
        }];
        
        UILabel * label = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        label.text = @"系统消息";
        label.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:label];
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(25 * HEIGHTFIT);
            make.left.equalTo(image.right).offset(10 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(100 * WIDTHFIT, 14 * HEIGHTFIT));
        }];
        
        UILabel * label1 = [UILabel StringWithFont:NAME_TIT_FONT WithTextColor:UIColorFromRGB(GLOBAL_SIGN_COLOR)];
        label1.text = @"HI，我们又见面了！";
        label1.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:label1];
        [label1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label.bottom).offset(10 * HEIGHTFIT);
            make.left.equalTo(image.right).offset(10 * WIDTHFIT);
            make.right.equalTo(-74 * WIDTHFIT);
            make.height.equalTo(12 * HEIGHTFIT);
        }];
        
        UILabel * label2 = [UILabel StringWithFont:TIMER_TITLE_FONT WithTextColor:UIColorFromRGB(GLOBAL_SIGN_COLOR)];
        label2.text = @"7-27";
        label2.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:label2];
        [label2 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(25 * HEIGHTFIT);
            make.right.equalTo(-20 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(70 * WIDTHFIT, 11 * HEIGHTFIT));
        }];
        
        UIView * line = [UIView lineWithView];
        [self.contentView addSubview:line];
        [line makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(74 * WIDTHFIT);
            make.right.equalTo(-20 * WIDTHFIT);
            make.bottom.equalTo(0);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];
    }
    return self;
}

@end
