//
//  OriginalTableView.h
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/4.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^loadNewDataBlock)();
typedef void(^loadMoreDataBlock)();
typedef void(^cellIndexRow)(NSInteger cellRow);

@interface OriginalTableView : UITableView

@property (strong, nonatomic) NSArray *arrayData;
@property (copy, nonatomic) loadNewDataBlock NewDataBlock;
@property (copy, nonatomic) loadMoreDataBlock MoreDataBlock;
@property (copy, nonatomic) cellIndexRow IndexRow;

@end
