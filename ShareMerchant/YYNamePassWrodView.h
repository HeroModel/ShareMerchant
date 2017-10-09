//
//  YYNamePassWrodView.h
//  ShareMerchant
//
//  Created by apple on 2017/9/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ShareMerchartBaseView.h"

@protocol YYNamePassWrodViewDelegate <NSObject>

- (void)passTextString:(NSString *)string;

@end
@interface YYNamePassWrodView : ShareMerchartBaseView<UITextFieldDelegate>
/** <#注释#> */
@property(nonatomic, strong) UITextField * textField;
/** <#注释#> */
@property(nonatomic, strong) UILabel * label;
/** <#注释#> */
@property(nonatomic, assign) id<YYNamePassWrodViewDelegate> delegate;
@end
