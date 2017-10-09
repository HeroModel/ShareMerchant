//
//  ShareRegisterView.h
//  ShareMerchant
//
//  Created by apple on 2017/9/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ShareMerchartBaseView.h"

@protocol ShareRegisterViewDelegate <NSObject>

- (void)nameTextFieldText:(NSString *)text;
- (void)passTextFieldText:(NSString *)text;
- (void)merchantNameText:(NSString *)text;
- (void)merchantPhoneText:(NSString *)text;
- (void)merchantAddressText:(NSString *)text;
@end
@interface ShareRegisterView : ShareMerchartBaseView
/** <#注释#> */
@property(nonatomic, strong) UITextField * nameTextField;
/** <#注释#> */
@property(nonatomic, assign) id<ShareRegisterViewDelegate> delegate;
@end
