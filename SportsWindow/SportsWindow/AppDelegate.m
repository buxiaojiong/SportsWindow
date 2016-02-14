//
//  AppDelegate.m
//  SportsWindow
//
//  Created by sourcecode on 16/1/15.
//  Copyright © 2016年 sourcecode. All rights reserved.
//

#import "AppDelegate.h"
#import "LeftViewController.h"
#import "MainViewController.h"

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    MainViewController *mainVc = [[MainViewController alloc] init];
    UINavigationController *naVc = [[UINavigationController alloc] initWithRootViewController:mainVc];
    naVc.navigationBar.barTintColor = [UIColor colorWithRed:183/255.0 green:7/255.0 blue:16/255.0 alpha:1.0];
    
 
    LeftViewController *leftVc = [[LeftViewController alloc] init];
    self.drawerController = [[MMDrawerController alloc] initWithCenterViewController:naVc leftDrawerViewController:leftVc];
    
    [self.drawerController setShowsShadow:NO];
    [self.drawerController setRestorationIdentifier:@"MMDrawer"];
    [self.drawerController setMaximumLeftDrawerWidth:250.0];
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeCustom];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    


    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setRootViewController:self.drawerController];

    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 设置只有主页面右划才能到左抽屉菜单
    [self.drawerController setGestureShouldRecognizeTouchBlock:^BOOL(MMDrawerController *drawerController, UIGestureRecognizer *gesture, UITouch *touch) {
        BOOL shouldRecognizeTouch = NO;
        
        if(drawerController.openSide == MMDrawerSideNone && [gesture isKindOfClass:[UIPanGestureRecognizer class]]){
            UINavigationController *nav = (UINavigationController *)drawerController.centerViewController;
            if([nav.topViewController isKindOfClass:[MainViewController class]]){//判断哪个控制器可以滑到抽屉
                shouldRecognizeTouch = YES;//返回yes表示可以滑动到左右侧抽屉
            }else{
                shouldRecognizeTouch = NO;
            }
            NSLog(@"shouldRecognizeTouch==%d",shouldRecognizeTouch);
        }
        return shouldRecognizeTouch;
    }];
    [self.window makeKeyAndVisible];
    return YES;
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
