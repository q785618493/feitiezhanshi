//
//  NineBtnViewController.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/10.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "NineBtnViewController.h"
#import "HeaderNineBtn.h"
#import "StoryTableView.h"
#import "NewStoryTableView.h"
#import "InfoNineBtnViewController.h"

static NSInteger number1 = 1;
static NSInteger number2 = 1;

@interface NineBtnViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *nineScroll;
@property (strong, nonatomic) StoryTableView *hotCellView;
@property (strong, nonatomic) NewStoryTableView *NewCellView;
@property (strong, nonatomic) BtnNine *modelHot;
@property (strong, nonatomic) BtnNine *modelNew;

@property (strong ,nonatomic) UIButton *hotBtn;
@property (strong, nonatomic) UIButton *addTimeBtn;
@property (strong, nonatomic) UILabel *wireLabel;


@end

@implementation NineBtnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self addReturnNavView];
    [self.nameLabel setText:self.nameStr];
    [self addNavBtn];
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.nineScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT - 64)];
    self.nineScroll.delegate = self;
    [self.nineScroll setBackgroundColor:RGB(250, 250, 250)];
    [self.view addSubview:self.nineScroll];
    
    [self.nineScroll setBounces:NO];
    [self.nineScroll setPagingEnabled:YES];
    [self.nineScroll setShowsVerticalScrollIndicator:YES];
    [self.nineScroll setShowsHorizontalScrollIndicator:YES];
    [self.nineScroll setContentOffset:CGPointZero];
    [self.nineScroll setContentSize:CGSizeMake(VIEW_WIDTH * 2, VIEW_HEIGHT - 64)];
    
    self.hotCellView = [[StoryTableView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT - 64) style:(UITableViewStylePlain)];
    [self.hotCellView setBackgroundColor:RGB(248, 248, 248)];
    [self.nineScroll addSubview:self.hotCellView];
    
    self.NewCellView = [[NewStoryTableView alloc] initWithFrame:CGRectMake(VIEW_WIDTH, 0, VIEW_WIDTH, VIEW_HEIGHT - 64) style:(UITableViewStylePlain)];
    [self.NewCellView setBackgroundColor:RGB(248, 248, 248)];
    [self.nineScroll addSubview:self.NewCellView];
    
    [self nineBtnViewHotPostLimit:10];
    
    WS(weakSelf);
    weakSelf.hotCellView.newDataBlock = ^() {
        number1 = 1;
        [weakSelf nineBtnViewHotPostLimit:10];
    };
    
    weakSelf.hotCellView.moreDataBlock = ^() {
        [weakSelf nineBtnViewHotPostLimit:10 * number1];
    };
    
    weakSelf.NewCellView.newDataBlock = ^() {
        number2 = 1;
        [weakSelf newNineBtnViewPostLimit:10];
    };
    
    weakSelf.NewCellView.moreDataBlock = ^() {
        [weakSelf newNineBtnViewPostLimit:10 * number2];
    };
    
    weakSelf.hotCellView.indexCellRow = ^(NSInteger cellRow) {
        
        InfoNineBtnViewController *infoVC = [[InfoNineBtnViewController alloc] init];
        
        [self.navigationController pushViewController:infoVC animated:YES];
    };
    
    weakSelf.NewCellView.indexCellRow = ^(NSInteger cellRow) {
        
        InfoNineBtnViewController *infoVC = [[InfoNineBtnViewController alloc] init];
        
        [self.navigationController pushViewController:infoVC animated:YES];
    };
}


/** 给导航栏添加按钮*/
- (void)addNavBtn {
    
    self.hotBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.hotBtn setTag:1111];
    [self.hotBtn setSelected:YES];
    [self.hotBtn setFrame:CGRectMake(VIEW_WIDTH / 2.0 + 50, 7, 30, 30)];
    [self.hotBtn setBackgroundImage:[UIImage imageNamed:@"hot_nomal"] forState:(UIControlStateNormal)];
    [self.hotBtn setBackgroundImage:[UIImage imageNamed:@"hot_selected"] forState:(UIControlStateSelected)];
    [self.hotBtn addTarget:self action:@selector(touchUpActionBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.returenView addSubview:self.hotBtn];
    
    self.addTimeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.addTimeBtn setTag:1112];
    [self.addTimeBtn setFrame:CGRectMake(VIEW_WIDTH/ 2.0 + 100, 7, 30, 30)];
    [self.addTimeBtn setBackgroundImage:[UIImage imageNamed:@"new_nomal"] forState:(UIControlStateNormal)];
    [self.addTimeBtn setBackgroundImage:[UIImage imageNamed:@"new_selected"] forState:(UIControlStateSelected)];
    [self.addTimeBtn addTarget:self action:@selector(touchUpActionBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.returenView addSubview:self.addTimeBtn];
    
    self.wireLabel = [[UILabel alloc] initWithFrame:CGRectMake(VIEW_WIDTH / 2.0 + 50, 43, 30, 1)];
    [self.wireLabel setBackgroundColor:[UIColor blackColor]];
    [self.returenView addSubview:self.wireLabel];
}

- (void)touchUpActionBtn:(UIButton *)btn {
    switch (btn.tag) {
        case 1111:
            [self.hotBtn setSelected:YES];
            [self.addTimeBtn setSelected:NO];
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.2];
            [self.wireLabel setFrame:CGRectMake(VIEW_WIDTH / 2.0 + 50, 43, 30, 1)];
            [UIView commitAnimations];
            [self.nineScroll setContentOffset:CGPointMake(0, 0) animated:YES];
            
            break;
        case 1112:
            [self.hotBtn setSelected:NO];
            [self.addTimeBtn setSelected:YES];
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.2];
            [self.wireLabel setFrame:CGRectMake(VIEW_WIDTH / 2.0 + 100, 43, 30, 1)];
            [UIView commitAnimations];
            if (nil == self.NewCellView.arrayData) {
                [self newNineBtnViewPostLimit:10];
            }
            
            [self.nineScroll setContentOffset:CGPointMake(VIEW_WIDTH, 0) animated:YES];
        default:
            break;
    }
}

- (void)nineBtnViewHotPostLimit:(NSInteger)limit {
    NSDictionary *requestDic = @{@"auth":@"WsFvESWw8PlDCsJyH8DulDJxQJKrNr6EpGprWTVicWP229VEQxxV6m3w@",
                                 @"client":@"1",
                                 @"deviceid":@"4CC25C98-110E-4B23-89A6-7EABFB660807",
                                 @"limit":[NSString stringWithFormat:@"%ld",limit],
                                 @"sort":@"hot",
                                 @"start":@"0",
                                 @"typeid":[NSString stringWithFormat:@"%ld",self.typeID],
                                 @"version":@"3.0.7"};
    WS(weakSelf);
    [self POSTHttpRequestUrl:@"http://api2.pianke.me/read/columns_detail" dic:requestDic successBlock:^(id JSON) {
        NSDictionary *dataDic = JSON;
        if (1 == [dataDic[@"result"] integerValue]) {
            weakSelf.modelHot = [[BtnNine alloc] initWithDictionary:dataDic];
            weakSelf.hotCellView.arrayData = weakSelf.modelHot.data.list;
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.hotCellView reloadData];
            });
        }
        [weakSelf.hotCellView.mj_header endRefreshing];
        [weakSelf.hotCellView.mj_footer endRefreshing];
        
    } errorBlock:^(NSError *error) {
        NSLog(@"---erroe==%@==---",error);
    }];
    number1 ++;
}

- (void)newNineBtnViewPostLimit:(NSInteger)limit {
    NSDictionary *requestDic = @{@"auth":@"WsFvESWw8PlDCsJyH8DulDJxQJKrNr6EpGprWTVicWP229VEQxxV6m3w@",
                                 @"client":@"1",
                                 @"deviceid":@"4CC25C98-110E-4B23-89A6-7EABFB660807",
                                 @"limit":[NSString stringWithFormat:@"%ld",limit],
                                 @"sort":@"addtime",
                                 @"start":@"0",
                                 @"typeid":[NSString stringWithFormat:@"%ld",self.typeID],
                                 @"version":@"3.0.7"};
    WS(weakSelf);
    [self POSTHttpRequestUrl:@"http://api2.pianke.me/read/columns_detail" dic:requestDic successBlock:^(id JSON) {
        NSDictionary *dataDic = JSON;
        if (1 == [dataDic[@"result"] integerValue]) {
            weakSelf.modelNew = [[BtnNine alloc] initWithDictionary:dataDic];
            weakSelf.NewCellView.arrayData = weakSelf.modelNew.data.list;
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.NewCellView reloadData];
            });
        }
        [weakSelf.NewCellView.mj_header endRefreshing];
        [weakSelf.NewCellView.mj_footer endRefreshing];
    } errorBlock:^(NSError *error) {
        NSLog(@"---error=%@=---",error);
    }];
    number2 ++;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma make- 废铁战友的 UIScrollViewDelegate 
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / VIEW_WIDTH;
    if (0 == index) {
        [self touchUpActionBtn:self.hotBtn];
    } else {
        [self touchUpActionBtn:self.addTimeBtn];
    }
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
