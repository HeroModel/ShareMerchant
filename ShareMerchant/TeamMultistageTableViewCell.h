//
//  TeamMultistageTableViewCell.h
//  ShareMerchant
//
//  Created by apple on 2017/9/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ShareMerchartBaseTableViewCell.h"

@protocol TeamMultistageTableViewCellDelegate <NSObject>

- (void)didSeledTableViewCell:(NSInteger)index;

@end
@interface TeamMultistageTableViewCell : ShareMerchartBaseTableViewCell
/** <#注释#> */
@property(nonatomic, assign) id<TeamMultistageTableViewCellDelegate> delegate;
@end
