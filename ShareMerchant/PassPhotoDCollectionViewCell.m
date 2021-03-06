//
//  PassPhotoDCollectionViewCell.m
//  ShareMerchant
//
//  Created by apple on 2017/9/13.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "PassPhotoDCollectionViewCell.h"

@interface PassPhotoDCollectionViewCell ()
/** <#注释#> */
@property(nonatomic, strong) UIImageView * small;
@end
@implementation PassPhotoDCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CALayer * layer1 = [CALayer layer];
        layer1.frame = CGRectMake(7.5 * WIDTHFIT, 7.5 * HEIGHTFIT, 142.5 * WIDTHFIT, 142.5 * HEIGHTFIT);
        layer1.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
        layer1.shadowOffset = CGSizeMake(0, 0);
        layer1.shadowOpacity = 0.5;
        layer1.cornerRadius = 10.0f;
        [self.contentView.layer addSublayer:layer1];
        
        self.strImageView = [[UIImageView alloc] init];
        self.strImageView.backgroundColor = [UIColor whiteColor];
        self.strImageView.layer.masksToBounds = YES;
        self.strImageView.layer.cornerRadius = 10;
        [self.contentView addSubview:_strImageView];
        [_strImageView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(7.5 * HEIGHTFIT);
            make.left.equalTo(7.5 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(142.5 * WIDTHFIT, 142.5 * HEIGHTFIT));
        }];
        
        self.small = [[UIImageView alloc] init];
        self.small.image = [UIImage imageNamed:@"icon_plus"];
        self.small.contentMode = UIViewContentModeScaleToFill;
        [self.strImageView addSubview:_small];
        [_small makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_strImageView);
            make.size.equalTo(CGSizeMake(30 * WIDTHFIT, 30 * HEIGHTFIT));
        }];
        
        self.label = [UILabel StringWithFont:NAME_TIT_FONT WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        self.label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_label];
        [_label makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_strImageView.bottom).offset(10 * HEIGHTFIT);
            make.centerX.equalTo(self.contentView);
            make.size.equalTo(CGSizeMake(100 * WIDTHFIT, 12 * HEIGHTFIT));
        }];
    }
    return self;
}
- (void)setIsSeledPhoto:(BOOL)isSeledPhoto
{
    if (_isSeledPhoto != isSeledPhoto) {
        _isSeledPhoto = isSeledPhoto;
    }
    if (_isSeledPhoto) {
        self.small.hidden = YES;
    }
    else{
        self.small.hidden = NO;
    }
}


@end
