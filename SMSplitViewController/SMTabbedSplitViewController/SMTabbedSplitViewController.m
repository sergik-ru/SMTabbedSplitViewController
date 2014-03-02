//
//  SMSplitViewController.m
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 15.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import "SMTabbedSplitViewController.h"
#import "SMMasterViewController.h"
#import "SMDetailViewController.h"

@implementation SMTabbedSplitViewController

#pragma mark -
#pragma mark - Inititalization

- (id)init {
    
    return [self initTabbedSplit];
}

- (id)initTabbedSplit {
    
    self = [super init];
    
    if (self) {
        
        _tabBar = [[SMTabBar alloc] init];
        _tabBar.delegate = self;
        _masterVC = [[SMMasterViewController alloc] init];
        _detailVC = [[SMDetailViewController alloc] init];
    }
    
    return self;
}

- (id)initSplit {
    
    self = [super init];
    
    if (self) {
        
        _splitType = SMDefaultSplit;
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
    
    if (_splitType == SMTabbedSplt) {
        
        [self.view addSubview:_tabBar.view];
        
        UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:_masterVC.view.frame];
        _masterVC.view.layer.masksToBounds = NO;
        _masterVC.view.layer.shadowColor = [UIColor blackColor].CGColor;
        _masterVC.view.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
        _masterVC.view.layer.shadowOpacity = 1.5f;
        _masterVC.view.layer.shadowRadius = 2.5f;
        _masterVC.view.layer.shadowPath = shadowPath.CGPath;
    }
    
    [self.view addSubview:_masterVC.view];
    [self.view addSubview:_detailVC.view];
}

- (void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    
    if (_masterIsHidden)
        return;
    
    BOOL tabBarIsShowed = (_splitType == SMTabbedSplt);
    CGRect appFrame = [UIScreen mainScreen].applicationFrame;
    
    CGRect detailFrame = [self detailVCFrame];
    CGFloat widthDif = UIInterfaceOrientationIsPortrait(self.interfaceOrientation) ? 10 : 0;
    detailFrame.origin.x -= widthDif;
    detailFrame.size.width = UIInterfaceOrientationIsPortrait(self.interfaceOrientation) ? appFrame.size.width - (70 * tabBarIsShowed) - 310 - 1 : appFrame.size.height - (70 * tabBarIsShowed) - 320 - 1;
    
    _detailVC.view.frame = detailFrame;
    CGRect masterFrame = [self masterVCFrame];
    masterFrame.size.width -= widthDif;
    _masterVC.view.frame = masterFrame;
}

- (void)dealloc {
    
    [_tabBar release];
    [_masterVC release];
    [_detailVC release];
    
    [_tabsViewControllers release];
    [_actionsTabs release];
    [_viewControllers release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark - Frames

- (CGRect)masterVCFrame {
    
    return (_splitType == SMTabbedSplt) ? CGRectMake(70, 0, 320, self.view.bounds.size.height) : CGRectMake(0, 0, 320, self.view.bounds.size.height);
}

- (CGRect)detailVCFrame {
    
    return (_splitType == SMTabbedSplt) ? CGRectMake(70 + 320 + 1, 0, self.view.bounds.size.width - 1, self.view.bounds.size.height) : CGRectMake(320 + 1, 0, self.view.bounds.size.width - 1, self.view.bounds.size.height);
}

#pragma mark -
#pragma mark - Properties

- (void)setDetailViewController:(UIViewController *)detailViewController {
    
    _detailVC.viewController = detailViewController;
}

- (UIViewController *)detailViewController {
    
    return _detailVC.viewController;
}

- (UIViewController *)masterViewController {
    
    return _masterVC.viewController;
}

- (void)setViewControllers:(NSArray *)viewControllers {
    
    _viewControllers = [viewControllers retain];
    
    _masterVC.viewController = _viewControllers[0];
    _detailVC.viewController = _viewControllers[1];
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
#pragma mark - Actions

- (void)hideMaster {
    
    CATransition *transitionMaster = [CATransition animation];
    transitionMaster.type = kCATransitionPush;
    transitionMaster.subtype = kCATransitionFromRight;
    [_masterVC.view.layer addAnimation:transitionMaster forKey:@"hideOrAppear"];
    
    [UIView animateWithDuration:0.2 animations:^{
        
        _masterIsHidden = YES;
        CGFloat tabBarWidth = 70 * (_splitType == SMTabbedSplt);
        _detailVC.view.frame = CGRectMake(tabBarWidth, 0, self.view.bounds.size.width - tabBarWidth, self.view.bounds.size.height);
        [self.view layoutIfNeeded];
    }];
}

- (void)showMaster {
    
    _masterIsHidden = NO;
    [self.view layoutIfNeeded];
    
    CATransition *transitionMaster = [CATransition animation];
    transitionMaster.type = kCATransitionPush;
    transitionMaster.subtype = kCATransitionFromLeft;
    transitionMaster.duration = 0.2;
    [_masterVC.view.layer addAnimation:transitionMaster forKey:@"hideOrAppear"];
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
    
    if (_masterIsHidden) {
        
        _masterIsHidden = NO;
        [self.view setNeedsLayout];
    }
    
    _masterVC.viewController = vc;
}

@end
