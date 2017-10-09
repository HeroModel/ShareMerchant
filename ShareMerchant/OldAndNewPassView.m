//
//  OldAndNewPassView.m
//  ShareMerchant
//
//  Created by apple on 2017/9/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "OldAndNewPassView.h"

@implementation OldAndNewPassView
- (instancetype)init
{
    self = [super init];
    if (self) {
        UIView * view = [[UIView alloc] init];
        view.backgroundColor = [UIColor whiteColor];
        view.layer.masksToBounds = YES;
        view.layer.cornerRadius = 10;
        [self addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.and.bottom.and.right.equalTo(0);
        }];
        
        self.oldTextField = [[UITextField alloc] init];
        self.oldTextField.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
        self.oldTextField.font = NAM_TITLE_B;
        self.oldTextField.delegate = self;
        [view addSubview:_oldTextField];
        [_oldTextField makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(15 * HEIGHTFIT);
            make.left.equalTo(10 * WIDTHFIT);
            make.right.equalTo(-10 * WIDTHFIT);
            make.height.equalTo(16 * HEIGHTFIT);
        }];
        
        UIView * line = [UIView lineWithView];
        [view addSubview:line];
        [line makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_oldTextField.bottom).offset(15 * HEIGHTFIT);
            make.left.and.right.equalTo(_oldTextField);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];
        
        self.newsTextField = [[UITextField alloc] init];
        self.newsTextField.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
        self.newsTextField.font = NAM_TITLE_B;
        self.newsTextField.delegate = self;
        [view addSubview:_newsTextField];
        [_newsTextField makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line.bottom).offset(15 * HEIGHTFIT);
            make.left.equalTo(10 * WIDTHFIT);
            make.right.equalTo(-10 * WIDTHFIT);
            make.height.equalTo(16 * HEIGHTFIT);
        }];
    }
    return self;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.oldTextField == textField) {
        if ([self.delegate respondsToSelector:@selector(editOldText:)]) {
            [self.delegate editOldText:textField.text];
        }
    }
    if (self.newsTextField == textField) {
        if ([self.delegate respondsToSelector:@selector(editNewsText:)]) {
            [self.delegate editNewsText:textField.text];
        }
    }
}
@end
