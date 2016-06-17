//
//  NewStoryCell.h
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/14.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HeaderNineBtn.h"


@interface NewStoryCell : UITableViewCell

@property (strong, nonatomic) BtnNineList *NewModel;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIImageView *showImage;
@property (strong, nonatomic) UILabel *infoLabel;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UILabel *shareLabel;
@property (strong, nonatomic) UILabel *commentLabel;
@property (strong, nonatomic) UILabel *collectLabel;
@property (strong, nonatomic) UILabel *wireLabel;

@end
