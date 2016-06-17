//
//  CenterBottomView.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/31.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "CenterBottomView.h"


@interface CenterBottomView ()

@property (strong, nonatomic) UILabel *userLable;
@property (strong, nonatomic) UILabel *emailLabel;
@property (strong, nonatomic) UILabel *codeLabel;
@property (strong, nonatomic) UILabel *lineLabel1;
@property (strong, nonatomic) UILabel *lineLabel2;
@property (strong, nonatomic) UILabel *lineLable3;
@property (strong, nonatomic) UILabel *labelDele;

@end

@implementation CenterBottomView

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.manBtn];
        [self addSubview:self.womanBtn];
        [self addSubview:self.deleBtn];
        [self addSubview:self.finishBtn];
        [self addSubview:self.userField];
        [self addSubview:self.emailField];
        [self addSubview:self.codeField];
        [self addSubview:self.userLable];
        [self addSubview:self.emailLabel];
        [self addSubview:self.codeLabel];
        [self addSubview:self.lineLabel1];
        [self addSubview:self.lineLabel2];
        [self addSubview:self.lineLable3];
        [self addSubview:self.labelDele];
        
        [self centerBottomViewAddMasonry];
    }
    return self;
}

- (void)centerBottomViewAddMasonry {
    
    WS(weakSelf);
    [_labelDele mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.mas_bottom).offset(-30);
        make.left.mas_equalTo(weakSelf.mas_left).offset(40);
        make.size.mas_equalTo(CGSizeMake(VIEW_WIDTH - 128, 20));
    }];
    
    [_deleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.labelDele.mas_centerY);
        make.right.mas_equalTo(weakSelf.mas_right).offset(-40);
        make.size.mas_equalTo(CGSizeMake(48, 20));
    }];
    
    [_finishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.labelDele.mas_top).offset(-30);
        make.left.mas_equalTo(weakSelf.mas_left).offset(40);
        make.size.mas_equalTo(CGSizeMake(VIEW_WIDTH - 80, 30));
    }];
    
    [_lineLable3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.finishBtn.mas_top).offset(-29);
        make.left.mas_equalTo(weakSelf.mas_left).offset(40);
        make.size.mas_equalTo(CGSizeMake(VIEW_WIDTH - 80, 1));
    }];
    
    [_codeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.lineLable3.mas_top);
        make.left.mas_equalTo(weakSelf.mas_left).offset(40);
        make.size.mas_equalTo(CGSizeMake(55, 30));
    }];
    
    [_codeField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.codeLabel.mas_centerY);
        make.left.mas_equalTo(weakSelf.codeLabel.mas_right);
        make.size.mas_equalTo(CGSizeMake(VIEW_WIDTH - 80 - 55, 30));
    }];
    
    [_lineLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.lineLable3.mas_centerX);
        make.bottom.mas_equalTo(weakSelf.codeField.mas_top).offset(-19);
        make.size.mas_equalTo(CGSizeMake(VIEW_WIDTH - 80, 1));
    }];
    
    [_emailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.codeLabel.mas_centerX);
        make.bottom.mas_equalTo(weakSelf.lineLabel2.mas_top);
        make.size.mas_equalTo(CGSizeMake(55, 30));
    }];
    
    [_emailField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.emailLabel.mas_centerY);
        make.centerX.mas_equalTo(weakSelf.codeField.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(VIEW_WIDTH - 55 - 80, 30));
    }];
    
    [_lineLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.lineLabel2.mas_centerX);
        make.bottom.mas_equalTo(weakSelf.emailLabel.mas_top).offset(-19);
        make.size.mas_equalTo(CGSizeMake(VIEW_WIDTH - 80, 1));
    }];
    
    [_userLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.emailLabel.mas_centerX);
        make.bottom.mas_equalTo(weakSelf.lineLabel1.mas_top);
        make.size.mas_equalTo(CGSizeMake(55, 30));
    }];
    
    [_userField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.emailField.mas_centerX);
        make.centerY.mas_equalTo(weakSelf.userLable.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(VIEW_WIDTH - 55 - 80, 30));
    }];
    
    CGFloat width = (VIEW_WIDTH - 106) / 3.0;
    
    [_manBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.userField.mas_top).offset(-30);
        make.left.mas_equalTo(weakSelf.mas_left).offset(width);
        make.size.mas_equalTo(CGSizeMake(53, 25));
    }];
    
    [_womanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.manBtn.mas_centerY);
        make.right.mas_equalTo(weakSelf.mas_right).offset(-width);
        make.size.mas_equalTo(CGSizeMake(53, 25));
    }];
}

- (UIButton *)womanBtn {
    if (!_womanBtn) {
        _womanBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_womanBtn setTag:80001];
        [_womanBtn setImage:[UIImage imageNamed:@"女按钮"] forState:(UIControlStateNormal)];
        [_womanBtn setImage:[UIImage imageNamed:@"女选中"] forState:(UIControlStateSelected)];
        [_womanBtn addTarget:self action:@selector(manTouchActionBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _womanBtn;
}

- (UIButton *)manBtn {
    if (!_manBtn) {
        _manBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_manBtn setTag:80000];
        [_manBtn setImage:[UIImage imageNamed:@"男按钮"] forState:(UIControlStateNormal)];
        [_manBtn setImage:[UIImage imageNamed:@"男选中"] forState:(UIControlStateSelected)];
        [_manBtn addTarget:self action:@selector(manTouchActionBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _manBtn;
}

- (void)manTouchActionBtn:(UIButton *)btn {
    
    if (80000 == btn.tag) {
        btn.selected = YES;
        self.womanBtn.selected = NO;
    } else {
        btn.selected = YES;
        self.manBtn.selected = NO;
    }
}

- (UILabel *)userLable {
    if (!_userLable) {
        _userLable = [[UILabel alloc] init];
        [_userLable setText:@"昵 称:"];
    }
    return _userLable;
}

- (UILabel *)emailLabel {
    if (!_emailLabel) {
        _emailLabel = [[UILabel alloc] init];
        [_emailLabel setText:@"邮 箱:"];
    }
    return _emailLabel;
}

- (UILabel *)codeLabel {
    if (!_codeLabel) {
        _codeLabel = [[UILabel alloc] init];
        [_codeLabel setText:@"密 码:"];
    }
    return _codeLabel;
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

- (UITextField *)emailField {
    if (!_emailField) {
        _emailField = [[UITextField alloc] init];
        [_emailField setBorderStyle:(UITextBorderStyleNone)];
        [_emailField setTextColor:[UIColor blackColor]];
    }
    return _emailField;
}

- (UITextField *)userField {
    if (!_userField) {
        _userField = [[UITextField alloc] init];
        [_userField setBorderStyle:(UITextBorderStyleNone)];
        [_userField setTextColor:[UIColor blackColor]];
    }
    return _userField;
}

- (UILabel *)lineLabel1 {
    if (!_lineLabel1) {
        _lineLabel1 = [[UILabel alloc] init];
        [_lineLabel1 setBackgroundColor:[UIColor blackColor]];
    }
    return _lineLabel1;
}

- (UILabel *)lineLabel2 {
    if (!_lineLabel2) {
        _lineLabel2 = [[UILabel alloc] init];
        [_lineLabel2 setBackgroundColor:[UIColor blackColor]];
    }
    return _lineLabel2;
}

- (UILabel *)lineLable3 {
    if (!_lineLable3) {
        _lineLable3 = [[UILabel alloc] init];
        [_lineLable3 setBackgroundColor:[UIColor blackColor]];
    }
    return _lineLable3;
}

- (UIButton *)finishBtn {
    if (!_finishBtn) {
        _finishBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_finishBtn setTitle:@"完   成" forState:(UIControlStateNormal)];
        [_finishBtn.titleLabel setFont:[UIFont systemFontOfSize:22]];
        [_finishBtn setBackgroundColor:RGB(119, 182, 69)];
        [_finishBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    }
    return _finishBtn;
}


- (UIButton *)deleBtn {
    if (!_deleBtn) {
        _deleBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_deleBtn setTitle:@"搞机协议" forState:(UIControlStateNormal)];
        [_deleBtn.titleLabel setFont:[UIFont systemFontOfSize:11]];
        [_deleBtn setTitleColor:RGB(119, 182, 69) forState:(UIControlStateNormal)];
    }
    return _deleBtn;
}

- (UILabel *)labelDele {
    if (!_labelDele) {
        _labelDele = [[UILabel alloc] init];
        [_labelDele setText:@"点击“完成”按钮，代表您已阅读同意"];
        [_labelDele setFont:[UIFont systemFontOfSize:11]];
        [_labelDele setTextAlignment:(NSTextAlignmentCenter)];
    }
    return _labelDele;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
