//
//  FTAppView.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/24.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "FTAppView.h"
#import "Masonry.h"

@implementation FTAppView

- (instancetype)init {
    if (self = [super init]) {
        [self addSubview:self.nameLabel];
        [self addSubview:self.showImage];
        [self addSubview:self.downBtn];
        [self addAppViewMasonry];
        
    }
    return self;
}

- (void)addAppViewMasonry {
    WS(weakSelf);
    [_showImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top);
        make.left.mas_equalTo(weakSelf.mas_left).offset(12);
        make.size.mas_equalTo(CGSizeMake(51, 51));
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.showImage.mas_bottom);
        make.left.mas_equalTo(weakSelf.mas_left);
        make.right.mas_equalTo(weakSelf.mas_right);
        make.height.mas_equalTo(15);
    }];
    
    [_downBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.mas_bottom);
        make.centerX.mas_equalTo(weakSelf.showImage.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(51, 24));
    }];
}

- (void)setModelData:(FTDataModel *)modelData {
    _modelData = modelData;
    [_nameLabel setText:_modelData.name];
    [_showImage setImage:[UIImage imageNamed:_modelData.icon]];
}

- (UIButton *)downBtn {
    if (!_downBtn) {
        _downBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_downBtn setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:(UIControlStateNormal)];
        [_downBtn setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:(UIControlStateSelected)];
        [_downBtn.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [_downBtn setTitle:@"下载" forState:(UIControlStateNormal)];
        [_downBtn setTitle:@"已下载" forState:(UIControlStateSelected)];
        [_downBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_downBtn setTitleColor:[UIColor redColor] forState:(UIControlStateSelected)];
    }
    return _downBtn;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        [_nameLabel setTextColor:[UIColor purpleColor]];
        [_nameLabel setFont:[UIFont systemFontOfSize:12]];
        [_nameLabel setTextAlignment:(NSTextAlignmentCenter)];
    }
    return _nameLabel;
}

- (UIImageView *)showImage {
    if (!_showImage) {
        _showImage = [[UIImageView alloc] init];
        [_showImage.layer setMasksToBounds:YES];
        [_showImage.layer setCornerRadius:10];
    }
    return _showImage;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
