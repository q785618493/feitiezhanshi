//
//  TimeAddTableView.h
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/8.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^loadNewDataBlock)();
typedef void(^loadMoreDataBlock)();
typedef void(^CellIndexRow)(NSInteger cellRow);

@interface TimeAddTableView : UITableView

@property (strong, nonatomic) NSArray *arrayData;
@property (copy, nonatomic) loadNewDataBlock NewDataBlock;
@property (copy, nonatomic) loadMoreDataBlock MoreDataBLock;
@property (copy, nonatomic) CellIndexRow CellRowBlock;

@end
