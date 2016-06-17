//
//  MarketCell.h
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/15.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ichiban.h"


@interface MarketCell : UITableViewCell

@property (strong, nonatomic) IchibanList *marketModel;
@property (strong, nonatomic) UIImageView *showImage;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIButton *buyBtn;
@property (strong, nonatomic) UILabel *shareLabel;
@property (strong, nonatomic) UILabel *commentLabel;
@property (strong, nonatomic) UILabel *likeLabel;
@property (strong, nonatomic) UILabel *wireLabel;


@end
