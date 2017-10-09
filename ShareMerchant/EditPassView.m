//
//  EditPassView.m
//  ShareMerchant
//
//  Created by apple on 2017/9/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "EditPassView.h"

@implementation EditPassView

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
        
        self.textField = [[UITextField alloc] init];
        self.textField.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
        self.textField.font = NAM_TITLE_B;
        self.textField.delegate = self;
        [view addSubview:_textField];
        [_textField makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(15 * HEIGHTFIT);
            make.left.equalTo(10 * WIDTHFIT);
            make.right.equalTo(-10 * WIDTHFIT);
            make.height.equalTo(16 * HEIGHTFIT);
        }];
        
        
    }
    return self;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([self.delegate respondsToSelector:@selector(editTextString:)]) {
        [self.delegate editTextString:textField.text];
    }
}
@end
