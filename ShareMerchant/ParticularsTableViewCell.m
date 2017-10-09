//
//  ParticularsTableViewCell.m
//  ShareMerchant
//
//  Created by apple on 2017/9/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ParticularsTableViewCell.h"

@implementation ParticularsTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.leftLabel = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_PAGE_COLOR)];
        self.leftLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_leftLabel];
        
        self.rightLabel = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        self.rightLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_rightLabel];
        
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
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_leftLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(24.5 * HEIGHTFIT);
        make.left.equalTo(30 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(100 * WIDTHFIT, 18 * HEIGHTFIT));
    }];
    [_rightLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(24.5 * HEIGHTFIT);
        make.right.equalTo(-30 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(100 * WIDTHFIT, 18 * HEIGHTFIT));
    }];
}
@end
