//
//  SMSplitViewController.m
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 15.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import "SMTabbedSplitViewController.h"
#import "SMTabBar.h"
#import "SMTabBarItem.h"
#import "SMMasterViewController.h"
#import "SMDetailViewController.h"


#define iOS_7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define tabBarWidth 70
#define tabItemHeight 60
#define tabsButtonsFrame CGRectMake(0, 10 + iOS_7 * 20, tabBarWidth, _tabsButtonsHeight)
#define actionButtonFrame CGRectMake(0, self.view.bounds.size.height - _actionsButtonsHeight + iOS_7 * 20 - tabItemHeight / 2 * iOS_7 - 10 * !iOS_7, tabBarWidth, _actionsButtonsHeight)
#define detailVCFrame CGRectMake(70 + 320 + 1, 0, self.view.bounds.size.width - 1, self.view.bounds.size.height)
#define masterVCFrame CGRectMake(70, 0, 320, self.view.bounds.size.height)


@interface SMTabbedSplitViewController ()
{
    SMMasterViewController *_masterVC;
    SMDetailViewController *_detailVC;
}
@end

@implementation SMTabbedSplitViewController

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        _tabBar = [[SMTabBar alloc] init];
        _tabBar.delegate = self;
        _masterVC = [[SMMasterViewController alloc] initWithFrame:masterVCFrame];
        _detailVC = [[SMDetailViewController alloc] initWithFrame:detailVCFrame];
    }
    
    return self;
}
#pragma mark -
#pragma mark - ViewController Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    self.view.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:_tabBar.view];
    [self.view addSubview:_masterVC.view];
    [self.view addSubview:_detailVC.view];
    
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:_masterVC.view.frame];
    _masterVC.view.layer.masksToBounds = NO;
    _masterVC.view.layer.shadowColor = [UIColor blackColor].CGColor;
    _masterVC.view.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    _masterVC.view.layer.shadowOpacity = 1.5f;
    _masterVC.view.layer.shadowRadius = 2.5f;
    _masterVC.view.layer.shadowPath = shadowPath.CGPath;
}

- (void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    
    CGRect appFrame = [UIScreen mainScreen].applicationFrame;
    CGRect detailFrame = detailVCFrame;
    
    CGFloat widthDif = UIInterfaceOrientationIsPortrait(self.interfaceOrientation) ? 10 : 0;
    detailFrame.origin.x -= widthDif;
    detailFrame.size.width = UIInterfaceOrientationIsPortrait(self.interfaceOrientation) ? appFrame.size.width - 70 - 310 - 1 : appFrame.size.height - 70 - 320 - 1;
    
    _detailVC.view.frame = detailFrame;

    CGRect masterFrame = masterVCFrame;
    masterFrame.size.width -= widthDif;
    
    _masterVC.view.frame = masterFrame;
    
}

- (void)dealloc {
    
    [_tabBar release];
    [_masterVC release];
    [_detailVC release];
    
    [_tabsViewControllers release];
    [_actionsTabs release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark - Properties

- (void)setDetailViewController:(UIViewController *)detailViewController {
    
    _detailVC.viewController = detailViewController;
}

- (UIViewController *)detailViewController {
    
    return _detailVC;
}

- (void)setBackground:(UIColor *)background {
    
    _tabBar.view.backgroundColor = background;
    _masterVC.view.backgroundColor = background;
    _detailVC.view.backgroundColor = background;
}

- (void)setTabsViewControllers:(NSArray *)tabsViewControllers {
    
    _tabsViewControllers = [tabsViewControllers retain];
    _tabBar.tabsButtons = _tabsViewControllers;
}

- (void)setActionsTabs:(NSArray *)actionsTabs {

    _actionsTabs = [actionsTabs retain];
    _tabBar.actionsButtons = _actionsTabs;
}

#pragma mark -
#pragma mark - Autorotation

- (BOOL)shouldAutorotate {
    
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    
    return UIInterfaceOrientationMaskAll;
}

#pragma mark -
#pragma mark - TabBarDelegate

- (void)tabBar:(SMTabBar *)tabBar selectedViewController:(UIViewController *)vc {
    
    _masterVC.viewController = vc;
}

@end
