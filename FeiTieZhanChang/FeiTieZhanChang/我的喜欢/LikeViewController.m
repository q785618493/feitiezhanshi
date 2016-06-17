//
//  LikeViewController.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/4.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "LikeViewController.h"
#import "HerosLolModel.h"

@interface LikeViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>

@property (strong, nonatomic) NSArray *dataArray;

@end

@implementation LikeViewController

- (NSArray *)dataArray {
    if (!_dataArray) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"heros.plist" ofType:nil];
        NSArray *oneArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *twoMuArray = [NSMutableArray array];
        
        for (NSDictionary *dic in oneArray) {
            HerosLolModel *model = [HerosLolModel lolModelDic:dic];
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
    [self.popLabel setText:@"撸啊撸的联盟"];
    
    [self cellAddTableView];
}

- (void)cellAddTableView {
    UITableView *cellTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT - 64) style:(UITableViewStylePlain)];
    [cellTable setTag:90000];
    [cellTable setDelegate:self];
    [cellTable setDataSource:self];
    [cellTable setBounces:NO];
    [cellTable setShowsHorizontalScrollIndicator:NO];
    [cellTable setShowsVerticalScrollIndicator:NO];
    [self.view addSubview:cellTable];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *idCell = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idCell];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:idCell];
    }
    
    HerosLolModel *model = self.dataArray[indexPath.row];
    [cell.textLabel setText:model.name];
    [cell.imageView setImage:[UIImage imageNamed:model.icon]];
    [cell.detailTextLabel setText:model.intro];
    [cell setAccessoryType:(UITableViewCellAccessoryDisclosureIndicator)];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HerosLolModel *model = self.dataArray[indexPath.row];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"编辑英雄信息" message:nil delegate:self cancelButtonTitle:@"⭐️取消⭐️" otherButtonTitles:@"⭐️确定⭐️", nil];
    [alert setTag:indexPath.row];
    [alert setAlertViewStyle:(UIAlertViewStylePlainTextInput)];
    [alert textFieldAtIndex:0].text = model.name;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (1 == buttonIndex) {
        NSString *name = [alertView textFieldAtIndex:0].text;
        HerosLolModel *model = self.dataArray[alertView.tag];
        model.name = name;
        
        UITableView *cellTable = (UITableView *)[self.view viewWithTag:90000];
        NSIndexPath *index = [NSIndexPath indexPathForRow:alertView.tag inSection:0];
        [cellTable reloadRowsAtIndexPaths:@[index] withRowAnimation:(UITableViewRowAnimationBottom)];
    }
    
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
