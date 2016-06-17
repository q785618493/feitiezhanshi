//
//  BattlefrontViewController.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/4.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "BattlefrontViewController.h"
#import "FTAppView.h"
#import "FTDataModel.h"

@interface BattlefrontViewController ()

@property (strong, nonatomic) NSArray *dataArray;

@end

@implementation BattlefrontViewController

- (NSArray *)dataArray {
    if (!_dataArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *muArray = [NSMutableArray array];
        for (NSDictionary *dicModel in array) {
            FTDataModel *model = [[FTDataModel alloc] initWithDataModelDic:dicModel];
            [muArray addObject:model];
        }
        _dataArray = muArray;
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self navSideView];
    [self.navLabel setText:@"废铁前线"];
    
    UIView *appView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT - 64)];
    [appView setBackgroundColor:RGB(246, 246, 246)];
    [self.view addSubview:appView];
    
    CGFloat viewWidth = (VIEW_WIDTH - 75 * 3) / 4.0;
    
    for (NSInteger i = 0; i < self.dataArray.count; i ++) {
        FTAppView *app = [[FTAppView alloc] init];
        app.modelData = self.dataArray[i];
        [app.downBtn addTarget:self action:@selector(appDownTouchBtn:) forControlEvents:(UIControlEventTouchUpInside)];
        [appView addSubview:app];
        [app mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(75, 90));
            make.left.mas_equalTo(appView.mas_left).offset(i % 3 * (75 + viewWidth) + viewWidth);
            make.top.mas_equalTo(appView.mas_top).offset(i / 3 * (90 + viewWidth) + viewWidth);
            
        }];
    }
    
}

- (void)appDownTouchBtn:(UIButton *)btn {
    btn.selected = !btn.selected;
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
