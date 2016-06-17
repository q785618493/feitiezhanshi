//
//  ShareTableView.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/14.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "ShareTableView.h"

@interface ShareTableView()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ShareTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        [self setDelegate:self];
        [self setDataSource:self];
        [self setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
        [self addMJRefresh];
    }
    return self;
}

- (void)addMJRefresh {
    
    MJChiBaoZiHeader *header = [MJChiBaoZiHeader headerWithRefreshingTarget:self refreshingAction:@selector(newDataAction)];
    header.mj_h = 50;
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    self.mj_header = header;
    
    MJChiBaoZiFooter2 *footer = [MJChiBaoZiFooter2 footerWithRefreshingTarget:self refreshingAction:@selector(moreDataAction)];
    footer.stateLabel.hidden = YES;
    self.mj_footer.automaticallyChangeAlpha = YES;
    self.mj_footer = footer;
}

- (void)newDataAction {
    if (_newDataBlock) {
        _newDataBlock();
    }
}

- (void)moreDataAction {
    if (_moreDataBlock) {
        _moreDataBlock();
    }
}

#pragma make- 废铁分享的UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *strCell = @"cell";
    ShareCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
    if (!cell) {
        cell = [[ShareCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:strCell];
        [cell setSelectionStyle:(UITableViewCellSelectionStyleNone)];
    }
    
    [cell setBackgroundColor:RGB(250, 250, 250)];
    /** 一定要先进行高度的赋值 ，之后再给 cell 的控件赋值, 否则会出错*/
    cell.heightDic = self.arrayHeight[indexPath.row];
    
    cell.modelShare = self.arrayData[indexPath.row];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat cellHeight = [[self.arrayHeight[indexPath.row] valueForKey:@"cellHeight"] floatValue];
    return cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_cellIndexRow) {
        _cellIndexRow(indexPath.row);
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
