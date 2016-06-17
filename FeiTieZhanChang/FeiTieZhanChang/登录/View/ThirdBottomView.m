//
//  ThirdBottomView.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/30.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "ThirdBottomView.h"


@implementation ThirdBottomView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        
        [self addSubview:self.lineLabel];
        [self addSubview:self.xinLangBtn];
        [self addSubview:self.renRenBtn];
        [self addSubview:self.douBanBtn];
        [self addSubview:self.tenentBtn];
        [self addSubview:self.infoLabel];
        
        [self thirdAddMasonry];
    }
    return self;
}

- (void)thirdAddMasonry {
    
    WS(weakSelf);
    
    CGFloat width = (VIEW_WIDTH - 52 * 4) / 5.0;
    
    [_xinLangBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.mas_bottom).offset(-30);
        make.left.mas_equalTo(weakSelf.mas_left).offset(width);
        make.size.mas_equalTo(CGSizeMake(52, 52));
    }];
    
    [_renRenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.xinLangBtn.mas_centerY);
        make.left.mas_equalTo(weakSelf.xinLangBtn.mas_right).offset(width);
        make.size.mas_equalTo(CGSizeMake(52, 52));
    }];
    
    [_douBanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.renRenBtn.mas_centerY);
        make.left.mas_equalTo(weakSelf.renRenBtn.mas_right).offset(width);
        make.size.mas_equalTo(CGSizeMake(52, 52));
    }];
    
    [_tenentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.douBanBtn.mas_centerY);
        make.left.mas_equalTo(weakSelf.douBanBtn.mas_right).offset(width);
        make.size.mas_equalTo(CGSizeMake(52, 52));
    }];
    
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.xinLangBtn.mas_top).offset(-43);
        make.left.mas_equalTo(weakSelf.mas_left).offset(width);
        make.right.mas_equalTo(weakSelf.mas_right).offset(-width);
        make.height.mas_equalTo(1);
    }];
    
    [_infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.lineLabel.mas_centerY);
        make.left.mas_equalTo(weakSelf.mas_left).offset((VIEW_WIDTH - 120) * 0.5);
        make.size.mas_equalTo(CGSizeMake(120, 15));
    }];
}

- (UIButton *)xinLangBtn {
    if (!_xinLangBtn) {
        _xinLangBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_xinLangBtn setImage:[UIImage imageNamed:@"新浪"] forState:(UIControlStateNormal)];
    }
    return _xinLangBtn;
}

- (UIButton *)renRenBtn {
    if (!_renRenBtn) {
        _renRenBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_renRenBtn setImage:[UIImage imageNamed:@"人人"] forState:(UIControlStateNormal)];
    }
    return _renRenBtn;
}

- (UIButton *)douBanBtn {
    if (!_douBanBtn) {
        _douBanBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_douBanBtn setImage:[UIImage imageNamed:@"豆瓣"] forState:(UIControlStateNormal)];
    }
    return _douBanBtn;
}

- (UIButton *)tenentBtn {
    if (!_tenentBtn) {
        _tenentBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_tenentBtn setImage:[UIImage imageNamed:@"qq"] forState:(UIControlStateNormal)];
    }
    return _tenentBtn;
}

- (UILabel *)lineLabel {
    if (!_lineLabel) {
        _lineLabel = [[UILabel alloc] init];
        [_lineLabel setBackgroundColor:RGB(177, 177, 177)];
    }
    return _lineLabel;
}

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [[UILabel alloc] init];
        [_infoLabel setFont:[UIFont systemFontOfSize:12]];
        [_infoLabel setText:@"合作伙伴登录废铁"];
        [_infoLabel setBackgroundColor:[UIColor whiteColor]];
        [_infoLabel setTextAlignment:(NSTextAlignmentCenter)];
    }
    return _infoLabel;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
