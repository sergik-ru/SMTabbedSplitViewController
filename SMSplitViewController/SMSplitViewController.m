//
//  SMSplitViewController.m
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 15.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import "SMSplitViewController.h"
#import "SMTabBar.h"

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
    
    _tabBar = [[SMTabBar alloc] initTabBar:@[@"1",@"2",@"3"] andActions:@[@"1",@"2"]];
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
