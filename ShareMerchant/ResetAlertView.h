//
//  ResetAlertView.h
//  ShareMerchant
//
//  Created by apple on 2017/9/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ResetAlertViewDelegate <NSObject>

- (void)didButtonSucceedShow;

@end
@interface ResetAlertView : UIView
- (void)show;
- (void)dismiss;
/** <#注释#> */
@property(nonatomic, assign) id<ResetAlertViewDelegate>delegate;
@end
