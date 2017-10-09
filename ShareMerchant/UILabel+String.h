//
//  UILabel+String.h
//  ShareMerchant
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (String)
@property (nonatomic,copy) UIFont *appearanceFont UI_APPEARANCE_SELECTOR;
+ (instancetype)StringWithFont:(UIFont *)font
                 WithTextColor:(UIColor *)textColor;
@end
