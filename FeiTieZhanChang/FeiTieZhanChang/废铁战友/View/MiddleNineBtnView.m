//
//  MiddleNineBtnView.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/10.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "MiddleNineBtnView.h"

@implementation MiddleNineBtnView

- (instancetype)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray {
    if (self = [super initWithFrame:frame]) {
        
        CGFloat width = VIEW_WIDTH / 3.0;
        for (NSInteger i = 0; i < 9; i ++) {
            self.modelArray = imageArray[i];
            UIButton *nineBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
            [nineBtn setTag:2000 + i];
            [nineBtn setFrame:CGRectMake(i % 3 * width + 1, i / 3 * width , width - 2, width - 2)];
            [nineBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:self.modelArray.coverimg] forState:(UIControlStateNormal)];
            [nineBtn addTarget:self action:@selector(touchActionNineBtn:) forControlEvents:(UIControlEventTouchUpInside)];
            [self addSubview:nineBtn];
            
            UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(1, width * 0.25, width - 4, width / 4.0)];
            [nameLabel setTextColor:[UIColor whiteColor]];
            [nameLabel setFont:[UIFont boldSystemFontOfSize:14.0]];
            [nameLabel setText:self.modelArray.name];
            [nameLabel setTextAlignment:(NSTextAlignmentCenter)];
            [nineBtn addSubview:nameLabel];
            UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(1, width / 2.0, width - 4, width / 4.0)];
            [myLabel setTextColor:[UIColor whiteColor]];
            [myLabel setTextAlignment:(NSTextAlignmentCenter)];
            [myLabel setFont:[UIFont systemFontOfSize:14.0]];
            [myLabel setText:self.modelArray.enname];
            [nineBtn addSubview:myLabel];
            
        }
        
    }
    return self;
}

- (void)touchActionNineBtn:(UIButton *)nineBtn {
    if (_btnTag) {
        _btnTag(nineBtn.tag - 2000);
    }
}

@end
