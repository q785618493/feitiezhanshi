//
//  SettingsViewController.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/4.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingsTableView.h"

@interface SettingsViewController ()

@property (strong, nonatomic) SettingsTableView *cellSettingsView;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self navSideView];
    [self.navLabel setText:@"系统设置"];
    
    self.cellSettingsView = [[SettingsTableView alloc] initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT - 64) style:(UITableViewStyleGrouped)];
    [self.cellSettingsView setBackgroundColor:RGB(240, 240, 240)];
    [self.view addSubview:self.cellSettingsView];
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
