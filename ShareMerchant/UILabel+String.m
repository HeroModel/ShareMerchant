//
//  UILabel+String.m
//  ShareMerchant
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "UILabel+String.h"

@implementation UILabel (String)
+ (instancetype)StringWithFont:(UIFont *)font
                 WithTextColor:(UIColor *)textColor
{
    UILabel * label = [[UILabel alloc] init];
    label.textColor = textColor;
    label.font = font;
    return label;
}
- (void)setAppearanceFont:(UIFont *)appearanceFont
{
    if(appearanceFont)
    {
        [self setFont:appearanceFont];
    }
}

- (UIFont *)appearanceFont
{
    return self.font;
}
@end
