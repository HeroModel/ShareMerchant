//
//  NewsDetailsTableViewCell.h
//  ShareMerchant
//
//  Created by apple on 2017/9/13.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ShareMerchartBaseTableViewCell.h"

@interface NewsDetailsTableViewCell : ShareMerchartBaseTableViewCell
/** <#注释#> */
@property(nonatomic, strong) UITextView * textView;
- (float) heightForString:(UITextView *)textView andWidth:(float)width;
@end
