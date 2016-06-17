//
//  AppDelegate.m
//  FeiTieZhanChang
//
//  Created by ma c on 16/3/4.
//  Copyright © 2016年 ftzs. All rights reserved.
//

#import "AppDelegate.h"
#import "RESideMenu.h"               /** 抽屉式界面头文件*/
#import "ZJPNavigationController.h"  /**自定义的导航*/
#import "FTLeftViewController.h"     /**左侧菜单*/
#import "OriginalViewController.h"   /**废铁原创 home*/


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /**设置 window 的 frame*/
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    /**将原创视图控制器 绑定到自定义导航上*/
    ZJPNavigationController *navigationVC = [[ZJPNavigationController alloc] initWithRootViewController:[[OriginalViewController alloc] init]];
//    [navigationVC.navigationBar setHidden:YES];
    
    /**创建左侧菜单视图控制器*/
    FTLeftViewController *leftVC = [[FTLeftViewController alloc] init];
    
    /**将 导航 和 左侧菜单 绑定到抽屉视图控制器上*/
    RESideMenu *sideMenuVC = [[RESideMenu alloc] initWithContentViewController:navigationVC leftMenuViewController:leftVC rightMenuViewController:nil];
    
    /**抽屉的设置*/
    [sideMenuVC setMenuPreferredStatusBarStyle:UIStatusBarStyleLightContent];
    
    /**设置缩放比例*/
    [sideMenuVC setContentViewScaleValue:1];
    
    /**设置偏移量*/
    [sideMenuVC setContentViewInPortraitOffsetCenterX:VIEW_WIDTH / 2.0 - 45.0];
    
    [self.window setRootViewController:sideMenuVC];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    
    [self addStartImageLogo];
    
    return YES;
}

/**添加启动应用的 Logo 动画*/
- (void)addStartImageLogo {
    
    UIImageView *startImage = [[UIImageView alloc] initWithFrame:self.window.frame];
    [startImage setImage:[UIImage imageNamed:@"截图2"]];
    [self.window addSubview:startImage];
    __block CGRect imageFrame = startImage.frame;
    
    /**给图片添加放大和消失的动画*/
    [UIView animateWithDuration:2 animations:^{
        /**让 startImage 的图片 frame 变大*/
        imageFrame = CGRectMake(-40, -40, VIEW_WIDTH + 80, VIEW_HEIGHT + 80);
        /**将新的值，赋值给 startImage*/
        startImage.frame = imageFrame;
        
    } completion:^(BOOL finished) {
        
        /**判断动画是否执行完成*/
        if (finished) {
            
            /**如果动画完成，就让图片的透明度变成 0 的动画 */
            [UIView animateWithDuration:0.3 animations:^{
                [startImage setAlpha:0];
            } completion:^(BOOL finished) {
                if (finished) {
                    [startImage removeFromSuperview];
                }
            }];
        }
        
    }];
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
