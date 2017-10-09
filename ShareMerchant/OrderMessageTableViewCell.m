//
//  OrderMessageTableViewCell.m
//  ShareMerchant
//
//  Created by mac on 2017/9/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "OrderMessageTableViewCell.h"

@interface OrderMessageTableViewCell ()
/** <#注释#> */
@property (nonatomic, strong) UIView *view;
@end
@implementation OrderMessageTableViewCell

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
        
        self.label1 = [UILabel StringWithFont:NAM_TITLE_B WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        self.label1.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_label1];
        [_label1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_view.bottom).offset(14 * HEIGHTFIT);
            make.left.equalTo(200 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(110 * WIDTHFIT, 16 * HEIGHTFIT));
        }];
        
    }
    return self;
}
- (void)setIsHidden:(BOOL)isHidden
{
    if (_isHidden != isHidden) {
        _isHidden = isHidden;
    }
    if (_isHidden) {
        self.view.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
    }
    else{
        self.view.backgroundColor = [UIColor whiteColor];
    }
}


@end
