//
//  TimeAddTableView.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/8.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "TimeAddTableView.h"
#import "TimeAddCell.h"


@interface TimeAddTableView()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation TimeAddTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self addTimeAddMJRefresh];
    }
    return self;
}

- (void)addTimeAddMJRefresh {
    MJChiBaoZiHeader *header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(newDataAction)];
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    header.mj_h = 50;
    self.mj_header = header;
    
    MJChiBaoZiFooter2 *footer = [MJChiBaoZiFooter2 footerWithRefreshingTarget:self refreshingAction:@selector(moreDataAction)];
    footer.stateLabel.hidden = YES;
    self.mj_footer.automaticallyChangeAlpha = YES;
    self.mj_footer = footer;
}

- (void)newDataAction {
    if (_NewDataBlock) {
        _NewDataBlock();
    }
}

- (void)moreDataAction {
    if (_MoreDataBLock) {
        _MoreDataBLock();
    }
}

#pragma make- 废铁原创最新的 UITableViewDataSource 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrayData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *strCell = @"cell";
    TimeAddCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
    if (!cell) {
        cell = [[TimeAddCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:strCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell setBackgroundColor:RGB(250, 250, 250)];
    cell.modelListNew = _arrayData[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 230;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_CellRowBlock) {
        _CellRowBlock(indexPath.row);
    }
}

@end
