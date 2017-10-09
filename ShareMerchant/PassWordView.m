//
//  PassWordView.m
//  ShareMerchant
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "PassWordView.h"

@interface PassWordView ()
<
UITextFieldDelegate
>

@end
@implementation PassWordView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createView];
    }
    return self;
}
- (void)createView
{
    UIView * view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 10;
    [self addSubview:view];
    [view makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.bottom.and.right.equalTo(0);
    }];
    
    self.image = [[UIImageView alloc] init];
    _image.contentMode = UIViewContentModeScaleToFill;
    [view addSubview:_image];
    [_image makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(9 * HEIGHTFIT);
        make.left.equalTo(15 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(23 * WIDTHFIT, 25 * HEIGHTFIT));
    }];
    
    self.textField = [[UITextField alloc] init];
    _textField.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    _textField.font = NAM_TITLE_B;
    _textField.delegate = self;
    [view addSubview:_textField];
    [_textField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(14 * HEIGHTFIT);
        make.left.equalTo(_image.right).offset(10 * WIDTHFIT);
        make.right.equalTo(-5 * WIDTHFIT);
        make.height.equalTo(16 * HEIGHTFIT);
    }];
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}
@end
