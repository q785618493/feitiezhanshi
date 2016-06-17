//
//  OriginalViewController.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/4.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "OriginalViewController.h"
#import "OriginalTableView.h"
#import "OriginalityHeader.h"
#import "TimeAddTableView.h"

static NSInteger number1 = 1;
static NSInteger number2 = 1;

@interface OriginalViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) OriginalTableView *cellOriginal;
@property (strong, nonatomic) ReadClassReadModel *hotModel;
@property (strong, nonatomic) TimeAddTableView *timeAddCellView;
@property (strong, nonatomic) ReadClassReadModel *addTimeModel;

@property (strong, nonatomic) UIButton *hotBtn;
@property (strong, nonatomic) UIButton *addTimeBtn;
@property (strong, nonatomic) UILabel *lineLabel;

@end

@implementation OriginalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /** 从 info.plist 里拿到当前应用的版本号*/
//    NSString *version = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
//    ZDYLOG(@"---%@",version);
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self navSideView];
    [self.navLabel setText:@"废铁原创"];
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT - 64)];
    self.scrollView.delegate = self;
    [self.scrollView setBackgroundColor:RGB(250, 250, 250)];
    [self.view addSubview:self.scrollView];
    
    [self.scrollView setBounces:NO];
    [self.scrollView setContentOffset:CGPointZero];
    [self.scrollView setContentSize:CGSizeMake(VIEW_WIDTH * 2, VIEW_HEIGHT - 90)];
    [self.scrollView setPagingEnabled:YES];
    [self.scrollView setShowsVerticalScrollIndicator:YES];
    [self.scrollView setShowsHorizontalScrollIndicator:YES];
    
    self.cellOriginal = [[OriginalTableView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT - 90) style:(UITableViewStylePlain)];
    [self.cellOriginal setBackgroundColor:RGB(250, 250, 250)];
    [self.scrollView addSubview:self.cellOriginal];
    
    self.timeAddCellView = [[TimeAddTableView alloc] initWithFrame:CGRectMake(VIEW_WIDTH, 0, VIEW_WIDTH, VIEW_HEIGHT - 90) style:(UITableViewStylePlain)];
    [self.timeAddCellView setBackgroundColor:RGB(250, 250, 250)];
    [self.scrollView addSubview:self.timeAddCellView];
    
    [self addViewBtn];
    
    if (nil == self.cellOriginal.arrayData) {
        [self originalPostDataStart:0 limit:10];
    }
    
    
    WS(weakSelf);
    weakSelf.cellOriginal.NewDataBlock = ^() {
        number1 = 1;
        [weakSelf originalPostDataStart:0 limit:10];
    };
    weakSelf.cellOriginal.MoreDataBlock = ^() {
        [weakSelf originalPostDataStart:0 limit:10 * number1];
    };
    
    weakSelf.timeAddCellView.NewDataBlock = ^() {
        number2 = 1;
        [weakSelf newPostDataStart:0 limit:10];
    };
    weakSelf.timeAddCellView.MoreDataBLock = ^() {
        [weakSelf newPostDataStart:0 limit:10 * number2];
    };
}

- (void)addViewBtn {
    self.hotBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.hotBtn setTag:999];
    [self.hotBtn setSelected:YES];
    [self.hotBtn setFrame:CGRectMake(VIEW_WIDTH / 2.0 + 50, 7, 30, 30)];
    [self.hotBtn setBackgroundImage:[UIImage imageNamed:@"hot_nomal"] forState:(UIControlStateNormal)];
    [self.hotBtn setBackgroundImage:[UIImage imageNamed:@"hot_selected"] forState:(UIControlStateSelected)];
    [self.hotBtn addTarget:self action:@selector(touchActionBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.navView addSubview:self.hotBtn];
    
    self.addTimeBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.addTimeBtn setTag:998];
    [self.addTimeBtn setFrame:CGRectMake(VIEW_WIDTH/ 2.0 + 100, 7, 30, 30)];
    [self.addTimeBtn setBackgroundImage:[UIImage imageNamed:@"new_nomal"] forState:(UIControlStateNormal)];
    [self.addTimeBtn setBackgroundImage:[UIImage imageNamed:@"new_selected"] forState:(UIControlStateSelected)];
    [self.addTimeBtn addTarget:self action:@selector(touchActionBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.navView addSubview:self.addTimeBtn];
    
    self.lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(VIEW_WIDTH / 2.0 + 50, 43, 30, 1)];
    [self.lineLabel setBackgroundColor:[UIColor blackColor]];
    [self.navView addSubview:self.lineLabel];
}

- (void)touchActionBtn:(UIButton *)btn {
    switch (btn.tag) {
        case 999:
            [self.hotBtn setSelected:YES];
            [self.addTimeBtn setSelected:NO];
            [self.scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.2];
            [self.lineLabel setFrame:CGRectMake(VIEW_WIDTH / 2.0 + 50, 43, 30, 1)];
            [UIView commitAnimations];
            
            break;
        case 998:
            [self.hotBtn setSelected:NO];
            [self.addTimeBtn setSelected:YES];
            [self.scrollView setContentOffset:CGPointMake(VIEW_WIDTH, 0) animated:YES];
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.2];
            [self.lineLabel setFrame:CGRectMake(VIEW_WIDTH / 2.0 + 100, 43, 30, 1)];
            [UIView commitAnimations];
            if (nil == self.timeAddCellView.arrayData) {
                [self newPostDataStart:0 limit:10];
            }
            
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)originalPostDataStart:(NSInteger)start limit:(NSInteger)limit {

    NSDictionary *requestDic =@{@"auth":@"WsFvESWw8PlDCsJyH8DulDJxQJKrNr6EpGprWTVicWP229VEQxxV6m3w",
                                @"client":@"1",
                                @"deviceid":@"4CC25C98-110E-4B23-89A6-7EABFB660807",
                                @"limit":[NSString stringWithFormat:@"%ld",limit],
                                @"sort":@"hot",
                                @"start":[NSString stringWithFormat:@"%ld",start],
                                @"version":@"3.0.7"};
    WS(weakSelf);
    [self POSTHttpRequestUrl:@"http://api2.pianke.me/read/latest" dic:requestDic successBlock:^(id JSON) {
        NSDictionary *dicData = JSON;
        if (1 == [dicData[@"result"] integerValue]) {
            weakSelf.hotModel = [[ReadClassReadModel alloc] initWithDictionary:dicData];
            weakSelf.cellOriginal.arrayData = weakSelf.hotModel.data.list;
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.cellOriginal reloadData];
            });
        }
        [weakSelf.cellOriginal.mj_header endRefreshing];
        [weakSelf.cellOriginal.mj_footer endRefreshing];
        
    } errorBlock:^(NSError *error) {
        NSLog(@"===error---%@---===",error);
    }];
    number1 ++;
}

- (void)newPostDataStart:(NSInteger)start limit:(NSInteger)limit {
    NSDictionary *requestDic = @{@"auth":@"WsFvESWw8PlDCsJyH8DulDJxQJKrNr6EpGprWTVicWP229VEQxxV6m3w",
                                 @"client":@"1",
                                 @"deviceid":@"4CC25C98-110E-4B23-89A6-7EABFB660807",
                                 @"limit":[NSString stringWithFormat:@"%ld",limit],
                                 @"sort":@"addtime",
                                 @"start":[NSString stringWithFormat:@"%ld",start],
                                 @"version":@"3.0.7"};
    WS(weakSelf);
    [self POSTHttpRequestUrl:@"http://api2.pianke.me/read/latest" dic:requestDic successBlock:^(id JSON) {
        NSDictionary *dicData = JSON;
        if (1 == [dicData[@"result"] integerValue]) {
            weakSelf.addTimeModel = [[ReadClassReadModel alloc] initWithDictionary:dicData];
            weakSelf.timeAddCellView.arrayData = weakSelf.addTimeModel.data.list;
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.timeAddCellView reloadData];
            });
        }
        [weakSelf.timeAddCellView.mj_header endRefreshing];
        [weakSelf.timeAddCellView.mj_footer endRefreshing];
    } errorBlock:^(NSError *error) {
        NSLog(@"---error2==%@==---",error);
    }];
    number2 ++;
}

#pragma make- 废铁原创的 UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat index = scrollView.contentOffset.x / VIEW_WIDTH;
    if (0 == index) {
        [self touchActionBtn:self.hotBtn];
    } else {
        [self touchActionBtn:self.addTimeBtn];
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
