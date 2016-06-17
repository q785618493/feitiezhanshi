//
//  TopLeftView.h
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/4.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TopViewBtnTag)(NSInteger btnTag);

@interface TopLeftView : UIView

@property (strong, nonatomic) UIImageView *backgroundImage;
@property (strong, nonatomic) UIButton *headBtn;
@property (strong, nonatomic) UIButton *unameBtn;
@property (strong, nonatomic) UIButton *tradeBtn;
@property (strong, nonatomic) UIButton *contactBtn;
@property (strong, nonatomic) UIButton *likeBtn;
@property (strong, nonatomic) UIButton *commentBtn;
@property (strong, nonatomic) UIButton *seekBtn;
@property (copy, nonatomic) TopViewBtnTag topBtnTag;

@end
