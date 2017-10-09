//
//  ResetAlertView.m
//  ShareMerchant
//
//  Created by apple on 2017/9/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ResetAlertView.h"

@implementation ResetAlertView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        
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
        
        UILabel * label = [UILabel StringWithFont:NAM_TITLE_FONT_M WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        label.text = @"是否重置密码?";
        label.textAlignment = NSTextAlignmentCenter;
        [view addSubview:label];
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(40 * HEIGHTFIT);
            make.left.equalTo(59 * WIDTHFIT);
            make.right.equalTo(-59 * WIDTHFIT);
            make.height.equalTo(20 * HEIGHTFIT);
        }];
        
        UIView * line = [UIView lineWithView];
        [view addSubview:line];
        [line makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label.bottom).offset(40 * HEIGHTFIT);
            make.left.and.right.equalTo(0);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];
        
        UIButton * button = [UIButton TextStringStlyWithType:UIButtonTypeCustom WithString:@"取消" WithBackgroundColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) WithTextColor:UIColorFromRGB(GLOBAL_SIGN_COLOR) WithFont:NAM_TITLE_B target:self action:@selector(didLeftButton:)];
        [view addSubview:button];
        [button makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line.bottom).offset(0);
            make.left.equalTo(0);
            make.bottom.equalTo(0);
            make.width.equalTo((255 / 2 - 0.25) * WIDTHFIT);
        }];
        
        UIView * line1 = [UIView lineWithView];
        [view addSubview:line1];
        [line1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line.bottom).offset(0);
            make.left.equalTo(button.right).offset(0);
            make.bottom.equalTo(0);
            make.width.equalTo(0.5 * HEIGHTFIT);
            
        }];
        
        UIButton * button1 = [UIButton TextStringStlyWithType:UIButtonTypeCustom WithString:@"确定" WithBackgroundColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) WithTextColor:UIColorFromRGB(BLACK_COLOR) WithFont:NAM_TITLE_B target:self action:@selector(didRightButton:)];
        [view addSubview:button1];
        [button1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line.bottom).offset(0);
            make.left.equalTo(line1.right).offset(0);
            make.bottom.equalTo(0);
            make.right.equalTo(0);
        }];
    }
    return self;
}
- (void)didLeftButton:(UIButton *)sender
{
    [self dismiss];
}
- (void)didRightButton:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(didButtonSucceedShow)]) {
        [self.delegate didButtonSucceedShow];
    }
}
- (void)show
{
    [[[[UIApplication sharedApplication] delegate] window] addSubview:self];
}
- (void)dismiss
{
    [self removeFromSuperview];
}
@end
