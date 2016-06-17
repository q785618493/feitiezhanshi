//
//  ShareViewController.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/4.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "ShareViewController.h"
#import "ShareHeader.h"
#import "ShareTableView.h"
#import "NSArray+CellShareHeight.h"

static NSInteger number = 1;

@interface ShareViewController ()

@property (strong, nonatomic) ShareTableView *cellShareView;
@property (strong, nonatomic) FTShare *model;


@end

@implementation ShareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self navSideView];
    [self.navLabel setText:@"废铁分享"];
    
    self.cellShareView = [[ShareTableView alloc] initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT - 64) style:(UITableViewStylePlain)];
    [self.view addSubview:self.cellShareView];
    [self.cellShareView setBackgroundColor:RGB(250, 250, 250)];
    
    if (nil == self.cellShareView.arrayData) {
        [self sharePostDataLimit:10];
    }
    
    WS(weakSelf);
    weakSelf.cellShareView.newDataBlock = ^() {
        [weakSelf sharePostDataLimit:10];
        number = 1;
    };
    weakSelf.cellShareView.moreDataBlock = ^() {
        [weakSelf sharePostDataLimit:10 * number];
    };
}

- (void)sharePostDataLimit:(NSInteger)limit {
    NSDictionary *requestDic = @{@"auth":@"W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI",
                                 @"client":@"1",
                                 @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                                 @"limit":[NSString stringWithFormat:@"%zi",limit],
                                 @"start":@"0",
                                 @"version":@"3.0.7"};
    WS(weakSelf);
    [self POSTHttpRequestUrl:@"http://api2.pianke.me/timeline/list" dic:requestDic successBlock:^(id JSON) {
        NSDictionary *dataDic = JSON;
        if (1 == [dataDic[@"result"] integerValue]) {
            weakSelf.model = [[FTShare alloc] initWithDictionary:dataDic];
            weakSelf.cellShareView.arrayHeight = [NSArray returnHeightArray:weakSelf.model.data.list];
            weakSelf.cellShareView.arrayData = weakSelf.model.data.list;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.cellShareView reloadData];
            });
        }
        [weakSelf.cellShareView.mj_header endRefreshing];
        [weakSelf.cellShareView.mj_footer endRefreshing];
        
    } errorBlock:^(NSError *error) {
        NSLog(@"--error==%@==--",error);
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
