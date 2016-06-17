//
//  LeftCell.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/4.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "LeftCell.h"


@implementation LeftCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self addSubview:self.cellImage];
        [self addSubview:self.titleLabel];
        
        [self leftCellAddMasonry];
    }
    return self;
    
}

- (void)leftCellAddMasonry {
    WS(weakSelf);
    [_cellImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top);
        make.left.mas_equalTo(weakSelf.mas_left).offset(10);
        make.size.mas_equalTo(CGSizeMake(55, 55));
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.mas_top);
        make.bottom.mas_equalTo(weakSelf.mas_bottom);
        make.left.mas_equalTo(weakSelf.cellImage.mas_right);
        make.right.mas_equalTo(weakSelf.mas_right).offset(-50);
    }];
}

- (UIImageView *)cellImage {
    if (!_cellImage) {
        _cellImage = [[UIImageView alloc] init];
        [_cellImage setContentMode:(UIViewContentModeCenter)];
    }
    return _cellImage;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [_titleLabel setTextColor:[UIColor whiteColor]];
    }
    return _titleLabel;
}

@end
