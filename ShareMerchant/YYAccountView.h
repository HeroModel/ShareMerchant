//
//  YYAccountView.h
//  ShareMerchant
//
//  Created by apple on 2017/9/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ShareMerchartBaseView.h"

@protocol YYAccountViewDelegate <NSObject>

- (void)acquiringMoney:(NSString *)string;
- (void)acquiringAccount:(NSString *)string;
- (void)acquiringName:(NSString *)string;

@end
@interface YYAccountView : ShareMerchartBaseView<UITextFieldDelegate>
/** <#注释#> */
@property(nonatomic, strong) UITextField * moneyTextField;
/** <#注释#> */
@property(nonatomic, strong) UITextField * nameTextField;
/** <#注释#> */
@property(nonatomic, strong) UITextField * accountTextField;
/** <#注释#> */
@property(nonatomic, assign) id<YYAccountViewDelegate> delegate;
@end
