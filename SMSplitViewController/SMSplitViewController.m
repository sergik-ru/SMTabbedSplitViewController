//
//  SMSplitViewController.m
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 15.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import "SMSplitViewController.h"
#import "SMTabBar.h"
#import "SMTabBarItem.h"

@interface SMSplitViewController ()
{
    SMTabBar *_tabBar;
}
@end

@implementation SMSplitViewController

#pragma mark -
#pragma mark - ViewController Lifecycle

- (void)loadView {
    
    [super loadView];
    
    SMTabBarItem *tab = [[SMTabBarItem alloc] initWithImage:[UIImage imageNamed:@""] andTitle:@"tab 1"];
    SMTabBarItem *tab2 = [[SMTabBarItem alloc] initWithImage:[UIImage imageNamed:@""] andTitle:@"tab 2"];
    SMTabBarItem *tab3 = [[SMTabBarItem alloc] initWithImage:[UIImage imageNamed:@""] andTitle:@"tab 3"];
    SMTabBarItem *tab4 = [[SMTabBarItem alloc] initWithImage:[UIImage imageNamed:@""] andTitle:@"tab 4"];
    
    SMTabBarItem *action = [[SMTabBarItem alloc] initWithImage:[UIImage imageNamed:@""] andTitle:@"act 1"];
    SMTabBarItem *action2 = [[SMTabBarItem alloc] initWithImage:[UIImage imageNamed:@""] andTitle:@"act 2"];
    
    _tabBar = [[SMTabBar alloc] initTabBar:@[tab, tab2, tab3, tab4] andActions:@[action, action2]];
    [self.view addSubview:_tabBar.view];
}

- (void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    
    [_tabBar.view setNeedsLayout];
}

- (void)dealloc {
    
    [_tabBar release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark - Autorotation

- (BOOL)shouldAutorotate {
    
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    
    return UIInterfaceOrientationMaskAll;
}

@end
