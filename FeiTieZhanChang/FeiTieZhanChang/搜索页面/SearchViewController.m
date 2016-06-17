//
//  SearchViewController.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/16.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "SearchViewController.h"


@interface SearchViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating>

/** 搜索用的假数据数组*/
@property (strong, nonatomic) NSArray *tableSource;
@property (strong, nonatomic) NSArray *singleArray;

/** 用来保存过滤的数据*/
@property (strong, nonatomic) NSMutableArray *searchSource;

/** 处理搜索功能的对象*/
@property (strong, nonatomic) UISearchController *searchVC;

/** TableView*/
@property (strong, nonatomic) UITableView *tableView;



@end

@implementation SearchViewController

/** 懒加载假数据*/
- (NSArray *)tableSource {
    if (!_tableSource) {
        NSMutableArray *muArray = [[NSMutableArray alloc] init];
        for (NSInteger i =0; i < 100; i ++) {
            NSString *modelString = [NSString stringWithFormat:@"有%.2ld个基佬攻击单身🐶小赵",i + 10];
            [muArray addObject:modelString];
        }
        self.tableSource = muArray;
    }
    return _tableSource;
}

- (NSArray *)singleArray {
    if (!_singleArray) {
        NSMutableArray *muArray = [[NSMutableArray alloc] init];
        for (NSInteger p = 0; p < 100; p ++) {
            NSString *single = [NSString stringWithFormat:@"对单身🐶小赵造成一次暴击伤害，减去%ld元",p + 10000];
            [muArray addObject:single];
        }
        _singleArray = muArray;
    }
    return _singleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self popNavView];
    [self.popLabel setText:@"即时搜索"];
    
    [self addUITableView];
}

- (void)addUITableView {
    self.searchSource = [[NSMutableArray alloc] init];
    
    /** 创建 UITableView*/
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT - 64) style:(UITableViewStylePlain)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView setBounces:NO];
    [self.view addSubview:_tableView];
    
    /** 初始化搜索控制器*/
    self.searchVC = [[UISearchController alloc] initWithSearchResultsController:nil];
    
    /** 使用当前控制器对象来展示搜索结果*/
    _searchVC.searchResultsUpdater = self;
    
    /** 设定搜索框的位置*/
    [_searchVC.searchBar setFrame:CGRectMake(0, 0, VIEW_WIDTH, 40)];
    
    /** 确定搜索框的摆放位置(把搜索框添加到表格头上)*/
    [_tableView setTableHeaderView:_searchVC.searchBar];
    
    /** 设置是否在搜索的时候，隐藏导航条（YES表示隐藏，NO表示不隐藏）*/
    [_searchVC setHidesNavigationBarDuringPresentation:NO];
    
    /** 设置在搜索的时候，是否可以跟背景交互(YES不可以,NO可以)*/
    [_searchVC setDimsBackgroundDuringPresentation:NO];
    
    /** 设置搜索框的外观 设置显示样式*/
    [_searchVC.searchBar setBarStyle:UIBarStyleDefault];
    
    /** 设置搜索框的键盘样式*/
    [_searchVC.searchBar setKeyboardType:UIKeyboardTypeDefault];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma make- 搜索页面的 UITableViewSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.searchVC.active) {
        return self.searchSource.count;
    }
    return self.tableSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *strCell = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strCell];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:strCell];
        [cell setBackgroundColor:RGB(250, 250, 250)];
    }
    
    /** 判断数据的加载*/
    if (self.searchVC.active) {
        cell.textLabel.text = self.searchSource[indexPath.row];
        
    } else
        cell.textLabel.text = self.tableSource[indexPath.row];

    /** 设置 cell 的标题*/
//    cell.textLabel.text = self.tableSource[indexPath.row];
    
    /** 设置 cell 的副标题信息*/
    cell.detailTextLabel.text = self.singleArray[indexPath.row];
    [cell.detailTextLabel setTextColor:[UIColor redColor]];
    
    /** 设置系统样式的 cell 挂件*/
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    return cell;
}


#pragma make - 搜索页面的 UISearchResultsUpdating

/** 搜索框被交互的时候触发回调，搜索框里的text变化的时候触发回调*/
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    /** 把上一次搜索的数据清空*/
    if (self.searchSource != nil) {
        [self.searchSource removeAllObjects];
    }
    
    /** 过滤数据（需要一个数组保留过滤出来的数据）*/
    NSString *searchMsg = self.searchVC.searchBar.text;
    
    for (NSString *model in self.tableSource) {
        NSRange range = [model rangeOfString:searchMsg];
        if (range.location != NSNotFound) {
            
            /** 搜索框保存过滤数据*/
            [self.searchSource addObject:model];
        }
    }
    
    /** 把数据提供给表格对象，刷新表格*/
    [self.tableView reloadData];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
