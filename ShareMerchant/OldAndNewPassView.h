//
//  OldAndNewPassView.h
//  ShareMerchant
//
//  Created by apple on 2017/9/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol OldAndNewPassViewDelegate <NSObject>

- (void)editOldText:(NSString *)string;
- (void)editNewsText:(NSString *)string;

@end
@interface OldAndNewPassView : UIView<UITextFieldDelegate>
/** <#注释#> */
@property(nonatomic, strong) UITextField * oldTextField;
/** <#注释#> */
@property(nonatomic, strong) UITextField * newsTextField;
/** <#注释#> */
@property(nonatomic, assign) id<OldAndNewPassViewDelegate>delegate;
@end
