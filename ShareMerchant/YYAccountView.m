//
//  YYAccountView.m
//  ShareMerchant
//
//  Created by apple on 2017/9/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "YYAccountView.h"

@implementation YYAccountView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 10;
        UILabel * label = [UILabel StringWithFont:NAM_TITLE_B WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        label.text = @"提现金额";
        label.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label];
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(15 * HEIGHTFIT);
            make.left.equalTo(10 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(80 * WIDTHFIT, 16 * HEIGHTFIT));
        }];
        
        UILabel * label1 = [UILabel StringWithFont:NAM_TITLE_B WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        label1.text = @"(元)";
        label1.textAlignment = NSTextAlignmentRight;
        [self addSubview:label1];
        [label1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(15 * HEIGHTFIT);
            make.right.equalTo(-10 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(30 * WIDTHFIT, 16 * HEIGHTFIT));
        }];
        
        self.moneyTextField = [[UITextField alloc] init];
        self.moneyTextField.textColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
        self.moneyTextField.font = NAM_TITLE;
        self.moneyTextField.keyboardType = UIKeyboardTypePhonePad;
        self.moneyTextField.delegate = self;
        [self addSubview:_moneyTextField];
        [_moneyTextField makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(14 * HEIGHTFIT);
            make.left.equalTo(label.right).offset(22 * WIDTHFIT);
            make.right.equalTo(label1.left);
        }];
        
        UIView * line = [UIView lineWithView];
        [self addSubview:line];
        [line makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label.bottom).offset(15 * HEIGHTFIT);
            make.left.equalTo(0);
            make.right.equalTo(0);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];
        
        UILabel * label3 = [UILabel StringWithFont:NAM_TITLE_B WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        label3.text = @"姓名";
        label3.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label3];
        [label3 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line.bottom).offset(15 * HEIGHTFIT);
            make.left.equalTo(10 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(80 * WIDTHFIT, 16 * HEIGHTFIT));
        }];
        
        self.nameTextField = [[UITextField alloc] init];
        self.nameTextField.textColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
        self.nameTextField.font = NAM_TITLE;
        self.nameTextField.keyboardType = UIKeyboardTypeDefault;
        self.nameTextField.delegate = self;
        [self addSubview:_nameTextField];
        [_nameTextField makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line.bottom).offset(14 * HEIGHTFIT);
            make.left.equalTo(label3.right).offset(22 * WIDTHFIT);
            make.right.equalTo(-10 * WIDTHFIT);
        }];

        UIView * line1 = [UIView lineWithView];
        [self addSubview:line1];
        [line1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label3.bottom).offset(15 * HEIGHTFIT);
            make.left.equalTo(0);
            make.right.equalTo(0);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];
        
        UILabel * label2 = [UILabel StringWithFont:NAM_TITLE_B WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        label2.text = @"支付宝账户";
        label2.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label2];
        [label2 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line1.bottom).offset(15 * HEIGHTFIT);
            make.left.equalTo(10 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(80 * WIDTHFIT, 16 * HEIGHTFIT));
        }];
        
        self.accountTextField = [[UITextField alloc] init];
        self.accountTextField.textColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
        self.accountTextField.font = NAM_TITLE;
        self.accountTextField.delegate = self;
        self.accountTextField.keyboardType = UIKeyboardTypeDefault;
        [self addSubview:_accountTextField];
        [_accountTextField makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line1.bottom).offset(14 * HEIGHTFIT);
            make.left.equalTo(label2.right).offset(22 * WIDTHFIT);
            make.right.equalTo(-10 * WIDTHFIT);
        }];
        
        
    }
    return self;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.moneyTextField == textField) {
        if ([self.delegate respondsToSelector:@selector(acquiringMoney:)]) {
            [self.delegate acquiringMoney:textField.text];
        }
    }
    if (self.accountTextField == textField) {
        if ([self.delegate respondsToSelector:@selector(acquiringAccount:)]) {
            [self.delegate acquiringAccount:textField.text];
        }
    }
    if (self.nameTextField == textField) {
        if ([self.delegate respondsToSelector:@selector(acquiringName:)]) {
            [self.delegate acquiringName:textField.text];
        }
    }
}
@end
