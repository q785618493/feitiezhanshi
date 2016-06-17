//
//  NewStoryTableView.h
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/14.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NewStoryCell.h"

typedef void(^loadNewDataBlock)();
typedef void(^loadMoreDataBlock)();
typedef void(^CellIndexRow)(NSInteger cellRow);

@interface NewStoryTableView : UITableView

@property (strong, nonatomic) NSArray *arrayData;
@property (copy, nonatomic) loadNewDataBlock newDataBlock;
@property (copy, nonatomic) loadMoreDataBlock moreDataBlock;
@property (copy, nonatomic) CellIndexRow indexCellRow;

@end
