//
//  SMAppDelegate.m
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 15.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import "SMAppDelegate.h"
#import "SMTabbedSplitViewController.h"
#import "SMTabBarItem.h"
#import "SMTestMasterViewController.h"

@implementation SMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    
    SMTabbedSplitViewController *split = [[[SMTabbedSplitViewController alloc] init] autorelease];
    
    SMTestMasterViewController *tab1VC = [[[SMTestMasterViewController alloc] init] autorelease];
    tab1VC.view.backgroundColor = [UIColor lightGrayColor];
    SMTabBarItem *tab1 = [[[SMTabBarItem alloc] initWithVC:tab1VC image:[UIImage imageNamed:@"Evernote"] andTitle:@"Evernote"] autorelease];
    tab1VC.textLabel.text = tab1.title;
    tab1VC.imageView.image = tab1.image;
    tab1VC.siteURL = @"https://www.evernote.com";
    
    SMTestMasterViewController *tab2VC = [[[SMTestMasterViewController alloc] init] autorelease];
    tab2VC.view.backgroundColor = [UIColor greenColor];
    SMTabBarItem *tab2 = [[[SMTabBarItem alloc] initWithVC:tab2VC image:[UIImage imageNamed:@"Facebook"] andTitle:@"Facebook"] autorelease];
    tab2VC.textLabel.text = tab2.title;
    tab2VC.imageView.image = tab2.image;
    tab2VC.siteURL = @"https://www.facebook.com";

    SMTestMasterViewController *tab3VC = [[[SMTestMasterViewController alloc] init] autorelease];
    tab3VC.view.backgroundColor = [UIColor blueColor];
    SMTabBarItem *tab3 = [[[SMTabBarItem alloc] initWithVC:tab3VC image:[UIImage imageNamed:@"Google+"] andTitle:@"Google+"] autorelease];
    tab3VC.textLabel.text = tab3.title;
    tab3VC.imageView.image = tab3.image;
    tab3VC.siteURL = @"https://www.plus.google.com";

    SMTestMasterViewController *tab4VC = [[[SMTestMasterViewController alloc] init] autorelease];
    tab4VC.view.backgroundColor = [UIColor blackColor];
    SMTabBarItem *tab4 = [[[SMTabBarItem alloc] initWithVC:tab4VC image:[UIImage imageNamed:@"Instagram"] andTitle:@"Instagram"] autorelease];
    tab4VC.textLabel.text = tab4.title;
    tab4VC.imageView.image = tab4.image;
    tab4VC.siteURL = @"http://www.instagram.com";

    SMTestMasterViewController *tab5VC = [[[SMTestMasterViewController alloc] init] autorelease];
    tab5VC.view.backgroundColor = [UIColor grayColor];
    SMTabBarItem *tab5 = [[[SMTabBarItem alloc] initWithVC:tab5VC image:[UIImage imageNamed:@"LastFM"] andTitle:@"LastFM"] autorelease];
    tab5VC.textLabel.text = tab5.title;
    tab5VC.imageView.image = tab5.image;
    tab5VC.siteURL = @"https://www.last.fm";

    SMTestMasterViewController *tab6VC = [[[SMTestMasterViewController alloc] init] autorelease];
    tab6VC.view.backgroundColor = [UIColor orangeColor];
    SMTabBarItem *tab6 = [[[SMTabBarItem alloc] initWithVC:tab6VC image:[UIImage imageNamed:@"Reddit"] andTitle:@"Reddit"] autorelease];
    tab6VC.textLabel.text = tab6.title;
    tab6VC.imageView.image = tab6.image;
    tab6VC.siteURL = @"http://www.reddit.com";

    SMTabBarItem *action = [[[SMTabBarItem alloc] initWithActionBlock:nil image:[UIImage imageNamed:@"Twitter"] andTitle:@"Twitter"] autorelease];
    SMTabBarItem *action2 = [[[SMTabBarItem alloc] initWithActionBlock:nil image:[UIImage imageNamed:@"Skype"] andTitle:@"Skype"] autorelease];
    
    split.tabsViewControllers = @[tab1, tab2, tab3, tab4, tab5, tab6];
    split.actionsTabs = @[action, action2];
    
    split.background = [UIColor whiteColor];
    self.window.rootViewController = split;
    
    //self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
