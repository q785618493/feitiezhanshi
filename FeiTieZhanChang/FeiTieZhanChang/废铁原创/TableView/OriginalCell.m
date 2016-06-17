//
//  OriginalCell.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/4.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "OriginalCell.h"

@implementation OriginalCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.showImage];
        [self addSubview:self.titleLabel];
        [self addSubview:self.timeLabel];
        [self addSubview:self.commentLabel];
        [self addSubview:self.infoLabel];
        [self addSubview:self.headBtn];
        [self addSubview:self.unameLabel];
        [self addSubview:self.shareLabel];
        [self addSubview:self.collectLabel];
        [self addSubview:self.wireLabel];
        
        [self originalCellAddMasonry];
    }
    return self;
}

- (void)originalCellAddMasonry {
    WS(weakSelf);
    [_wireLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.mas_bottom);
        make.left.mas_equalTo(weakSelf.mas_left);
        make.size.mas_equalTo(CGSizeMake(VIEW_WIDTH, 10));
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top).offset(10);
        make.left.mas_equalTo(weakSelf.mas_left).offset(20);
        make.size.mas_equalTo(CGSizeMake(VIEW_WIDTH - 40, 40));
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.titleLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(weakSelf.mas_left).offset(20);
        make.size.mas_equalTo(CGSizeMake(VIEW_WIDTH - 40, 20));
    }];
    
    [_headBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.wireLabel.mas_top).offset(-10);
        make.left.mas_equalTo(weakSelf.mas_left).offset(20);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [_unameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.headBtn.mas_centerY);
        make.left.mas_equalTo(weakSelf.headBtn.mas_right).offset(2);
        make.size.mas_equalTo(CGSizeMake(VIEW_WIDTH / 2.0, 20));
    }];
    
    [_collectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.headBtn.mas_centerY);
        make.right.mas_equalTo(weakSelf.mas_right).offset(-22);
        make.size.mas_equalTo(CGSizeMake(16, 20));
    }];
    
    [_commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.shareLabel.mas_centerY);
        make.right.mas_equalTo(weakSelf.collectLabel.mas_left).offset(-15);
        make.size.mas_equalTo(CGSizeMake(16, 20));
    }];
    
    [_shareLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.unameLabel.mas_centerY);
        make.right.mas_equalTo(weakSelf.commentLabel.mas_left).offset(-15);
        make.size.mas_equalTo(CGSizeMake(16, 20));
    }];
    
}

- (void)setModelList:(ReadClassList *)modelList {
    _modelList = modelList;
    [_titleLabel setText:_modelList.title];
    [_timeLabel setText:_modelList.addtimeF];
    [_showImage downloadImage:_modelList.firstimage];
    [_infoLabel setText:_modelList.shortcontent];
    [_headBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:_modelList.userinfo.icon] forState:(UIControlStateNormal)];
    [_unameLabel setText:_modelList.userinfo.uname];
    [_shareLabel setText:@"🐵"];
    [_commentLabel setText:@"💼"];
    [_collectLabel setText:@"❤️"];
    
    if ([_modelList.firstimage isEmptyString]) {
        [_infoLabel setFrame:CGRectMake(20, 90, VIEW_WIDTH - 40, 80)];
        [_showImage setFrame:(CGRectMake(0, 0, 0, 0))];
    } else {
        [_infoLabel setFrame:CGRectMake(102, 90, VIEW_WIDTH - 122, 80)];
        [_showImage setFrame:CGRectMake(20, 90, 80, 80)];
    }
}

- (UILabel *)collectLabel {
    if (!_collectLabel) {
        _collectLabel = [[UILabel alloc] init];
        [_collectLabel setFont:[UIFont systemFontOfSize:12.0]];
    }
    return _collectLabel;
}

- (UILabel *)shareLabel {
    if (!_shareLabel) {
        _shareLabel = [[UILabel alloc] init];
        [_shareLabel setFont:[UIFont systemFontOfSize:12.0]];
    }
    return _shareLabel;
}

- (UILabel *)unameLabel {
    if (!_unameLabel) {
        _unameLabel = [[UILabel alloc] init];
//        [_unameLabel setTextColor:[UIColor greenColor]];
        [_unameLabel setFont:[UIFont systemFontOfSize:12.0]];
    }
    return _unameLabel;
}

- (UIButton *)headBtn {
    if (!_headBtn) {
        _headBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_headBtn.layer setMasksToBounds:YES];
        [_headBtn.layer setCornerRadius:15.0];
    }
    return _headBtn;
}

- (UILabel *)wireLabel {
    if (!_wireLabel) {
        _wireLabel = [[UILabel alloc] init];
        [_wireLabel setBackgroundColor:RGB(240, 240, 240)];
    }
    return _wireLabel;
}

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [[UILabel alloc] init];
        [_infoLabel setTextColor:RGB(184, 184, 148)];
        [_infoLabel setFont:[UIFont systemFontOfSize:14.0]];
        [_infoLabel setNumberOfLines:0];
        [_infoLabel setLineBreakMode:NSLineBreakByWordWrapping];
    }
    return _infoLabel;
}

- (UILabel *)commentLabel {
    if (!_commentLabel) {
        _commentLabel = [[UILabel alloc] init];
        [_commentLabel setFont:[UIFont systemFontOfSize:12.0]];
        [_commentLabel setTextColor:RGB(184, 184, 184)];
    }
    return _commentLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        [_timeLabel setFont:[UIFont systemFontOfSize:12.0]];
        [_timeLabel setTextColor:RGB(184, 184, 184)];
    }
    return _timeLabel;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setFont:[UIFont systemFontOfSize:15.0]];
        [_titleLabel setNumberOfLines:0];
        [_titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
    }
    return _titleLabel;
}

- (UIImageView *)showImage {
    if (!_showImage) {
        _showImage = [[UIImageView alloc] init];
    }
    return _showImage;
}

@end
