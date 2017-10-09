//
//  TeamMessageTableViewCell.h
//  ShareMerchant
//
//  Created by mac on 2017/9/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ShareMerchartBaseTableViewCell.h"

@protocol TeamMessageTableViewCellDelegate <NSObject>

- (void)didTableViewCelleIndex:(NSInteger)index;

@end
@interface TeamMessageTableViewCell : ShareMerchartBaseTableViewCell
/** <#注释#> */
@property (nonatomic, assign) id<TeamMessageTableViewCellDelegate>delegate;
@end
