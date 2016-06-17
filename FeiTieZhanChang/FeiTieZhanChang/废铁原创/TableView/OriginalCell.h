//
//  OriginalCell.h
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/4.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OriginalityHeader.h"

@interface OriginalCell : UITableViewCell

@property (strong, nonatomic) ReadClassList *modelList;
@property (strong, nonatomic) UIImageView *showImage;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *timeLabel;
@property (strong, nonatomic) UILabel *commentLabel;
@property (strong, nonatomic) UILabel *infoLabel;
@property (strong, nonatomic) UIButton *headBtn;
@property (strong, nonatomic) UILabel *unameLabel;
@property (strong, nonatomic) UILabel *shareLabel;
@property (strong, nonatomic) UILabel *collectLabel;
@property (strong, nonatomic) UILabel *wireLabel;

@end
