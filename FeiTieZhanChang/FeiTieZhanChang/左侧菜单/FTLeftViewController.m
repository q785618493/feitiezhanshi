//
//  FTLeftViewController.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/4.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "FTLeftViewController.h"
#import "TopLeftView.h"
#import "LeftTableView.h"
#import "OriginalViewController.h"
#import "ComradeInArmsViewController.h"
#import "ShareViewController.h"
#import "MarketplaceViewController.h"
#import "BattlefrontViewController.h"
#import "SettingsViewController.h"
#import "TradeViewController.h"
#import "ContactViewController.h"
#import "LikeViewController.h"
#import "CommentViewController.h"
#import "SearchViewController.h"
#import "SuspectImageViewController.h"
#import "EnterViewController.h"


@interface FTLeftViewController ()

@property (strong, nonatomic) TopLeftView *topView;
@property (strong, nonatomic) LeftTableView *leftCellView;


@end

@implementation FTLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:RGB(58, 58, 58)];
    [self addTopViewAndCellVie];
    
    
    
}

- (void)addTopViewAndCellVie {
    
    self.topView = [[TopLeftView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH - 45, 196)];
    [self.view addSubview:self.topView];
    
    
    self.leftCellView = [[LeftTableView alloc] initWithFrame:CGRectMake(0, 196, VIEW_WIDTH - 45, VIEW_HEIGHT - 196) style:(UITableViewStylePlain)];
    [self.view addSubview:self.leftCellView];
    
    WS(weakSelf);
    
    /**left TopView Btn 点击事件的跳转方法*/
    weakSelf.topView.topBtnTag = ^(NSInteger btnTag) {
        switch (btnTag) {
            case 1: {
                EnterViewController *enterVC = [[EnterViewController alloc] init];
                [self presentViewController:enterVC animated:YES completion:nil];
            }
                break;
            case 2: {
                EnterViewController *enterVC = [[EnterViewController alloc] init];
                [self presentViewController:enterVC animated:YES completion:nil];
            }
                break;
            case 3: {
                TradeViewController *tradeVC = [[TradeViewController alloc] init];
                [self presentViewController:tradeVC animated:YES completion:nil];
            }
                break;
            case 4: {
                ContactViewController *contactVC = [[ContactViewController alloc] init];
                [self presentViewController:contactVC animated:YES completion:nil];
            }
                break;
            case 5: {
                LikeViewController *likeVC = [[LikeViewController alloc] init];
                [self presentViewController:likeVC animated:YES completion:nil];
            }
                break;
            case 6: {
                CommentViewController *commentVC = [[CommentViewController alloc] init];
                [self presentViewController:commentVC animated:YES completion:nil];
            }
                break;
            case 7: {
                SearchViewController *searchVC = [[SearchViewController alloc] init];
                [self presentViewController:searchVC animated:YES completion:nil];
            }
            default:
                break;
        }
    };
    
    /**left cell 跳转界面的 Block*/
    weakSelf.leftCellView.cellIndexRow = ^(NSInteger cellRow) {
        switch (cellRow) {
            case 0: {
                /**初始化页面*/
                OriginalViewController *originalVC = [[OriginalViewController alloc] init];
                /**设置根视图*/
                UINavigationController *naviagationVC = [[UINavigationController alloc] initWithRootViewController:originalVC];
                /**进行页面跳转*/
                [self.sideMenuViewController setContentViewController:naviagationVC animated:YES];
                /**隐藏侧边菜单*/
                [self.sideMenuViewController hideMenuViewController];
                }
                break;
            case 1: {
                ComradeInArmsViewController *comradeVC = [[ComradeInArmsViewController alloc] init];
                UINavigationController *naviagationVC = [[UINavigationController alloc] initWithRootViewController:comradeVC];
                [self.sideMenuViewController setContentViewController:naviagationVC animated:YES];
                [self.sideMenuViewController hideMenuViewController];
            }
                break;
            case 2: {
                ShareViewController *shareVC = [[ShareViewController alloc] init];
                UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:shareVC];
                [self.sideMenuViewController setContentViewController:navigationVC animated:YES];
                [self.sideMenuViewController hideMenuViewController];
            }
                break;
            case 3: {
                MarketplaceViewController *marketplaceVC = [[MarketplaceViewController alloc] init];
                UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:marketplaceVC];
                [self.sideMenuViewController setContentViewController:navigationVC animated:YES];
                [self.sideMenuViewController hideMenuViewController];
            }
                break;
            case 4: {
                BattlefrontViewController *battlefrontVC = [[BattlefrontViewController alloc] init];
                UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:battlefrontVC];
                [self.sideMenuViewController setContentViewController:navigationVC animated:YES];
                [self.sideMenuViewController hideMenuViewController];
            }
                break;
            case 5: {
                SuspectImageViewController *imageVC = [[SuspectImageViewController alloc] init];
                UINavigationController *navigationVC = [[UINavigationController alloc] initWithRootViewController:imageVC];
                [self.sideMenuViewController setContentViewController:navigationVC];
                [self.sideMenuViewController hideMenuViewController];
            }
                break;
            case 6: {
                SettingsViewController *settingsVC = [[SettingsViewController alloc] init];
                UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:settingsVC];
                [self.sideMenuViewController setContentViewController:navigation animated:YES];
                [settingsVC.sideMenuViewController hideMenuViewController];
            }
            default:
                break;
        }
    };
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
