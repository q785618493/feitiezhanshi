//
//  MarketCell.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/15.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "MarketCell.h"

@implementation MarketCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.showImage];
        [self addSubview:self.titleLabel];
        [self addSubview:self.buyBtn];
        [self addSubview:self.shareLabel];
        [self addSubview:self.commentLabel];
        [self addSubview:self.likeLabel];
        [self addSubview:self.wireLabel];
        [self addMarketCellMasonry];
    }
    return self;
}

- (void)addMarketCellMasonry {
    WS(weakSelf);
    [_wireLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.mas_bottom);
        make.left.mas_equalTo(weakSelf.mas_left);
        make.size.mas_equalTo(CGSizeMake(VIEW_WIDTH, 10));
    }];
    
    [_likeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.wireLabel.mas_top).offset(-10);
        make.right.mas_equalTo(weakSelf.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(16, 20));
    }];
    
    [_commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.likeLabel.mas_centerY);
        make.right.mas_equalTo(weakSelf.likeLabel.mas_left).offset(-40);
        make.size.mas_equalTo(CGSizeMake(16, 20));
    }];
    
    [_shareLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.commentLabel.mas_centerY);
        make.right.mas_equalTo(weakSelf.commentLabel.mas_left).offset(-40);
        make.size.mas_equalTo(CGSizeMake(16, 20));
    }];
    
    [_buyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.shareLabel.mas_centerY);
        make.left.mas_equalTo(weakSelf.mas_left).offset(20);
        make.size.mas_equalTo(CGSizeMake(60, 20));
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top).offset(10);
        make.left.mas_equalTo(weakSelf.mas_left).offset(20);
        make.size.mas_equalTo(CGSizeMake(VIEW_WIDTH - 20, 40));
    }];
    
    [_showImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.titleLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(weakSelf.mas_left).offset(20);
        make.size.mas_equalTo(CGSizeMake(VIEW_WIDTH - 40, 160));
    }];
    
}

- (void)setMarketModel:(IchibanList *)marketModel {
    _marketModel = marketModel;
    [_titleLabel setText:_marketModel.title];
    [_showImage downloadImage:_marketModel.coverimg];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setFont:[UIFont systemFontOfSize:15]];
        [_titleLabel setNumberOfLines:0];
        [_titleLabel setLineBreakMode:0];
    }
    return _titleLabel;
}

- (UIImageView *)showImage {
    if (!_shareLabel) {
        _showImage = [[UIImageView alloc] init];
    }
    return _showImage;
}

- (UIButton *)buyBtn {
    if (!_buyBtn) {
        _buyBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_buyBtn setBackgroundColor:RGB(119, 182, 69)];
        [_buyBtn.layer setMasksToBounds:YES];
        [_buyBtn.layer setCornerRadius:10];
        [_buyBtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [_buyBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_buyBtn setTitle:@"立即购买" forState:(UIControlStateNormal)];
    }
    return _buyBtn;
}

- (UILabel *)shareLabel {
    if (!_shareLabel) {
        _shareLabel = [[UILabel alloc] init];
        [_shareLabel setFont:[UIFont systemFontOfSize:12]];
        [_shareLabel setText:@"♣️"];
    }
    return _shareLabel;
}

- (UILabel *)commentLabel {
    if (!_commentLabel) {
        _commentLabel = [[UILabel alloc] init];
        [_commentLabel setText:@"💼"];
        [_commentLabel setFont:[UIFont systemFontOfSize:12]];
    }
    return _commentLabel;
}

- (UILabel *)likeLabel {
    if (!_likeLabel) {
        _likeLabel = [[UILabel alloc] init];
        [_likeLabel setFont:[UIFont systemFontOfSize:12]];
        [_likeLabel setText:@"❤️"];
    }
    return _likeLabel;
}

- (UILabel *)wireLabel {
    if (!_wireLabel) {
        _wireLabel = [[UILabel alloc] init];
        [_wireLabel setBackgroundColor:RGB(240, 240, 240)];
    }
    return _wireLabel;
}

@end
