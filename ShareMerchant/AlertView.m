//
//  AlertView.m
//  ShareMerchant
//
//  Created by apple on 2017/9/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "AlertView.h"

@implementation AlertView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss:)];
        [self addGestureRecognizer:tap];
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        UIImageView * image = [[UIImageView alloc] init];
        image.image = [UIImage imageNamed:@"popup"];
        image.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:image];
        [image makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.size.equalTo(CGSizeMake(255 * WIDTHFIT, 147 * HEIGHTFIT));
        }];
        
        UILabel * label = [UILabel StringWithFont:NAM_TITLE_FONT_M WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        label.text = @"修改成功";
        label.textAlignment = NSTextAlignmentCenter;
        [image addSubview:label];
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(image);
            make.bottom.equalTo(image.bottom).offset(-45 * HEIGHTFIT);
        }];
        
    }
    return self;
}
- (void)show
{
    [[[[UIApplication sharedApplication] delegate] window] addSubview:self];
}
- (void)dismiss:(UITapGestureRecognizer *)tap
{
    [self removeFromSuperview];
}
@end
