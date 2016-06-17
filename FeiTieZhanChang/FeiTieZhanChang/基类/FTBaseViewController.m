//
//  FTBaseViewController.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/4.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "FTBaseViewController.h"

@interface FTBaseViewController ()

@end

@implementation FTBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

/** 创建自定义导航栏*/
- (void)navSideView {
    
    /** yinc系统样式的导航栏*/
    self.navigationController.navigationBar.hidden = YES;
    
    self.navView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, VIEW_WIDTH, 44)];
    [self.view addSubview:self.navView];
    
    UIButton *sideBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [sideBtn setFrame:CGRectMake(10, 0, 44, 44)];
    [sideBtn setBackgroundImage:[UIImage imageNamed:@"菜单"] forState:(UIControlStateNormal)];
    [sideBtn addTarget:self action:@selector(sideBtnTouchAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.navView addSubview:sideBtn];
    
    UILabel *wireLabel = [[UILabel alloc] initWithFrame:CGRectMake(54, 0, 1, 44)];
    [wireLabel setBackgroundColor:RGB(222, 222, 222)];
    [self.navView addSubview:wireLabel];
    
    self.navLabel = [[UILabel alloc] initWithFrame:CGRectMake(65, 14, 112, 16)];
    [self.navLabel setFont:[UIFont systemFontOfSize:14.0]];
    [self.navView addSubview:self.navLabel];
}

/** 返回左侧菜单的点击事件*/
- (void)sideBtnTouchAction {
    [self.sideMenuViewController presentLeftMenuViewController];
}


/** 返回模态视图的导航栏*/
- (void)popNavView {
    self.popView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, VIEW_WIDTH, 44)];
    [self.view addSubview:self.popView];
    
    UIButton *popBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [popBtn setFrame:CGRectMake(8, 10, 36, 24)];
    [popBtn setBackgroundImage:[UIImage imageNamed:@"箭头"] forState:(UIControlStateNormal)];
    [popBtn addTarget:self action:@selector(popBtnTouchAction) forControlEvents:(UIControlEventTouchUpInside)];
    [self.popView addSubview:popBtn];
    
    UILabel *wireLabel = [[UILabel alloc] initWithFrame:CGRectMake(54, 0, 1, 44)];
    [wireLabel setBackgroundColor:RGB(222, 222, 222)];
    [self.popView addSubview:wireLabel];
    
    self.popLabel = [[UILabel alloc] initWithFrame:CGRectMake(65, 12, 98, 20)];
    [self.popLabel setFont:[UIFont systemFontOfSize:14.0]];
    [self.popView addSubview:self.popLabel];
    
}

/** 模态视图返回上一层的点击事件*/
- (void)popBtnTouchAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}


/** 返回压栈的导航栏视图*/
- (void)addReturnNavView {
    self.returenView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, VIEW_WIDTH, 44)];
    [self.view addSubview:self.returenView];
    
    UIButton *popBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [popBtn setBackgroundImage:[UIImage imageNamed:@"箭头"] forState:(UIControlStateNormal)];
    [popBtn setFrame:CGRectMake(10, 10, 36, 24)];
    [popBtn addTarget:self action:@selector(returnPopBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.returenView addSubview:popBtn];
    
    UILabel *wireLabel = [[UILabel alloc] initWithFrame:CGRectMake(54, 0, 1, 44)];
    [wireLabel setBackgroundColor:RGB(184, 184, 184)];
    [self.returenView addSubview:wireLabel];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(64, 12, 98, 20)];
    [self.nameLabel setFont:[UIFont systemFontOfSize:14.0]];
    [self.returenView addSubview:self.nameLabel];
}

/** 返回压栈的按钮方法*/
- (void)returnPopBtn {
    [self.navigationController popViewControllerAnimated:YES];
}


/** GET 网络请求方法*/
- (void)GETHttpRequwstUrl:(NSString *)url
                      dic:(NSDictionary *)dic
             successBlock:(HttpSuccessBlock)RequestSuccess
               errorBlock:(HttpErrorBlock)RequestError {
    
    WS(weakSelf);
    /** 显示等待动画(工具类方法)*/
    [JPRefreshView showJPRefreshFromView:weakSelf.view];
    
    [ZJPBaseHttpTool getWithPath:url params:dic success:^(id JSON) {
        
        if (RequestSuccess) {
            
            RequestSuccess(JSON);
        }
        /**移除等待动画*/
        [JPRefreshView removeJPRefreshFromView:weakSelf.view];
        
    } failure:^(NSError *error) {
        
        if (RequestError) {
            
            RequestError(error);
        }
        /**移除等待动画*/
        [JPRefreshView removeJPRefreshFromView:weakSelf.view];
    }];
    
}


/** POST 网络请求方法*/
- (void)POSTHttpRequestUrl:(NSString *)url
                       dic:(NSDictionary *)dic
              successBlock:(HttpSuccessBlock)RequestSuccess
                errorBlock:(HttpErrorBlock)RequestError {
    
    WS(weakSelf);
    /** 显示等待动画*/
    [JPRefreshView showJPRefreshFromView:weakSelf.view];
    [ZJPBaseHttpTool postWithPath:url params:dic success:^(id JSON) {
        if (RequestSuccess) {
            RequestSuccess(JSON);
        }
        [JPRefreshView removeJPRefreshFromView:weakSelf.view];
    } failure:^(NSError *error) {
        if (RequestError) {
            RequestError(error);
        }
        [JPRefreshView removeJPRefreshFromView:weakSelf.view];
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
