//
//  RegisterViewController.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/30.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "RegisterViewController.h"
#import "CenterBottomView.h"

@interface RegisterViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate>

@property (strong, nonatomic) CenterBottomView *showView;
@property (strong, nonatomic) UIButton *headBtn;
@property (copy, nonatomic) NSString *nameImage;


@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self returnAddView];
}

- (void)returnAddView {
    
    UIButton *returnBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [returnBtn setBackgroundImage:[UIImage imageNamed:@"箭头"] forState:(UIControlStateNormal)];
    [returnBtn addTarget:self action:@selector(disTouchMissBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:returnBtn];
    
    self.headBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.headBtn setImage:[UIImage imageNamed:@"头像zc"] forState:(UIControlStateNormal)];
    [self.headBtn.layer setMasksToBounds:YES];
    [self.headBtn.layer setCornerRadius:25];
    [self.headBtn addTarget:self action:@selector(headTouchBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.headBtn];
    
    self.showView = [[CenterBottomView alloc] initWithFrame:CGRectMake(0, 180, VIEW_WIDTH, VIEW_HEIGHT - 180)];
//    [self.showView setBackgroundColor:RGB(235, 195, 76)];
    [self.showView.userField setDelegate:self];
    [self.showView.emailField setDelegate:self];
    [self.showView.codeField setDelegate:self];
    [self.showView.finishBtn addTarget:self action:@selector(finishTouchBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:self.showView];
    
    WS(weakSelf);
    [returnBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.view.mas_top).offset(30);
        make.left.mas_equalTo(weakSelf.view.mas_left).offset(20);
        make.size.mas_equalTo(CGSizeMake(32, 20));
    }];
    
    [_headBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.view.mas_top).offset(120);
        make.centerX.mas_equalTo(weakSelf.view.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
}

- (void)finishTouchBtn {
    
    //点击完成按钮隐藏键盘
    [self hiddeTextField];
    
    //判断用户名是否为空，isEmptyString方法是NSString + helper中的
    if ([_showView.userField.text isEmptyString]) {
        [self.view makeToast:@"昵称不能为空" duration:1 position:@"center"];
    }
    //判断密码是否为空，isEmptyString方法是NSString + helper中的
    else if ([_showView.codeField.text isEmptyString]) {
        [self.view makeToast:@"密码不能为空" duration:1 position:@"center"];
    }
    //判断邮箱是否为空，isEmptyString方法是NSString + helper中的
    else if ([_showView.emailField.text isEmptyString]) {
        [self.view makeToast:@"邮箱不能为空" duration:1 position:@"center"];
    }
    //判断头像是否为空，isEmptyString方法是NSString + helper中的
    else if ([_headBtn.currentImage isEqual:[UIImage imageNamed:@"头像zc"]]) {
        [self.view makeToast:@"头像不能为空" duration:1 position:@"center"];
    }
    //全部数据都设置完，开始注册的网络请求
    else {
        
        //开始进行网络请求，上传头像到服务器
        WS(weakSelf);
        [ZJPBaseHttpTool postImagePath:@"http://api2.pianke.me/user/reg" params:[self retuDatdDic] image:_nameImage success:^(id JSON) {
            
            NSDictionary *dataDic = JSON;
            
            //判断是否成功，如果result为 1 ，注册成功，result为0，查看返回字典中data字段中msg的错误原因
            if (1 == [dataDic[@"result"] integerValue]) {
                
                //成功后的提示框，方法在 UIView+Toast 中，第一个参数是提示的内容，第二个是显示时间，第三个是显示位置，一共有三个
                [weakSelf.view makeToast:@"注册成功" duration:1 position:@"center"];
                
            } else {
                [weakSelf.view makeToast:[dataDic[@"data"] valueForKey:@"msg"] duration:1 position:@"center"];
            }
            
        } failure:^(NSError *error) {
            [weakSelf.view makeToast:@"注册失败" duration:1 position:@"center"];
        }];
    }
}

- (NSDictionary *)retuDatdDic {
    NSDictionary *reduestDic = @{@"client":@"1",
                                 @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                                 @"email":_showView.emailField.text,
                                 @"gender":@"1",
                                 @"passwd":_showView.codeField.text,
                                 @"uname":_showView.userField.text,
                                 @"version":@"3.0.6",
                                 @"auth":@"",
                                 @"iconfile":_nameImage};
    return reduestDic;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    WS(weakSelf);
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 180;
        weakSelf.view.bounds = rect;
    }];
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self hiddeTextField];
    WS(weakSelf);
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0;
        weakSelf.view.bounds = rect;
    }];
    
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self hiddeTextField];
    WS(weakSelf);
    
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = weakSelf.view.bounds;
        rect.origin.y = 0;
        weakSelf.view.bounds = rect;
    }];
}

- (void)disTouchMissBtn {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)hiddeTextField {
    [self.showView.userField resignFirstResponder];
    [self.showView.emailField resignFirstResponder];
    [self.showView.codeField resignFirstResponder];
}

- (void)headTouchBtn:(UIButton *)headBtn {
    
    //判断当前头像按钮的图片是哪一张,如果是默认图,就让用户选择
    if ([headBtn.currentImage isEqual:[UIImage imageNamed:@"头像zc"]]) {
        /** 提示框的创建*/
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"⭐️取消⭐️" destructiveButtonTitle:@"相机拍照" otherButtonTitles:@"相册选择", nil];
        
        //设置那一个显示红色文字提示
        [sheet setDestructiveButtonIndex:2];
        [sheet showInView:self.view];
    }
    //如果是用户选择后的图片,就询问用户是否改变上传头像的图片
    else {
        
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"上传头像" message:@"是否改变上传头像" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确 定" style:(UIAlertActionStyleDestructive) handler:^(UIAlertAction * _Nonnull action) {
            /** 提示框的创建*/
            UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"⭐️取消⭐️" destructiveButtonTitle:@"相机拍照" otherButtonTitles:@"相册选择", nil];
            
            //设置那一个显示红色文字提示
            [sheet setDestructiveButtonIndex:2];
            [sheet showInView:self.view];
        }];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取 消" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alertC addAction:action1];
        [alertC addAction:action2];
        
        [self presentViewController:alertC animated:YES completion:nil];
    }
    
    
}

#pragma make- UIActionSheetDelegate
/** 提示框的代理方法，每一个 buttonindex 的点击事件*/
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (0 == buttonIndex) {
        
        /** 相机拍照*/
        //静态方法判断设备是否支持照相机／图片库／相册功能
        UIImagePickerController *picker0 = [[UIImagePickerController alloc] init];
        
        /** 选择样式*/
        [picker0 setSourceType:(UIImagePickerControllerSourceTypeCamera)];
        
        /** 设置协议代理*/
        [picker0 setDelegate:self];
        
        /** 是否允许编辑(YES,NO)*/
        [picker0 setAllowsEditing:YES];
        
        /** 跳转到相机界面*/
        [self presentViewController:picker0 animated:YES completion:nil];
        
    } else if (1 == buttonIndex) {
        
        /** 相册选择*/
        //静态方法判断设备是否支持照相机／图片库／相册功能
        UIImagePickerController *picker1 = [[UIImagePickerController alloc] init];
        
        /** 设置协议代理*/
        [picker1 setDelegate:self];
        
        /** 是否允许编辑(YES,NO)*/
        [picker1 setAllowsEditing:YES];
        
        /** 跳转到相册界面*/
        [self presentViewController:picker1 animated:YES completion:nil];
    }
}

/** UIImagePickerController 的代理方法，选择好照片后会调用*/
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    //获得图片
    UIImage *photoImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    //获取沙盒目录
    NSString *homePath = [NSHomeDirectory() stringByAppendingString:@"/Documents"];
    
    //将图片名称拼接到路径后面
    NSString *imageName = [homePath stringByAppendingFormat:@"/%d.png",arc4random_uniform(1000000)];
    
    //将图片写入沙盒
    [UIImageJPEGRepresentation(photoImage, 1.0f) writeToFile:imageName atomically:YES];
    
    //将图片保存下来，因为在上传图片的时候会用到
    self.nameImage = imageName;
    
    //更新 _headBtn 的图片
    [_headBtn setImage:photoImage forState:(UIControlStateNormal)];
    
    //关闭相册界面
    [picker dismissViewControllerAnimated:YES completion:nil];
    
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
