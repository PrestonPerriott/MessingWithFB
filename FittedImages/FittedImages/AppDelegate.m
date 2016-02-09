//
//  AppDelegate.m
//  FittedImages
//
//  Created by Preston Perriott on 5/14/15.
//  Copyright (c) 2015 Preston Perriott. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "LeftVC.h"
#import "RightVC.h"
#import "SWRevealViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface AppDelegate () <SWRevealViewControllerDelegate>

@end

@implementation AppDelegate
@synthesize window = _window;
@synthesize viewController = _viewController;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //Window is launched
    UIWindow *window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window = window;
    
    //Intializing View Controllers of a specific VC type for use later
    ViewController *frontVC = [[ViewController alloc] init];
    RightVC *rightVC = [[RightVC alloc] init];
    LeftVC *leftVC = [[LeftVC alloc] init];
    
    //Navigation Controllers to swtich between the View COntroller Variables we just created
    UINavigationController *frontNavControl = [[UINavigationController alloc] initWithRootViewController:frontVC];
    UINavigationController *leftNavControl = [[UINavigationController alloc] initWithRootViewController:leftVC];
    
    //Var revealController inherits from SWRVC and sets its specific view controller positions
    SWRevealViewController *revealController = [[SWRevealViewController alloc] initWithRearViewController:leftNavControl frontViewController:frontNavControl];
    
    //Reveal COntroler var with its set View Controllers will be delegated to the screen
    revealController.delegate = self;
    revealController.rightViewController = rightVC;
    self.viewController = revealController;
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    
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
[FBSDKAppEvents activateApp];
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation
            ];
}

@end
