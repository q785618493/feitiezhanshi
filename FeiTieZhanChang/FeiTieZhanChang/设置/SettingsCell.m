//
//  SettingsCell.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/16.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "SettingsCell.h"


@implementation SettingsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.wireLabel];
        [self addSettingsMasonry];
    }
    return self;
}

- (void)addSettingsMasonry {
    WS(weakSelf);
    [_wireLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.mas_bottom);
        make.left.mas_equalTo(weakSelf.mas_left);
        make.size.mas_equalTo(CGSizeMake(VIEW_WIDTH, 1));
    }];

    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top).offset(10);
        make.left.mas_equalTo(weakSelf.mas_left).offset(20);
        make.size.mas_equalTo(CGSizeMake(VIEW_WIDTH - 40, 30));
    }];
}

- (UILabel *)wireLabel {
    if (!_wireLabel) {
        _wireLabel = [[UILabel alloc] init];
        [_wireLabel setBackgroundColor:RGB(210, 210, 210)];
    }
    return _wireLabel;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setFont:[UIFont systemFontOfSize:20]];
    }
    return _titleLabel;
}

@end
