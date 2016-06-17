//
//  FTAppView.h
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/24.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTDataModel.h"

@interface FTAppView : UIView

@property (strong, nonatomic) FTDataModel *modelData;
@property (strong, nonatomic) UIImageView *showImage;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UIButton *downBtn;

@end
