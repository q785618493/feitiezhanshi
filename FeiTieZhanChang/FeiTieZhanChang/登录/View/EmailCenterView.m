//
//  EmailCenterView.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/30.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "EmailCenterView.h"


@implementation EmailCenterView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self= [super initWithFrame:frame]) {
        
        [self addSubview:self.landing];
        [self addSubview:self.emailLabel];
        [self addSubview:self.codeLabel];
        [self addSubview:self.lineLabel1];
        [self addSubview:self.lineLabel2];
        [self addSubview:self.emailField];
        [self addSubview:self.codeField];
        
        [self addEmailCenterViewMasonry];
    }
    return self;
}

- (void)addEmailCenterViewMasonry {
    
    CGFloat width = (VIEW_WIDTH - 52 * 4) / 5.0;
    
    WS(weakSelf);
    [_emailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top);
        make.left.mas_equalTo(weakSelf.mas_left).offset(width);
        make.size.mas_equalTo(CGSizeMake(50, 30));
    }];
    
    [_emailField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.emailLabel.mas_centerY);
        make.left.mas_equalTo(weakSelf.emailLabel.mas_right);
        make.size.mas_equalTo(CGSizeMake(VIEW_WIDTH - width * 2 - 50, 30));
    }];
    
    [_lineLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.emailField.mas_bottom);
        make.left.mas_equalTo(weakSelf.mas_left).offset(width);
        make.size.mas_equalTo(CGSizeMake(VIEW_WIDTH - width * 2, 1));
    }];
    
    [_codeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.lineLabel1.mas_bottom).offset(19);
        make.left.mas_equalTo(weakSelf.mas_left).offset(width);
        make.size.mas_equalTo(CGSizeMake(50, 30));
    }];
    
    [_codeField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.codeLabel.mas_centerY);
        make.left.mas_equalTo(weakSelf.codeLabel.mas_right);
        make.size.mas_equalTo(CGSizeMake(VIEW_WIDTH - width * 2 - 50, 30));
    }];
    
    [_lineLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.codeField.mas_bottom);
        make.left.mas_equalTo(weakSelf.mas_left).offset(width);
        make.size.mas_equalTo(CGSizeMake(VIEW_WIDTH - width * 2, 1));
    }];
    
    [_landing mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.lineLabel2.mas_bottom).offset(19);
        make.left.mas_equalTo(weakSelf.mas_left).offset(40);
        make.size.mas_equalTo(CGSizeMake(VIEW_WIDTH - 80, 32));
    }];
    
}

- (UITextField *)emailField {
    if (!_emailField) {
        _emailField = [[UITextField alloc] init];
        [_emailField setTextColor:[UIColor blackColor]];
        [_emailField setBorderStyle:(UITextBorderStyleNone)];
    }
    return _emailField;
}

- (UITextField *)codeField {
    if (!_codeField) {
        _codeField = [[UITextField alloc] init];
        [_codeField setBorderStyle:(UITextBorderStyleNone)];
        [_codeField setTextColor:[UIColor blackColor]];
        [_codeField setSecureTextEntry:YES];
    }
    return _codeField;
}

- (UILabel *)codeLabel {
    if (!_codeLabel) {
        _codeLabel = [[UILabel alloc] init];
        [_codeLabel setText:@"密 码:"];
        [_codeLabel setFont:[UIFont systemFontOfSize:16]];
    }
    return _codeLabel;
}

- (UILabel *)emailLabel {
    if (!_emailLabel) {
        _emailLabel = [[UILabel alloc] init];
        [_emailLabel setText:@"邮 箱:"];
        [_emailLabel setFont:[UIFont systemFontOfSize:16]];
    }
    return _emailLabel;
}

- (UILabel *)lineLabel1 {
    if (!_lineLabel1) {
        _lineLabel1 = [[UILabel alloc] init];
        [_lineLabel1 setBackgroundColor:RGB(184, 184, 184)];
    }
    return _lineLabel1;
}

- (UILabel *)lineLabel2 {
    if (!_lineLabel2) {
        _lineLabel2 = [[UILabel alloc] init];
        [_lineLabel2 setBackgroundColor:RGB(184, 184, 184)];
    }
    return _lineLabel2;
}

- (UIButton *)landing {
    if (!_landing) {
        _landing = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_landing setBackgroundColor:RGB(119, 182, 69)];
        [_landing setTitle:@"登   录" forState:(UIControlStateNormal)];
        [_landing.titleLabel setFont:[UIFont systemFontOfSize:22]];
        [_landing setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    }
    return _landing;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
