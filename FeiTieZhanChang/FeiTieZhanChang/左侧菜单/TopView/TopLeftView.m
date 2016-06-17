//
//  TopLeftView.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/4.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "TopLeftView.h"

@implementation TopLeftView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.backgroundImage];
        [self addSubview:self.headBtn];
        [self addSubview:self.unameBtn];
        [self addSubview:self.tradeBtn];
        [self addSubview:self.contactBtn];
        [self addSubview:self.likeBtn];
        [self addSubview:self.commentBtn];
        [self addSubview:self.seekBtn];
        
        [self leftTopAddMasonry];
    }
    return self;
}

/**给控件添加约束*/
- (void)leftTopAddMasonry {
    WS(weakSelf);
    [_backgroundImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(weakSelf).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.edges.mas_equalTo(weakSelf);
    }];
    
    [_headBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top).offset(30);
        make.left.mas_equalTo(weakSelf.mas_left).offset(20);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [_unameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.headBtn.mas_centerY);
        make.left.mas_equalTo(weakSelf.headBtn.mas_right).offset(2);
        make.size.mas_equalTo(CGSizeMake(200, 20));
    }];
    
    CGFloat width = (VIEW_WIDTH - 131) / 5.0;
    [_tradeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.headBtn.mas_bottom).offset(20);
        make.left.mas_equalTo(weakSelf.mas_left).offset(width);
        make.size.mas_equalTo(CGSizeMake(24, 24));
    }];
    
    [_contactBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.tradeBtn.mas_centerY);
        make.left.mas_equalTo(weakSelf.tradeBtn.mas_right).offset(width);
        make.size.mas_equalTo(CGSizeMake(24, 24));
    }];
    
    [_likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.contactBtn.mas_centerY);
        make.left.mas_equalTo(weakSelf.contactBtn.mas_right).offset(width);
        make.size.mas_equalTo(CGSizeMake(24, 24));
    }];
    
    [_commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.likeBtn.mas_centerY);
        make.left.mas_equalTo(weakSelf.likeBtn.mas_right).offset(width);
        make.size.mas_equalTo(CGSizeMake(24, 24));
    }];
    
    [_seekBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.tradeBtn.mas_bottom).offset(20);
        make.left.mas_equalTo(weakSelf.mas_left).offset(width);
        make.right.mas_equalTo(weakSelf.mas_right).offset(-width);
        make.height.mas_equalTo(30);
    }];
    
}

/**懒加载所有控件*/
- (UIImageView *)backgroundImage {
    if (!_backgroundImage) {
        _backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"EVA08.jpg"]];
    }
    return _backgroundImage;
}

- (UIButton *)headBtn {
    if (!_headBtn) {
        _headBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_headBtn setTag:1];
        [_headBtn.layer setMasksToBounds:YES];
        [_headBtn.layer setCornerRadius:25];
        [_headBtn setBackgroundImage:[UIImage imageNamed:@"头像"] forState:(UIControlStateNormal)];
//        [_headBtn setBackgroundImage:[UIImage imageNamed:@"头像废铁"] forState:(UIControlStateNormal)];
        [_headBtn addTarget:self action:@selector(touchActionBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _headBtn;
}

- (UIButton *)unameBtn {
    if (!_unameBtn) {
        _unameBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_unameBtn setTag:2];
        [_unameBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
//        [_unameBtn setTitle:@"垃圾佬老王" forState:(UIControlStateNormal)];
        [_unameBtn setTitle:@"登录||注册" forState:(UIControlStateNormal)];
        
        /**设置按钮的 titleLabel 对齐方式为左对齐*/
        [_unameBtn setContentHorizontalAlignment:(UIControlContentHorizontalAlignmentLeft)];
        [_unameBtn addTarget:self action:@selector(touchActionBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _unameBtn;
}

- (UIButton *)tradeBtn {
    if (!_tradeBtn) {
        _tradeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_tradeBtn setTag:3];
        [_tradeBtn setBackgroundImage:[UIImage imageNamed:@"下载"] forState:(UIControlStateNormal)];
        [_tradeBtn addTarget:self action:@selector(touchActionBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _tradeBtn;
}

- (UIButton *)contactBtn {
    if (!_contactBtn) {
        _contactBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_contactBtn setTag:4];
        [_contactBtn setBackgroundImage:[UIImage imageNamed:@"消息"] forState:(UIControlStateNormal)];
        [_contactBtn addTarget:self action:@selector(touchActionBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _contactBtn;
}

- (UIButton *)likeBtn {
    if (!_likeBtn) {
        _likeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_likeBtn setTag:5];
        [_likeBtn setBackgroundImage:[UIImage imageNamed:@"收藏"] forState:(UIControlStateNormal)];
        [_likeBtn addTarget:self action:@selector(touchActionBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _likeBtn;
}

- (UIButton *)commentBtn {
    if (!_commentBtn) {
        _commentBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_commentBtn setTag:6];
        [_commentBtn setBackgroundImage:[UIImage imageNamed:@"写评论"] forState:(UIControlStateNormal)];
        [_commentBtn addTarget:self action:@selector(touchActionBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _commentBtn;
}

- (UIButton *)seekBtn {
    if (!_seekBtn) {
        _seekBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_seekBtn setTag:7];
        [_seekBtn setBackgroundImage:[UIImage imageNamed:@"搜索"] forState:(UIControlStateNormal)];
        [_seekBtn addTarget:self action:@selector(touchActionBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _seekBtn;
}

- (void)touchActionBtn:(UIButton *)btn {
    if (_topBtnTag) {
        _topBtnTag(btn.tag);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
