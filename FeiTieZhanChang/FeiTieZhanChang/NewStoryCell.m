//
//  NewStoryCell.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/14.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "NewStoryCell.h"

@implementation NewStoryCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self addSubview:self.titleLabel];
        [self addSubview:self.showImage];
        [self addSubview:self.infoLabel];
        [self addSubview:self.nameLabel];
        [self addSubview:self.shareLabel];
        [self addSubview:self.commentLabel];
        [self addSubview:self.collectLabel];
        [self addSubview:self.wireLabel];
        [self newStoryCellAddMasonry];
        
    }
    return self;
}

- (void)newStoryCellAddMasonry {
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
    
    [_collectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(weakSelf.mas_right).offset(-20);
        make.bottom.mas_equalTo(weakSelf.wireLabel.mas_top).offset(-10);
        make.size.mas_equalTo(CGSizeMake(16, 20));
    }];
    
    [_commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.collectLabel.mas_centerY);
        make.right.mas_equalTo(weakSelf.collectLabel.mas_left).offset(-15);
        make.size.mas_equalTo(CGSizeMake(16, 20));
    }];
    
    [_shareLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.commentLabel.mas_centerY);
        make.right.mas_equalTo(weakSelf.commentLabel.mas_left).offset(-15);
        make.size.mas_equalTo(CGSizeMake(16, 20));
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.shareLabel.mas_centerY);
        make.left.mas_equalTo(weakSelf.mas_left).offset(20);
        make.size.mas_equalTo(CGSizeMake(VIEW_WIDTH / 2.0 - 20, 20));
    }];
}

- (void)setNewModel:(BtnNineList *)NewModel {
    _NewModel = NewModel;
    [_titleLabel setText:_NewModel.title];
    [_showImage downloadImage:_NewModel.coverimg];
    [_infoLabel setText:_NewModel.content];
    [_nameLabel setText:_NewModel.name];
    
    if ([_NewModel.coverimg isEmptyString]) {
        [_infoLabel setFrame:CGRectMake(20, 60, VIEW_WIDTH - 40, 80)];
        [_showImage setFrame:(CGRectMake(0, 0, 0, 0))];
    } else {
        [_infoLabel setFrame:CGRectMake(142, 60, VIEW_WIDTH - 162, 80)];
        [_showImage setFrame:CGRectMake(20, 60, 120, 80)];
    }
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setFont:[UIFont systemFontOfSize:15]];
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

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [[UILabel alloc] init];
        [_infoLabel setFont:[UIFont systemFontOfSize:14]];
        [_infoLabel setTextColor:RGB(184, 184, 148)];
        [_infoLabel setNumberOfLines:0];
        [_infoLabel setLineBreakMode:0];
    }
    return _infoLabel;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        [_nameLabel setFont:[UIFont systemFontOfSize:12]];
    }
    return _nameLabel;
}

- (UILabel *)shareLabel {
    if (!_shareLabel) {
        _shareLabel = [[UILabel alloc] init];
        [_shareLabel setFont:[UIFont systemFontOfSize:12]];
        [_shareLabel setText:@"🐂"];
    }
    return _shareLabel;
}

- (UILabel *)commentLabel {
    if (!_commentLabel) {
        _commentLabel = [[UILabel alloc] init];
        [_commentLabel setFont:[UIFont systemFontOfSize:12]];
        [_commentLabel setText:@"💼"];
    }
    return _commentLabel;
}

- (UILabel *)collectLabel {
    if (!_collectLabel) {
        _collectLabel = [[UILabel alloc] init];
        [_collectLabel setFont:[UIFont systemFontOfSize:12]];
        [_collectLabel setText:@"❤️"];
    }
    return _collectLabel;
}

- (UILabel *)wireLabel {
    if (!_wireLabel) {
        _wireLabel = [[UILabel alloc] init];
        [_wireLabel setBackgroundColor:RGB(241, 241, 241)];
    }
    return _wireLabel;
}

@end
