//
//  TeamAddressTableViewCell.m
//  ShareMerchant
//
//  Created by mac on 2017/9/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "TeamAddressTableViewCell.h"
@interface TeamAddressTableViewCell ()
/** <#注释#> */
@property (nonatomic, strong) UIView *view;
@end
@implementation TeamAddressTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.view = [[UIView alloc] init];
        self.view.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
        [self.contentView addSubview:_view];
        [_view makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0);
            make.left.equalTo(10 * WIDTHFIT);
            make.right.equalTo(-10 * WIDTHFIT);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];
        
        self.label = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_PAGE_COLOR)];
        self.label.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_label];
        [_label makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_view.bottom).offset(15 * HEIGHTFIT);
            make.left.equalTo(20 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(70 * WIDTHFIT, 14 * HEIGHTFIT));
        }];

        self.label1 = [[UITextView alloc] init];
        self.label1.bounces = NO;
        self.label1.font = NAM_TITLE_B;
        self.label1.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
        self.label1.userInteractionEnabled = NO;
        self.label1.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_label1];
        [_label1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_view.bottom).offset(5 * HEIGHTFIT);
            make.left.equalTo(162 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(155 * WIDTHFIT, 50 * HEIGHTFIT));
        }];
        
    }
    return self;
}
@end
