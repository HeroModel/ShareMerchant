//
//  YYCodeView.h
//  ShareMerchant
//
//  Created by apple on 2017/9/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ShareMerchartBaseView.h"

@protocol YYCodeViewDelegate <NSObject>

- (void)passTextCodeString:(NSString *)string;

@end
@interface YYCodeView : ShareMerchartBaseView<UITextFieldDelegate>
/** <#注释#> */
@property(nonatomic, strong) UITextField * textField;
/** <#注释#> */
@property(nonatomic, strong) UILabel * label;
/** <#注释#> */
@property(nonatomic, assign) id<YYCodeViewDelegate> delegate;
@end
