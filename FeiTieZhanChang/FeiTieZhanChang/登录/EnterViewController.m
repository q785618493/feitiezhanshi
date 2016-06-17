//
//  EnterViewController.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/30.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "EnterViewController.h"
#import "RegisterViewController.h"
#import "ThirdBottomView.h"
#import "EmailCenterView.h"

@interface EnterViewController ()<UITextFieldDelegate>

@property (strong, nonatomic) ThirdBottomView *BottomView;
@property (strong, nonatomic) EmailCenterView *centerView;

@end

@implementation EnterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self returnDisMissView];
    
    [self bottomAddView];
}

- (void)returnDisMissView {
    
    UIButton *returnBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [returnBtn setBackgroundImage:[UIImage imageNamed:@"箭头"] forState:(UIControlStateNormal)];
    [returnBtn addTarget:self action:@selector(disTouchMissBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:returnBtn];
    
    UIButton *registerBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [registerBtn.titleLabel setFont:[UIFont systemFontOfSize:20]];
    [registerBtn setTitle:@"注册" forState:(UIControlStateNormal)];
    [registerBtn setTitleColor:RGB(184, 184, 184) forState:(UIControlStateNormal)];
    [registerBtn setTitleColor:RGB(184, 184, 148) forState:(UIControlStateHighlighted)];
    [registerBtn addTarget:self action:@selector(registerTouchBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:registerBtn];
    
    UIImageView *logoImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"登录Logo"]];
    [self.view addSubview:logoImage];
    
    WS(weakSelf);
    [returnBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.view.mas_top).offset(30);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(20);
        make.size.mas_equalTo(CGSizeMake(32, 20));
    }];
    
    [registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(returnBtn.mas_centerY);
        make.right.mas_equalTo(weakSelf.view.mas_right).offset(-20);
        make.size.mas_equalTo(CGSizeMake(42, 24));
    }];
    
    [logoImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
        make.centerY.mas_equalTo(weakSelf.view.mas_centerY).offset(-130);
        make.size.mas_equalTo(CGSizeMake(159, 159));
    }];
    
}

- (void)disTouchMissBtn {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)registerTouchBtn {
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    [self presentViewController:registerVC animated:YES completion:nil];
}

- (void)bottomAddView {
    
    self.centerView = [[EmailCenterView alloc] initWithFrame:CGRectMake(0, VIEW_HEIGHT - 297, VIEW_WIDTH, 140)];
    self.centerView.emailField.delegate = self;
    self.centerView.codeField.delegate = self;
    [self.view addSubview:self.centerView];
    
    self.BottomView = [[ThirdBottomView alloc] initWithFrame:CGRectMake(0, VIEW_HEIGHT - 157, VIEW_WIDTH, 157)];
    [self.view addSubview:self.BottomView];
}

#pragma make- UITextFieldDelegate
/** 文本框和键盘一起向上偏移*/
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 90;
        weakSelf.view.bounds = rect;
    }];
    
    return YES;
}

/** 点击return隐藏键盘,将视图返回原来的位置*/
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self endTextField];
    
    WS(weakSelf);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0;
        weakSelf.view.bounds = rect;
    }];
    
    return YES;
}

/** 结束键盘和文本框的响应者链，将视图返回原来的位置*/
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self endTextField];
    WS(weakSelf);
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0;
        weakSelf.view.bounds = rect;
    }];
}

/** 结束 UITextField 的响应者链 方法*/
- (void)endTextField {
    
    [self.centerView.emailField resignFirstResponder];
    [self.centerView.codeField resignFirstResponder];
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
