//
//  ShareTableView.h
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/14.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShareCell.h"


typedef void(^loadNewDataBlock)();
typedef void(^loadMoreDataBlock)();
typedef void(^cellIndexRow)(NSInteger row);

@interface ShareTableView : UITableView

@property (strong, nonatomic) NSArray *arrayData;
@property (strong, nonatomic) NSArray *arrayHeight;
@property (copy, nonatomic) cellIndexRow cellIndexRow;
@property (copy, nonatomic) loadNewDataBlock newDataBlock;
@property (copy, nonatomic) loadMoreDataBlock moreDataBlock;

@end
