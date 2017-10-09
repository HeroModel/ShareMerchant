//
//  EditPassView.h
//  ShareMerchant
//
//  Created by apple on 2017/9/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditPassViewDelegate <NSObject>

- (void)editTextString:(NSString *)string;

@end
@interface EditPassView : UIView<UITextFieldDelegate>
/** <#注释#> */
@property(nonatomic, strong) UITextField * textField;
/** <#注释#> */
@property(nonatomic, assign) id<EditPassViewDelegate> delegate;
@end
