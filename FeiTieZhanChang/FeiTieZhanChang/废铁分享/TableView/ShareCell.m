//
//  ShareCell.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/14.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "ShareCell.h"

@implementation ShareCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.btnHead];
        [self addSubview:self.unameLabel];
        [self addSubview:self.timeLabel];
        [self addSubview:self.showImage];
        [self addSubview:self.infoLabel];
        [self addSubview:self.btnComment];
        [self addSubview:self.commentLabel];
        [self addSubview:self.btnLike];
        [self addSubview:self.likeLabel];
        [self addSubview:self.shareLabel];
        [self addSubview:self.wireLabel];
        [self addShareMasonry];
    }
    return self;
}

- (void)setModelShare:(FTShareList *)modelShare {
    _modelShare = modelShare;
    [_btnHead sd_setBackgroundImageWithURL:[NSURL URLWithString:_modelShare.userinfo.icon] forState:(UIControlStateNormal)];
    [_unameLabel setText:_modelShare.userinfo.uname];
    [_timeLabel setText:_modelShare.addtimeF];
    [_showImage downloadImage:_modelShare.coverimg];
    [_infoLabel setAttributedText:[self makeTextExampleString:_modelShare.content]];
    [_commentLabel setText:[NSString stringWithFormat:@"%ld",_modelShare.counterList.comment]];
    [_likeLabel setText:[NSString stringWithFormat:@"%ld",modelShare.counterList.like]];
    
    CGFloat imageH = [self.heightDic[@"imageHeight"] floatValue];
    CGFloat textH = [self.heightDic[@"textHeight"] floatValue];
    
    if (0.0 == imageH) {
        [_infoLabel setFrame:CGRectMake(20, 50 , VIEW_WIDTH - 40, textH)];
        [_showImage setFrame:(CGRectMake(0, 0, 0, 0))];
    } else {
        [_showImage setFrame:CGRectMake(20, 50, VIEW_WIDTH - 40, imageH)];
        [_infoLabel setFrame:CGRectMake(20, 60 + imageH, VIEW_WIDTH - 40, textH)];
    }
}

- (void)addShareMasonry {
    
    WS(weakSelf);
    [_btnHead mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top).offset(10);
        make.left.mas_equalTo(weakSelf.mas_left).offset(20);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        
    }];
    
    [_unameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.btnHead.mas_centerY);
        make.left.mas_equalTo(weakSelf.btnHead.mas_right).offset(2);
        make.size.mas_equalTo(CGSizeMake(VIEW_WIDTH - 154, 20));
    }];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.unameLabel.mas_centerY);
        make.left.mas_equalTo(weakSelf.unameLabel.mas_right).offset(2);
        make.size.mas_equalTo(CGSizeMake(80, 20));
    }];
    
    [_wireLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.mas_bottom);
        make.left.mas_equalTo(weakSelf.mas_left);
        make.right.mas_equalTo(weakSelf.mas_right);
        make.height.mas_equalTo(10);
    }];
    
    [_likeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(weakSelf.wireLabel.mas_top).offset(-10);
        make.right.mas_equalTo(weakSelf.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(33, 20));
    }];
    
    [_btnLike mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.likeLabel.mas_centerY);
        make.right.mas_equalTo(weakSelf.likeLabel.mas_left);
        make.size.mas_equalTo(CGSizeMake(24, 20));
    }];
    
    [_commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.btnLike.mas_centerY);
        make.right.mas_equalTo(weakSelf.btnLike.mas_left);
        make.size.mas_equalTo(CGSizeMake(33, 20));
    }];
    
    [_btnComment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.commentLabel.mas_centerY);
        make.right.mas_equalTo(weakSelf.commentLabel.mas_left);
        make.size.mas_equalTo(CGSizeMake(24, 20));
    }];
    
    [_shareLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(weakSelf.commentLabel.mas_centerY);
        make.right.mas_equalTo(weakSelf.commentLabel.mas_left).offset(-52);
        make.size.mas_equalTo(CGSizeMake(16, 20));
    }];
    
}

- (UIButton *)btnHead {
    if (!_btnHead) {
        _btnHead = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_btnHead.layer setMasksToBounds:YES];
        [_btnHead.layer setCornerRadius:15.0];
    }
    return _btnHead;
}

- (UILabel *)unameLabel {
    if (!_unameLabel) {
        _unameLabel = [[UILabel alloc] init];
        [_unameLabel setFont:[UIFont systemFontOfSize:13.0]];
        [_unameLabel setTextColor:RGB(59, 82, 156)];
    }
    return _unameLabel;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        [_timeLabel setFont:[UIFont systemFontOfSize:12]];
        [_timeLabel setTextColor:RGB(184, 184, 184)];
        [_timeLabel setTextAlignment:(NSTextAlignmentRight)];
    }
    return _timeLabel;
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
        [_infoLabel setNumberOfLines:0];
        [_infoLabel setTextAlignment:(NSTextAlignmentLeft)];
        [_infoLabel setFont:[UIFont fontWithName:@"PingFangSC-Regular" size:14.0f]];
    }
    return _infoLabel;
}

- (UIButton *)btnComment {
    if (!_btnComment) {
        _btnComment = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_btnComment setBackgroundImage:[UIImage imageNamed:@"comment"] forState:(UIControlStateNormal)];
    }
    return _btnComment;
}

- (UILabel *)commentLabel {
    if (!_commentLabel) {
        _commentLabel = [[UILabel alloc] init];
        [_commentLabel setTextColor:RGB(184, 184, 184)];
        [_commentLabel setFont:[UIFont systemFontOfSize:12]];
    }
    return _commentLabel;
}

- (UIButton *)btnLike {
    if (!_btnLike) {
        _btnLike = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_btnLike setBackgroundImage:[UIImage imageNamed:@"like"] forState:(UIControlStateNormal)];
    }
    return _btnLike;
}

- (UILabel *)likeLabel {
    if (!_likeLabel) {
        _likeLabel = [[UILabel alloc] init];
        [_likeLabel setTextColor:RGB(184, 184, 184)];
        [_likeLabel setFont:[UIFont systemFontOfSize:12]];
    }
    return _likeLabel;
}

- (UILabel *)shareLabel {
    if (!_shareLabel) {
        _shareLabel = [[UILabel alloc] init];
        [_shareLabel setFont:[UIFont systemFontOfSize:12]];
        [_shareLabel setText:@"🐲"];
    }
    return _shareLabel;
}

- (UILabel *)wireLabel {
    if (!_wireLabel) {
        _wireLabel = [[UILabel alloc] init];
        [_wireLabel setBackgroundColor:RGB(240, 240, 240)];
    }
    return _wireLabel;
}

- (NSAttributedString *)makeTextExampleString:(NSString *)exampleString {
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.lineSpacing = 2;
    paragraph.paragraphSpacing = 2;
    paragraph.firstLineHeadIndent = 0;
    
    NSDictionary *dicA = @{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:14.0f],
                           //                             NSForegroundColorAttributeName:[UIColor greenColor],
                           //                             NSBackgroundColorAttributeName:[UIColor grayColor],
                           NSParagraphStyleAttributeName:paragraph,
                           //                             NSObliquenessAttributeName:@0.5 //斜体
                           //                             NSStrokeColorAttributeName:[UIColor whiteColor],
                           //                             NSStrokeWidthAttributeName:@2,//描边
                           //                             NSKernAttributeName:@20,//字间距
                           //                             NSStrikethroughStyleAttributeName:@2//删除线
                           //                             NSUnderlineStyleAttributeName:@1,//下划线
                           };
    NSAttributedString *attrbuted = [[NSAttributedString alloc] initWithString:exampleString attributes:dicA];
    return attrbuted;
}

@end
