//
//  TopView.h
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/10.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+WebCache.h"
#import "ReadingHead.h"

typedef void(^BtnTopBlock)(NSInteger btnTopTag);

@interface TopView : UIView

@property (copy, nonatomic) BtnTopBlock btnTopTag;

- (instancetype)initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray;
- (instancetype)initWithFrame:(CGRect)frame andImagesTop:(NSArray *)imagesTop;

@end
