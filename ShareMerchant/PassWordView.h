//
//  PassWordView.h
//  ShareMerchant
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PassWordViewDelegate <NSObject>

- (void)importString:(NSString *)string;

@end
@interface PassWordView : UIView
/** <#注释#> */
@property(nonatomic, strong) UIImageView * image;
/** <#注释#> */
@property(nonatomic, strong) UITextField * textField;
/** <#注释#> */
@property(nonatomic, assign) id<PassWordViewDelegate>delegate;
@end
