//
//  ImageAndLabelCollectionViewCell.m
//  ShareMerchant
//
//  Created by apple on 2017/9/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ImageAndLabelCollectionViewCell.h"

@implementation ImageAndLabelCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [[UIImageView alloc] init];
        self.image.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:_image];
        
        self.label = [UILabel StringWithFont:NAV_TITLE_N WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        self.label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_label];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_image makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(13 * HEIGHTFIT);
        make.centerX.equalTo(self.contentView);
        make.size.equalTo(CGSizeMake(40 * WIDTHFIT, 40 * HEIGHTFIT));
    }];
    
    [_label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_image.bottom).offset(10 * HEIGHTFIT);
        make.centerX.equalTo(self.contentView);
        make.size.equalTo(CGSizeMake(100 * WIDTHFIT, 18 * HEIGHTFIT));
    }];
}
@end
