//
//  MultistageTableViewCell.m
//  ShareMerchant
//
//  Created by apple on 2017/9/11.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MultistageTableViewCell.h"

@interface MultistageTableViewCell ()
/** <#注释#> */
@property(nonatomic, strong) UIView * line;
@end
@implementation MultistageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.line = [[UIView alloc] init];
        self.line.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
        [self.contentView addSubview:_line];
        [_line makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0);
            make.left.equalTo(10 * WIDTHFIT);
            make.right.equalTo(-10 * WIDTHFIT);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];
        
        UILabel * label = [UILabel StringWithFont:NAM_TITLE_B WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        label.text = @"张琳琳";
        label.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:label];
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(15 * HEIGHTFIT);
            make.left.equalTo(10 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(80 * WIDTHFIT, 16 * HEIGHTFIT));
        }];
        
        UILabel * label1 = [UILabel StringWithFont:NAM_TITLE_B WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        label1.text = @"13212345678";
        label1.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:label1];
        [label1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(15 * HEIGHTFIT);
            make.right.equalTo(-10 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(130 * WIDTHFIT, 16 * HEIGHTFIT));
        }];
    }
    return self;
}
- (void)setIsSelede:(BOOL)isSelede
{
    if (_isSelede != isSelede) {
        _isSelede = isSelede;
    }
    if (_isSelede) {
       self.line.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
    }else{
        self.line.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    }
}
@end
