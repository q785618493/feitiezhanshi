//
//  ShareCell.h
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/14.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ShareHeader.h"


@interface ShareCell : UITableViewCell

@property (strong, nonatomic) FTShareList *modelShare;
@property (strong, nonatomic) NSMutableDictionary *heightDic;

@property (strong, nonatomic) UIButton *btnHead;
@property (strong, nonatomic) UILabel *unameLabel;
@property (strong, nonatomic) UILabel *timeLabel;
@property (strong, nonatomic) UIImageView *showImage;
@property (strong, nonatomic) UILabel *infoLabel;
@property (strong, nonatomic) UIButton *btnComment;
@property (strong, nonatomic) UILabel *commentLabel;
@property (strong, nonatomic) UIButton *btnLike;
@property (strong, nonatomic) UILabel *likeLabel;
@property (strong, nonatomic) UILabel *shareLabel;
@property (strong, nonatomic) UILabel *wireLabel;

@end
