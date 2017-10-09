//
//  NewsDetailsTableViewCell.m
//  ShareMerchant
//
//  Created by apple on 2017/9/13.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "NewsDetailsTableViewCell.h"

@implementation NewsDetailsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel * label = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_SIGN_COLOR)];
        label.text = @"13:56";
        label.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:label];
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(20 * HEIGHTFIT);
            make.centerX.equalTo(self.contentView);
            make.size.equalTo(CGSizeMake(40 * WIDTHFIT, 14 * HEIGHTFIT));
        }];
        
        UIImageView * image1 = [[UIImageView alloc] init];
        image1.image = [UIImage imageNamed:@"icon-message"];
        image1.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:image1];
        [image1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(44 * HEIGHTFIT);
            make.left.equalTo(20 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(44 * WIDTHFIT, 44 * HEIGHTFIT));
        }];
        
        UIImageView * image2 = [[UIImageView alloc] init];
        image2.image = [UIImage imageNamed:@"dialog"];
        image2.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:image2];
        [image2 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label.bottom).offset(10 * HEIGHTFIT);
            make.left.equalTo(image1.right).offset(10 * WIDTHFIT);
            make.width.equalTo(271 * WIDTHFIT);
//            make.height.equalTo([self heightForString:_textView andWidth:241 * WIDTHFIT]);
            make.size.equalTo(CGSizeMake(271 * WIDTHFIT, 140 * HEIGHTFIT));
        }];
        
        self.textView = [[UITextView alloc] init];
        _textView.text = @"我想参加活动！我想参加活动！我想参加活动！我想参加活动！我想参加活动！我想参加活动！我想参加活动！我想参加活动！我想参加活动！";
        _textView.font = NAM_TITLE_B;
        _textView.userInteractionEnabled = NO;
        _textView.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
        _textView.textAlignment = NSTextAlignmentCenter;
        [image2 addSubview:_textView];
        [_textView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0);
            make.left.equalTo(20 * WIDTHFIT);
            make.right.equalTo(-15 * WIDTHFIT);
            make.height.equalTo([self heightForString:_textView andWidth:241 * WIDTHFIT]);
        }];
    }
    return self;
}
/**
 @method 获取指定宽度width的字符串在UITextView上的高度
 @param textView 待计算的UITextView
 @param width 限制字符串显示区域的宽度
 @result float 返回的高度
 */
- (float) heightForString:(UITextView *)textView andWidth:(float)width{
    CGSize sizeToFit = [textView sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return sizeToFit.height;
}

@end
