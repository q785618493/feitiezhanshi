//
//  MarketTableView.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/15.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "MarketTableView.h"

@interface MarketTableView()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MarketTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self addMJRefresh];
    }
    return self;
}

- (void)addMJRefresh {
    
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
    if (_newDataBLock) {
        _newDataBLock();
    }
}

- (void)moreDataAction {
    if (_moreDataBlock) {
        _moreDataBlock();
    }
}

#pragma make- 市场动向的 UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrayData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *strCell = @"cell";
    MarketCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
    if (!cell) {
        cell = [[MarketCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:strCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setBackgroundColor:RGB(250, 250, 250)];
    }
    cell.marketModel = _arrayData[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 270;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_indexRowCell) {
        _indexRowCell(indexPath.row);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
