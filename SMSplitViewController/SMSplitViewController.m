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
#import "SMMasterViewController.h"
#import "SMDetailViewController.h"

#define iOS_7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)

@interface SMSplitViewController ()
{
    SMTabBar *_tabBar;
    SMMasterViewController *_masterVC;
    SMDetailViewController *_detailVC;
}
@end

@implementation SMSplitViewController

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        SMTabBarItem *tab = [[[SMTabBarItem alloc] initWithImage:[UIImage imageNamed:@"Evernote"] andTitle:@"Evernote"] autorelease];
        SMTabBarItem *tab2 = [[[SMTabBarItem alloc] initWithImage:[UIImage imageNamed:@"Facebook"] andTitle:@"Facebook"] autorelease];
        SMTabBarItem *tab3 = [[[SMTabBarItem alloc] initWithImage:[UIImage imageNamed:@"Google+"] andTitle:@"Google+"] autorelease];
        SMTabBarItem *tab4 = [[[SMTabBarItem alloc] initWithImage:[UIImage imageNamed:@"Instagram"] andTitle:@"Instagram"] autorelease];
        SMTabBarItem *tab5 = [[[SMTabBarItem alloc] initWithImage:[UIImage imageNamed:@"LastFM"] andTitle:@"LastFM"] autorelease];
        SMTabBarItem *tab6 = [[[SMTabBarItem alloc] initWithImage:[UIImage imageNamed:@"Reddit"] andTitle:@"Reddit"] autorelease];
        
        SMTabBarItem *action = [[[SMTabBarItem alloc] initWithImage:[UIImage imageNamed:@"Twitter"] andTitle:@"Twitter"] autorelease];
        SMTabBarItem *action2 = [[[SMTabBarItem alloc] initWithImage:[UIImage imageNamed:@"Skype"] andTitle:@"Skype"] autorelease];
        
        _tabBar = [[SMTabBar alloc] initTabBar:@[tab, tab2, tab3, tab4, tab5, tab6] andActions:@[action, action2]];
        _masterVC = [[SMMasterViewController alloc] init];
        _detailVC = [[SMDetailViewController alloc] init];
    }
    
    return self;
}
#pragma mark -
#pragma mark - ViewController Lifecycle

- (void)loadView {
    
    [super loadView];
    
    self.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tabBar.view];
    [self.view addSubview:_masterVC.view];
    [self.view addSubview:_detailVC.view];
}

- (void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
}

- (void)dealloc {
    
    [_tabBar release];
    [_masterVC release];
    [_detailVC release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark - Properties

- (void)setBackground:(UIColor *)background {
    
    _tabBar.view.backgroundColor = background;
    _masterVC.view.backgroundColor = background;
    _detailVC.view.backgroundColor = background;    
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
