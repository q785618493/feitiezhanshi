//
//  StoryTableView.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/14.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "StoryTableView.h"

@interface StoryTableView()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation StoryTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [self storyAddMJReresh];
    }
    return self;
}

- (void)storyAddMJReresh {
    
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
    if (_newDataBlock) {
        _newDataBlock();
    }
}

- (void)moreDataAction {
    if (_moreDataBlock) {
        _moreDataBlock();
    }
}

#pragma make- 废铁战友NinewBtnView的 Hot UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrayData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *strCell = @"cell";
    BtnStoryCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
    if (!cell) {
        cell = [[BtnStoryCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:strCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setBackgroundColor:RGB(250, 250, 250)];
    }
    cell.hotModel = _arrayData[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 190;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_indexCellRow) {
        _indexCellRow(indexPath.row);
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
