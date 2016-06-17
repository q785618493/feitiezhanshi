//
//  MarketTableView.h
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/15.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MarketCell.h"


typedef void(^loadNewDataBlock)();
typedef void(^loadMoreDataBlock)();
typedef void(^CellIndexRow)(NSInteger cellRow);


@interface MarketTableView : UITableView

@property (strong, nonatomic) NSMutableArray *arrayData;
@property (copy, nonatomic) loadNewDataBlock newDataBLock;
@property (copy, nonatomic) loadMoreDataBlock moreDataBlock;
@property (copy, nonatomic) CellIndexRow indexRowCell;

@end
