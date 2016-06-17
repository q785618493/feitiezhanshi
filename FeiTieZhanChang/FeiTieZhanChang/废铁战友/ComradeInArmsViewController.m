//
//  ComradeInArmsViewController.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/4.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "ComradeInArmsViewController.h"
#import "NineBtnViewController.h"
#import "TopView.h"
#import "MiddleNineBtnView.h"
#import "ReadingHead.h"

@interface ComradeInArmsViewController ()

@property (strong, nonatomic) UIScrollView *comradeScroll;
@property (strong, nonatomic) TopView *carouselView;
@property (strong, nonatomic) MiddleNineBtnView *nineBtnView;
@property (strong, nonatomic) ReadingModelReadingClass *model;
@property (strong, nonatomic) ReadingModelList *dataList;

@end

@implementation ComradeInArmsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self navSideView];
    [self.navLabel setText:@"废铁战友"];
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.comradeScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT - 64)];
    [self.comradeScroll setBackgroundColor:RGB(250, 250, 250)];
    [self.view addSubview:self.comradeScroll];
    [self.comradeScroll setContentOffset:CGPointZero];
    [self.comradeScroll setContentSize:CGSizeMake(VIEW_WIDTH, VIEW_WIDTH + VIEW_HEIGHT / 4.0)];
    [self.comradeScroll setBounces:NO];
    [self.comradeScroll setPagingEnabled:YES];
    [self.comradeScroll setShowsVerticalScrollIndicator:YES];
    [self.comradeScroll setShowsHorizontalScrollIndicator:YES];
    
    [self comradePostData];
    
}

- (void)comradePostData {
    NSDictionary *requestDic = @{@"auth":@"W8c8Fivl9flDCsJzH8HukzJxQMrm3N7KP9Wc5WTFjcWP229VKTBRU7vI",
                                 @"client":@"1",
                                 @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                                 @"version":@"3.0.7"};
    WS(weakSelf);
    [self POSTHttpRequestUrl:@"http://api2.pianke.me/read/columns" dic:requestDic successBlock:^(id JSON) {
        NSDictionary *dicData = JSON;
        if (1 == [dicData[@"result"] integerValue]) {
            weakSelf.model = [[ReadingModelReadingClass alloc] initWithDictionary:dicData];
        }
        weakSelf.nineBtnView = [[MiddleNineBtnView alloc] initWithFrame:CGRectMake(0, VIEW_HEIGHT - VIEW_WIDTH, VIEW_WIDTH, VIEW_WIDTH) imageArray:weakSelf.model.data.list];
        [weakSelf.nineBtnView setBackgroundColor:RGB(250, 250, 250)];
        [weakSelf.view addSubview:weakSelf.nineBtnView];
        weakSelf.nineBtnView.btnTag = ^(NSInteger btnTag) {
            
            NineBtnViewController *nineVC = [[NineBtnViewController alloc] init];
            weakSelf.dataList = weakSelf.model.data.list[btnTag];
            nineVC.typeID = weakSelf.dataList.type;
            nineVC.nameStr = weakSelf.dataList.name;
            [weakSelf.navigationController pushViewController:nineVC animated:YES];
        };
        weakSelf.carouselView = [[TopView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT - 64 - VIEW_WIDTH) andImagesTop:weakSelf.model.data.carousel];
        [weakSelf.carouselView setBackgroundColor:RGB(250, 250, 250)]; 
        [weakSelf.comradeScroll addSubview:weakSelf.carouselView];

    } errorBlock:^(NSError *error) {
        NSLog(@"----error==%@==----",error);
    }];
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
