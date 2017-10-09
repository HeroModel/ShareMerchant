//
//  SucceedAlertView.m
//  ShareMerchant
//
//  Created by apple on 2017/9/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "SucceedAlertView.h"

@implementation SucceedAlertView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didViewDismiss:)];
        [self addGestureRecognizer:tap];
        UIView * view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        view.userInteractionEnabled = YES;
        view.layer.masksToBounds = YES;
        view.layer.cornerRadius = 5;
        [self addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.size.equalTo(CGSizeMake(255 * WIDTHFIT, 147 * HEIGHTFIT));
        }];
        
        UIButton * button = [UIButton ImageButtonWithType:UIButtonTypeCustom WithString:@"btn-choose-yes" target:self action:nil];
        button.userInteractionEnabled = NO;
        [view addSubview:button];
        [button makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(34 * HEIGHTFIT);
            make.left.equalTo(65 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(28 * WIDTHFIT, 28 * HEIGHTFIT));
        }];
        
        UILabel * label = [UILabel StringWithFont:NAM_TITLE_FONT_M WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        label.text = @"重置成功!";
        label.textAlignment = NSTextAlignmentLeft;
        [view addSubview:label];
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(40 * HEIGHTFIT);
            make.left.equalTo(button.right).offset(10 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(120 * WIDTHFIT, 20 * HEIGHTFIT));
        }];
        
        UIButton * button1 = [UIButton TextStringStlyWithType:UIButtonTypeCustom WithString:@"初始密码123456" WithBackgroundColor:UIColorFromRGB(GR_COLOR) WithTextColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) WithFont:NAM_TITLE target:self action:nil];
        button1.layer.masksToBounds = YES;
        button1.layer.cornerRadius = 16;
        button1.userInteractionEnabled = NO;
        [view addSubview:button1];
        [button1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(button.bottom).offset(20 * HEIGHTFIT);
            make.left.equalTo(60 * WIDTHFIT);
            make.right.equalTo(-60 * WIDTHFIT);
            make.height.equalTo(32 * HEIGHTFIT);
        }];
    }
    return self;
}
- (void)didViewDismiss:(UITapGestureRecognizer *)tap
{
    [self dismiss];
}
- (void)SucceedShow
{
    [[[[UIApplication sharedApplication] delegate] window] addSubview:self];
}
- (void)dismiss
{
    [self removeFromSuperview];
}
@end
