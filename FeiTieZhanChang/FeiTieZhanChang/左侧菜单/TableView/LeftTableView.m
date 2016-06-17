//
//  LeftTableView.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/4.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "LeftTableView.h"
#import "LeftCell.h"

static NSString *strLeftCell = @"cell";

@interface LeftTableView()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation LeftTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        
        self.delegate = self;
        self.dataSource = self;
        self.bounces = NO;
        self.separatorStyle = NO;
        [self  setBackgroundColor:RGB(51, 51, 51)];
        self.arrayImage = @[@"首页",@"社区",@"碎片",@"良品",@"电台",@"阅读",@"设置"];
        self.arrayTitle = @[@"废铁原创",@"废铁战友",@"废铁分享",@"市场动向",@"废铁前线",@"超级猜图",@"系统设置"];
    }
    return self;
}

#pragma make- 左侧菜单的 UITableViewDataSource 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrayTitle.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LeftCell *cell = [tableView dequeueReusableCellWithIdentifier:strLeftCell];
    if (!cell) {
        cell = [[LeftCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:strLeftCell];
    }

    [cell setBackgroundColor:RGB(58, 58, 58)];
    cell.cellImage.image = [UIImage imageNamed:self.arrayImage[indexPath.row]];
    cell.titleLabel.text = self.arrayTitle[indexPath.row];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55.0;
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
