//
//  ContactViewController.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/4.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "ContactViewController.h"
#import "GroupCarsModel.h"

@interface ContactViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) NSArray *dataArray;

@end

@implementation ContactViewController

- (NSArray *)dataArray {
    if (!_dataArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_simple.plist" ofType:nil];
        NSArray *oneArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *twoMuArray = [NSMutableArray array];
        for (NSDictionary *mDic in oneArray) {
            GroupCarsModel *model = [GroupCarsModel carsModelDic:mDic];
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
    [self.popLabel setText:@"我们的车"];
    
    [self cellAddTabelView];
}

- (void)cellAddTabelView {
    
    UITableView *cellTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT - 64) style:(UITableViewStyleGrouped)];
    [cellTable setDelegate:self];
    [cellTable setDataSource:self];
    [self.view addSubview:cellTable];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    GroupCarsModel *model = self.dataArray[section];
    return model.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *idCell = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:idCell];
    }
    
    GroupCarsModel *model = self.dataArray[indexPath.section];
    NSString *name = model.cars[indexPath.row];
    [cell.textLabel setText:name];
    [cell setAccessoryType:(UITableViewCellAccessoryDetailDisclosureButton)];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    GroupCarsModel *model = self.dataArray[section];
    return model.title;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    GroupCarsModel *model = self.dataArray[section];
    return model.desc;
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
