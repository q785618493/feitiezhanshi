//
//  MarketplaceViewController.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/4.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "MarketplaceViewController.h"
#import "Ichiban.h"
#import "MarketTableView.h"

static NSInteger number = 1;

@interface MarketplaceViewController ()

@property (strong, nonatomic) Ichiban *modelMarket;
@property (strong, nonatomic) MarketTableView *cellMarketView;

@end

@implementation MarketplaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self navSideView];
    [self.navLabel setText:@"市场动向"];
    
    self.cellMarketView = [[MarketTableView alloc] initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT - 64) style:(UITableViewStylePlain)];
    [self.cellMarketView setBackgroundColor:RGB(250, 250, 250)];
    [self.view addSubview:self.cellMarketView];
    
    [self addMarketplacePostDataLimit:10];
    
    WS(weakSelf);
    weakSelf.cellMarketView.newDataBLock = ^() {
        [weakSelf addMarketplacePostDataLimit:10];
        number = 1;
    };
    weakSelf.cellMarketView.moreDataBlock = ^() {
        [weakSelf addMarketplacePostDataLimit:10 * number];
    };
}

- (void)addMarketplacePostDataLimit:(NSInteger)limit {
    NSDictionary *requestDic = @{@"auth":@"W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI",
                                 @"client":@"1",
                                 @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                                 @"limit":[NSString stringWithFormat:@"%d",limit],
                                 @"start":@"0",
                                 @"version":@"3.0.7"};
    WS(weakSelf);
    [self POSTHttpRequestUrl:@"http://api2.pianke.me/pub/shop" dic:requestDic successBlock:^(id JSON) {
        NSDictionary *dataDic = JSON;
        if (1 == [dataDic[@"result"] integerValue]) {
            weakSelf.modelMarket = [[Ichiban alloc] initWithDictionary:dataDic];
//            [weakSelf.cellMarketView.arrayData addObjectsFromArray:weakSelf.modelMarket.data.list];
            weakSelf.cellMarketView.arrayData = weakSelf.modelMarket.data.list;
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.cellMarketView reloadData];
            });
        }
        [weakSelf.cellMarketView.mj_header endRefreshing];
        [weakSelf.cellMarketView.mj_footer endRefreshing];
    } errorBlock:^(NSError *error) {
        NSLog(@"--error==%@==",error);
    }];
    number ++;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
