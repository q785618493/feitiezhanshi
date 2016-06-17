//
//  LeftTableView.h
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/4.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LeftCellBlock)(NSInteger cellRow);

@interface LeftTableView : UITableView

@property (strong, nonatomic) NSArray *arrayImage;
@property (strong, nonatomic) NSArray *arrayTitle;
@property (copy, nonatomic) LeftCellBlock cellIndexRow;

@end
