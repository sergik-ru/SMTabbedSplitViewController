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
    
    SMTabBarItem *tab = [[SMTabBarItem alloc] initWithImage:[UIImage imageNamed:@"Evernote"] andTitle:@"Evernote"];
    SMTabBarItem *tab2 = [[SMTabBarItem alloc] initWithImage:[UIImage imageNamed:@"Facebook"] andTitle:@"Facebook"];
    SMTabBarItem *tab3 = [[SMTabBarItem alloc] initWithImage:[UIImage imageNamed:@"Google+"] andTitle:@"Google+"];
    SMTabBarItem *tab4 = [[SMTabBarItem alloc] initWithImage:[UIImage imageNamed:@"Instagram"] andTitle:@"Instagram"];
    SMTabBarItem *tab5 = [[SMTabBarItem alloc] initWithImage:[UIImage imageNamed:@"LastFM"] andTitle:@"LastFM"];
    SMTabBarItem *tab6 = [[SMTabBarItem alloc] initWithImage:[UIImage imageNamed:@"Reddit"] andTitle:@"Reddit"];
    
    
    SMTabBarItem *action = [[SMTabBarItem alloc] initWithImage:[UIImage imageNamed:@"Twitter"] andTitle:@"Twitter"];
    SMTabBarItem *action2 = [[SMTabBarItem alloc] initWithImage:[UIImage imageNamed:@"Skype"] andTitle:@"Skype"];
    
    _tabBar = [[SMTabBar alloc] initTabBar:@[tab, tab2, tab3, tab4, tab5, tab6] andActions:@[action, action2]];
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
