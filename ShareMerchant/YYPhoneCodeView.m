//
//  YYPhoneCodeView.m
//  ShareMerchant
//
//  Created by apple on 2017/9/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "YYPhoneCodeView.h"

@interface YYPhoneCodeView ()
/** <#注释#> */
@property(nonatomic, strong) UIButton * button;
@end
@implementation YYPhoneCodeView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 10;
        
        UILabel * label = [UILabel StringWithFont:NAM_TITLE_B WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        label.text = @"手机号";
        label.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label];
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(15 * HEIGHTFIT);
            make.left.equalTo(10 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(80 * WIDTHFIT, 16 * HEIGHTFIT));
        }];
        
        self.button = [UIButton TextStringStlyWithType:UIButtonTypeCustom WithString:@"获取验证码" WithBackgroundColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) WithTextColor:UIColorFromRGB(BLACK_COLOR) WithFont:NAM_TITLE_B target:self action:@selector(didButtonAcquiringCode:)];
        [self addSubview:_button];
        [_button makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(15 * HEIGHTFIT);
            make.right.equalTo(-10 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(85 * WIDTHFIT, 16 * HEIGHTFIT));
        }];

        self.phoneTextField = [[UITextField alloc] init];
        self.phoneTextField.textColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
        self.phoneTextField.font = NAM_TITLE;
        self.phoneTextField.keyboardType = UIKeyboardTypePhonePad;
        self.phoneTextField.delegate = self;
        [self addSubview:_phoneTextField];
        [_phoneTextField makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(14 * HEIGHTFIT);
            make.left.equalTo(label.right).offset(22 * WIDTHFIT);
            make.right.equalTo(_button.left).offset(-10 * WIDTHFIT);
        }];
        
        UIView * line = [UIView lineWithView];
        [self addSubview:line];
        [line makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label.bottom).offset(15 * HEIGHTFIT);
            make.left.equalTo(0);
            make.right.equalTo(0);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];
        
        UILabel * label2 = [UILabel StringWithFont:NAM_TITLE_B WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        label2.text = @"验证码";
        label2.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label2];
        [label2 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line.bottom).offset(15 * HEIGHTFIT);
            make.left.equalTo(10 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(80 * WIDTHFIT, 16 * HEIGHTFIT));
        }];
        
        self.codeTextField = [[UITextField alloc] init];
        self.codeTextField.textColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
        self.codeTextField.font = NAM_TITLE;
        self.codeTextField.delegate = self;
        self.codeTextField.keyboardType = UIKeyboardTypePhonePad;
        [self addSubview:_codeTextField];
        [_codeTextField makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line.bottom).offset(14 * HEIGHTFIT);
            make.left.equalTo(label2.right).offset(22 * WIDTHFIT);
            make.right.equalTo(-10 * WIDTHFIT);
        }];

    }
    return self;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.phoneTextField == textField) {
        if ([self.delegate respondsToSelector:@selector(acquiringPhone:)]) {
            [self.delegate acquiringPhone:textField.text];
        }
    }
    if (self.codeTextField == textField) {
        if ([self.delegate respondsToSelector:@selector(acquiringCode:)]) {
            [self.delegate acquiringCode:textField.text];
        }
    }
}
- (void)didButtonAcquiringCode:(UIButton *)sender
{
    [self openCountdown];
    if ([self.delegate respondsToSelector:@selector(didButtonOpen)]) {
        [self.delegate didButtonOpen];
    }

}
// 开启倒计时效果
- (void)openCountdown{
    
    __block NSInteger time = 5; //倒计时时间 59
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(time <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮的样式
                [self.button setTitle:@"获取验证码" forState:UIControlStateNormal];//重新发送
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置按钮显示读秒效果
                [self.button setTitle:[NSString stringWithFormat:@"%.2dS", seconds] forState:UIControlStateNormal];
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}


@end
