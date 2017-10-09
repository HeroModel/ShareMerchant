//
//  YYNamePassWrodView.m
//  ShareMerchant
//
//  Created by apple on 2017/9/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "YYNamePassWrodView.h"

@implementation YYNamePassWrodView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 10;
        self.label = [UILabel StringWithFont:TIMER_TITLE_FONT WithTextColor:UIColorFromRGB(GLOBAL_SIGN_COLOR)];
        self.label.textAlignment = NSTextAlignmentLeft;
        [self addSubview:_label];
        [_label makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(15 * HEIGHTFIT);
            make.left.equalTo(10 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(40 * WIDTHFIT, 11 * HEIGHTFIT));
        }];
        
        UIView * line = [UIView lineWithView];
        [self addSubview:line];
        [line makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(15 * HEIGHTFIT);
            make.left.equalTo(_label.right).offset(10 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(1 * WIDTHFIT, 11 * HEIGHTFIT));
        }];

        
        self.textField = [[UITextField alloc] init];
        self.textField.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
        self.textField.font = TIT_FONT;
        self.textField.delegate = self;
        [self addSubview:_textField];
        [_textField makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(13.5 * HEIGHTFIT);
            make.left.equalTo(line.right).offset(10 * WIDTHFIT);
            make.right.equalTo(-10 * WIDTHFIT);
            make.height.equalTo(13 * HEIGHTFIT);
        }];
        
    }
    return self;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([self.delegate respondsToSelector:@selector(passTextString:)]) {
        [self.delegate passTextString:textField.text];
    }
}
@end
