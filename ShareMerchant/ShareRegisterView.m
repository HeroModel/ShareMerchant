//
//  ShareRegisterView.m
//  ShareMerchant
//
//  Created by apple on 2017/9/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ShareRegisterView.h"

@interface ShareRegisterView ()<UITextFieldDelegate, UITextViewDelegate>
/** <#注释#> */
@property(nonatomic, strong) UITextField * nameTextField;
/** <#注释#> */
@property(nonatomic, strong) UITextField * passTextField;
/** <#注释#> */
@property(nonatomic, strong) UITextField * merchantName;
/** <#注释#> */
@property(nonatomic, strong) UITextField * merchantPhone;
/** <#注释#> */
@property(nonatomic, strong) UITextView * merchantAddress;
/** <#注释#> */
@property(nonatomic, strong) UILabel * label;
/** <#注释#> */
@property(nonatomic, strong) UILabel * lableValue;
/** <#注释#> */
@property(nonatomic, strong) UISlider * slider;
@end
@implementation ShareRegisterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel * label = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_PAGE_COLOR)];
        label.text = @"账号";
        label.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label];
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(15 * HEIGHTFIT);
            make.left.equalTo(20 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 14 * HEIGHTFIT));
        }];
        
        self.nameTextField = [UITextField textFieldWithPlaceholder:@"请输入手机号" WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) WithFont:NAM_TITLE_B WithTarget:self];
        self.nameTextField.keyboardType = UIKeyboardTypePhonePad;
        [self addSubview:_nameTextField];
        [_nameTextField makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(14 * HEIGHTFIT);
            make.left.equalTo(162 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(155 * WIDTHFIT, 16 * HEIGHTFIT));
        }];
        
        UIView * line = [UIView lineWithView];
        [self addSubview:line];
        [line makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label.bottom).offset(15 * HEIGHTFIT);
            make.left.equalTo(20 * WIDTHFIT);
            make.right.equalTo(-20 * WIDTHFIT);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];
       //****************************************************************************************************//
        
        UILabel * label1 = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_PAGE_COLOR)];
        label1.text = @"密码";
        label1.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label1];
        [label1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line.bottom).offset(15 * HEIGHTFIT);
            make.left.equalTo(20 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 14 * HEIGHTFIT));
        }];
        
        self.passTextField = [UITextField textFieldWithPlaceholder:@"请输入密码" WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) WithFont:NAM_TITLE_B WithTarget:self];
        self.passTextField.keyboardType = UIKeyboardTypeDefault;
        [self addSubview:_passTextField];
        [_passTextField makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line.bottom).offset(14 * HEIGHTFIT);
            make.left.equalTo(162 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(155 * WIDTHFIT, 16 * HEIGHTFIT));
        }];

        UIView * line1 = [UIView lineWithView];
        [self addSubview:line1];
        [line1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label1.bottom).offset(15 * HEIGHTFIT);
            make.left.equalTo(20 * WIDTHFIT);
            make.right.equalTo(-20 * WIDTHFIT);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];
        //****************************************************************************************************//
        UILabel * label2 = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_PAGE_COLOR)];
        label2.text = @"商家姓名";
        label2.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label2];
        [label2 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line1.bottom).offset(15 * HEIGHTFIT);
            make.left.equalTo(20 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 14 * HEIGHTFIT));
        }];
        
        self.merchantName = [UITextField textFieldWithPlaceholder:@"请输入商家姓名" WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) WithFont:NAM_TITLE_B WithTarget:self];
        self.merchantName.keyboardType = UIKeyboardTypeDefault;
        [self addSubview:_merchantName];
        [_merchantName makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line1.bottom).offset(14 * HEIGHTFIT);
            make.left.equalTo(162 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(155 * WIDTHFIT, 16 * HEIGHTFIT));
        }];
        
        UIView * line2 = [UIView lineWithView];
        [self addSubview:line2];
        [line2 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label2.bottom).offset(15 * HEIGHTFIT);
            make.left.equalTo(20 * WIDTHFIT);
            make.right.equalTo(-20 * WIDTHFIT);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];
        //****************************************************************************************************//
        UILabel * label3 = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_PAGE_COLOR)];
        label3.text = @"商家联系电话";
        label3.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label3];
        [label3 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line2.bottom).offset(15 * HEIGHTFIT);
            make.left.equalTo(20 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(95 * WIDTHFIT, 14 * HEIGHTFIT));
        }];
        
        self.merchantPhone = [UITextField textFieldWithPlaceholder:@"请输入商家联系电话" WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) WithFont:NAM_TITLE_B WithTarget:self];
        self.merchantPhone.keyboardType = UIKeyboardTypePhonePad;
        [self addSubview:_merchantPhone];
        [_merchantPhone makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line2.bottom).offset(14 * HEIGHTFIT);
            make.left.equalTo(162 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(155 * WIDTHFIT, 16 * HEIGHTFIT));
        }];
        
        UIView * line3 = [UIView lineWithView];
        [self addSubview:line3];
        [line3 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label3.bottom).offset(15 * HEIGHTFIT);
            make.left.equalTo(20 * WIDTHFIT);
            make.right.equalTo(-20 * WIDTHFIT);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];
        //****************************************************************************************************//
        UILabel * label4 = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_PAGE_COLOR)];
        label4.text = @"商家店铺地址";
        label4.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label4];
        [label4 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line3.bottom).offset(15 * HEIGHTFIT);
            make.left.equalTo(20 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(95 * WIDTHFIT, 14 * HEIGHTFIT));
        }];
        self.merchantAddress = [UITextView textViewWithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) WithFont:NAM_TITLE_B WithTarget:self];
        self.merchantAddress.keyboardType = UIKeyboardTypeDefault;
        [self addSubview:_merchantAddress];
        [_merchantAddress makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line3.bottom).offset(12 * HEIGHTFIT);
            make.left.equalTo(162 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(155 * WIDTHFIT, 42 * HEIGHTFIT));
        }];
        
        self.label = [UILabel StringWithFont:NAM_TITLE_B WithTextColor:[UIColor colorWithRed:0.78 green:0.78 blue:0.80 alpha:1.00]];
        self.label.text = @"请输入商家店铺地址";
        self.label.textAlignment = NSTextAlignmentLeft;
        [self.merchantAddress addSubview:_label];
        [_label makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0);
            make.left.equalTo(0);
            make.size.equalTo(CGSizeMake(155 * WIDTHFIT, 16 * HEIGHTFIT));
        }];
        UIView * line4 = [UIView lineWithView];
        [self addSubview:line4];
        [line4 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label4.bottom).offset(35 * HEIGHTFIT);
            make.left.equalTo(20 * WIDTHFIT);
            make.right.equalTo(-20 * WIDTHFIT);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];
        //****************************************************************************************************//
        UILabel * label5 = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_PAGE_COLOR)];
        label5.text = @"佣金设置";
        label5.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label5];
        [label5 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line4.bottom).offset(15 * HEIGHTFIT);
            make.left.equalTo(20 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 14 * HEIGHTFIT));
        }];
        
        
        UILabel * label6 = [UILabel StringWithFont:NAM_TITLE_B WithTextColor:UIColorFromRGB(GLOBAL_PAGE_COLOR)];
        label6.text = @"0";
        label6.textAlignment = NSTextAlignmentLeft;
        [self addSubview:label6];
        [label6 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label5.bottom).offset(15 * HEIGHTFIT);
            make.left.equalTo(20 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(10 * WIDTHFIT, 16 * HEIGHTFIT));
        }];
        
        self.lableValue = [UILabel StringWithFont:NAM_TITLE_B WithTextColor:UIColorFromRGB(GLOBAL_PAGE_COLOR)];
        _lableValue.text = @"32%";
        _lableValue.textAlignment = NSTextAlignmentRight;
        [self addSubview:_lableValue];
        [_lableValue makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label6);
            make.right.equalTo(-20 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(45 * WIDTHFIT, 16 * HEIGHTFIT));
        }];
        
        self.slider = [[UISlider alloc] init];
        _slider.minimumValue = 0;
        _slider.maximumValue = 1 * 100;
        _slider.value = 32;
        _slider.continuous = YES;
        _slider.minimumTrackTintColor = UIColorFromRGB(GR_COLOR);
        _slider.maximumTrackTintColor = UIColorFromRGB(GLOBAL_COLOR);
        [_slider setThumbImage:[UIImage imageNamed:@"cicle"] forState:UIControlStateNormal];
        [_slider addTarget:self action:@selector(upDateValue:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_slider];
        [_slider makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label5.bottom).offset(18 * HEIGHTFIT);
            make.left.equalTo(label6.right).offset(8 * WIDTHFIT);
            make.right.equalTo(_lableValue.left).offset(-8 * WIDTHFIT);
            make.height.equalTo(10 * HEIGHTFIT);
        }];
        
        
        
    }
    return self;
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    [self.label removeFromSuperview];

}
- (void)upDateValue:(UISlider *)slider
{
    int f = slider.value;
    self.lableValue.text = [NSString stringWithFormat:@"%d%%", f];

}
@end
