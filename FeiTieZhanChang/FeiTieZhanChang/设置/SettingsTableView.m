//
//  SettingsTableView.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/16.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "SettingsTableView.h"
#import "SettingsCell.h"

@interface SettingsTableView()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation SettingsTableView

- (NSArray *)arraySettings {
    if (!_arraySettings) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"SettingsPList" ofType:@"plist"];
        _arraySettings = [[NSArray alloc] initWithContentsOfFile:filePath];
    }
    return _arraySettings;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.delegate = self;
        self.dataSource = self;
        self.bounces = NO;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

#pragma make- 系统设置的 UITableViewDataSource
/** 返回 cell 分区的总数*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.arraySettings.count;
}

/** 加载的行数*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arraySettings[section] count];
}

/** 创建分区 cell*/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *str = @"cell";
    SettingsCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[SettingsCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:str];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setBackgroundColor:RGB(250, 250, 250)];
    }
    
    [cell.titleLabel setText:self.arraySettings[indexPath.section][indexPath.row]];
    return cell;
}

/** 返回自定义样式的分区头视图*/
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UILabel *headLabel = [[UILabel alloc] init];
//    [headLabel setBackgroundColor:RGB(235, 235, 235)];
//    [headLabel setTextAlignment:(NSTextAlignmentCenter)];
//    [headLabel setTextColor:RGB(59, 82, 156)];
//    switch (section) {
//        case 0:
//            [headLabel setText:@"阅读设置"];
//            break;
//        case 1:
//            [headLabel setText:@"网络设置"];
//            break;
//        case 2:
//            [headLabel setText:@"通用设置"];
//        default:
//            break;
//    }
//    return headLabel;
//}

/** 返回分区头的高度*/
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

/** 返回分区尾的高度*/
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

/** 返回每一行 cell 的高度*/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 51;
}

/** 返回系统样式的分区头的标题*/
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        return @"阅读设置";
    } else if (1 == section) {
        return @"网络设置";
    }
       return @"通用设置";
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
