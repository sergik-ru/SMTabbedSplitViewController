//
//  SMAppDelegate.m
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 15.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import "SMAppDelegate.h"
#import "SMMainViewController.h"

@implementation SMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    SMMainViewController *mainVC = [[SMMainViewController alloc] init];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:mainVC];
    nc.navigationBarHidden = YES;
    
    self.window.rootViewController = nc;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
