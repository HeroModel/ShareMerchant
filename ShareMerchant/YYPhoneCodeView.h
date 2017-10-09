//
//  YYPhoneCodeView.h
//  ShareMerchant
//
//  Created by apple on 2017/9/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ShareMerchartBaseView.h"

@protocol YYPhoneCodeViewDelegate <NSObject>

- (void)acquiringPhone:(NSString *)string;
- (void)acquiringCode:(NSString *)string;
- (void)didButtonOpen;
@end
@interface YYPhoneCodeView : ShareMerchartBaseView<UITextFieldDelegate>
/** <#注释#> */
@property(nonatomic, strong) UITextField * phoneTextField;
/** <#注释#> */
@property(nonatomic, strong) UITextField * codeTextField;
/** <#注释#> */
@property(nonatomic, assign) id<YYPhoneCodeViewDelegate>delegate;
@end
