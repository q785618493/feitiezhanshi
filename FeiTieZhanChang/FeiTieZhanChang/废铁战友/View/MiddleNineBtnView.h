//
//  MiddleNineBtnView.h
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/10.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReadingHead.h"
#import "UIButton+WebCache.h"

typedef void(^BtnNineTagBlock)(NSInteger btnTag);

@interface MiddleNineBtnView : UIView

@property (copy, nonatomic) BtnNineTagBlock btnTag;
@property (strong, nonatomic) ReadingModelList *modelArray;

- (instancetype)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray;

@end
