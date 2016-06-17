//
//  CommentViewController.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/4.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "CommentViewController.h"
#import "RollView.h"

@interface CommentViewController ()

@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self popNavView];
    [self.popLabel setText:@"废铁电台"];
    
    [self topAddRollView];
}

- (void)topAddRollView {
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEIGHT - 64)];
    [scrollView setBounces:NO];
    [scrollView setShowsHorizontalScrollIndicator:NO];
    [scrollView setShowsVerticalScrollIndicator:NO];
    [self.view addSubview:scrollView];
    
    NSArray *imageArray = @[@"img_01",@"img_02",@"img_03",@"img_04",@"img_05"];
    RollView *rollView = [[RollView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 150) photoArray:imageArray];
    [scrollView addSubview:rollView];
    
    NSArray *sexArray = @[@"finditem_ad",@"finditem_hotpeople",@"finditem_hotsound",@"finditem_newpeople",@"finditem_newsound",@"finditem_wallspoint"];
    
    CGFloat width = (VIEW_WIDTH - 145 * 2) / 3.0;
    
    UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake(0, 150, VIEW_WIDTH, 145 * 3 + 75 + width * 5)];
    [scrollView addSubview:centerView];
    
    for (NSInteger i = 0; i < sexArray.count; i ++) {
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [btn setFrame:CGRectMake(i % 2 * (145 + width) + width, i / 2 * (145 + width) + width, 145, 145)];
        [btn setImage:[UIImage imageNamed:sexArray[i]] forState:(UIControlStateNormal)];
        [centerView addSubview:btn];
    }
    
    UIButton *bottomBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [bottomBtn setFrame:CGRectMake(width, 145 * 3 + 40, VIEW_WIDTH - width * 2, 75)];
    [bottomBtn setImage:[UIImage imageNamed:@"finditem_iwannabehere"] forState:(UIControlStateNormal)];
    [centerView addSubview:bottomBtn];
    
    CGFloat maxY = CGRectGetMaxY(centerView.frame);
    
    [scrollView setContentOffset:CGPointZero];
    [scrollView setContentSize:CGSizeMake(VIEW_WIDTH, maxY)];
    
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
