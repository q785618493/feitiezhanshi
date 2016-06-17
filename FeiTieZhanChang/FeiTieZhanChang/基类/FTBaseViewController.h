//
//  FTBaseViewController.h
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/4.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AFNetworking.h"
#import "RESideMenu.h"
#import "UIView+Toast.h"
#import "JPRefreshView.h"
#import "UIBarButtonItem+Helper.h"
#import "ZJPBaseHttpTool.h"


typedef void(^HttpSuccessBlock)(id JSON);
typedef void(^HttpErrorBlock)(NSError *error);

@interface FTBaseViewController : UIViewController

@property (copy, nonatomic) HttpSuccessBlock successBlock;
@property (copy, nonatomic) HttpErrorBlock errorBlock;

@property (strong, nonatomic) UILabel *navLabel;
@property (strong, nonatomic) UILabel *popLabel;
@property (strong, nonatomic) UILabel *nameLabel;
@property (strong, nonatomic) UIView *navView;
@property (strong, nonatomic) UIView *popView;
@property (strong, nonatomic) UIView *returenView;

- (void)addReturnNavView;

- (void)navSideView;

- (void)popNavView;


- (void)GETHttpRequwstUrl:(NSString *)url
                      dic:(NSDictionary *)dic
             successBlock:(HttpSuccessBlock)RequestSuccess
               errorBlock:(HttpErrorBlock)RequestError;


- (void)POSTHttpRequestUrl:(NSString *)url
                       dic:(NSDictionary *)dic
              successBlock:(HttpSuccessBlock)RequestSuccess
                errorBlock:(HttpErrorBlock)RequestError;


@end
