//
//  TradeViewController.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/4.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "TradeViewController.h"
#import "JYCarsModel.h"
#import "InfoModelCar.h"

@interface TradeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) NSArray *dataArray;

@end

@implementation TradeViewController

- (NSArray *)dataArray {
    if (!_dataArray) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_total.plist" ofType:nil];
        NSArray *oneArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *twoMuArray = [NSMutableArray array];
        
        for (NSDictionary *dic in oneArray) {
            JYCarsModel *model = [JYCarsModel carsModelDic:dic];
            [twoMuArray addObject:model];
        }
        _dataArray = twoMuArray;
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self popNavView];
    [self.popLabel setText:@"名车品牌录"];
    
    [self cellTableAddView];
}

- (void)cellTableAddView {
    
    UITableView *cellView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT - 64) style:(UITableViewStylePlain)];
    [cellView setDelegate:self];
    [cellView setDataSource:self];
    [self.view addSubview:cellView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    JYCarsModel *model = self.dataArray[section];
    return model.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *idCell = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:idCell];
    }
    JYCarsModel *sModel = self.dataArray[indexPath.section];
    InfoModelCar *rModel = sModel.cars[indexPath.row];
    [cell.textLabel setText:rModel.name];
    [cell.imageView setImage:[UIImage imageNamed:rModel.icon]];
    [cell setAccessoryType:(UITableViewCellAccessoryDisclosureIndicator)];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    JYCarsModel *model = self.dataArray[section];
    return model.title;
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [self.dataArray valueForKey:@"title"];
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
