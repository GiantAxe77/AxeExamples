//
//  AppDelegate.m
//  AxeExamples
//
//  Created by GiantAxe on 16/8/5.
//  Copyright © 2016年 GiantAxe. All rights reserved.
//

#import "AppDelegate.h"

// controller
#import "AXEMainNavigationController.h"
#import "AXEMainViewController.h"
#import "AXELeadViewController.h"
#import "AXEPhotoViewController.h"

// tools
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#import "AXEBackToTopManager.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

static NSString * const UMengAppKey = @"57b12d4167e58e86b0003a5c";
static NSString * const UMengAppId = @"wx97ff9f85938af4da";
static NSString * const UMengAppSecret = @"8285e7d8100c538065185b6d4683445d";

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:AXEScreenBounds];
//    AXEMainNavigationController *rootVC = [[AXEMainNavigationController alloc] initWithRootViewController:[[AXEMainViewController alloc] init]];
    AXELeadViewController *rootVC = [[AXELeadViewController alloc] init];
    self.window.rootViewController = rootVC;
    [self.window makeKeyAndVisible];
    
    [UMSocialData setAppKey:UMengAppKey];
    [UMSocialWechatHandler setWXAppId:UMengAppId appSecret:UMengAppSecret url:@"http://www.baidu.com"];
    
    // 判断是否支持3DTouch
    if(self.window.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable)
    {
        [self setup3DTouch:application];
    }
    
    [AXEBackToTopManager backToTopEnabled];
    
    
    return YES;
}

- (void)setup3DTouch:(UIApplication *)app
{
    // 设置图标icon (UIApplicationShortcutIconTypeMarkLocation为系统提供的样式)
    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeMarkLocation];

    // 设置shortcutItem
    //
    // type : 唯一标识
    // localizedTitle : 标题
    // localizedSubtitle : 子标题
    // icon : 图标
    // userInfo : 传递的字典
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc] initWithType:@"item1" localizedTitle:@"Sweet" localizedSubtitle:@"honey" icon:icon1 userInfo:nil];
    
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCloud];
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc] initWithType:@"item2" localizedTitle:@"Super" localizedSubtitle:@"me" icon:icon2 userInfo:nil];
    
    UIApplicationShortcutIcon *icon3 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeMessage];
    UIApplicationShortcutItem *item3 = [[UIApplicationShortcutItem alloc] initWithType:@"item3" localizedTitle:@"Legend" localizedSubtitle:@"logo" icon:icon3 userInfo:nil];
    
    // 加入到shortcutItems数组中
    app.shortcutItems = @[item1, item2, item3];
}

#pragma mark - UIApplicationDelegate

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
    if([shortcutItem.type isEqualToString:@"item1"])
    {
        AXEPhotoViewController *photoVC = [[AXEPhotoViewController alloc] init];
        self.window = [[UIWindow alloc] initWithFrame:AXEScreenBounds];
        AXEMainNavigationController *nav = [[AXEMainNavigationController alloc] initWithRootViewController:[AXEMainViewController new]];
        [nav pushViewController:photoVC animated:NO];
        self.window.rootViewController = nav;
        
        [self.window makeKeyAndVisible];
        
    }
    NSLog(@"to do sth...");
}

- (void)applicationWillResignActive:(UIApplication *)application {

}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

}

- (void)applicationWillTerminate:(UIApplication *)application {

}

/************************************************************/

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if(result == false)
    {
         //调用其他SDK，例如支付宝SDK等
    }
    return result;
}



@end
