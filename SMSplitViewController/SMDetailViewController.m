//
//  SMDetailViewController.m
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 16.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import "SMDetailViewController.h"

#define detailFrame CGRectMake(70 + 320, 0, self.view.bounds.size.width, self.view.bounds.size.height)

@implementation SMDetailViewController

#pragma mark -
#pragma mark - Initialization

- (id)init {
    
    return [self initWithFrame:detailFrame];
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super init];
    
    if (self) {
        
        self.view.frame = frame;
        self.view.clipsToBounds = YES;
        self.view.layer.cornerRadius = 7;
        self.view.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

#pragma mark -
#pragma mark - ViewController Lifecycle

- (void)loadView {
    
    [super loadView];
    
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    
    CGRect appFrame = [UIScreen mainScreen].applicationFrame;
    CGRect frame = detailFrame;
    
    frame.origin.x -= UIInterfaceOrientationIsPortrait(self.interfaceOrientation) ? 10 : 0;
    frame.size.width = UIInterfaceOrientationIsPortrait(self.interfaceOrientation) ? appFrame.size.width - 70 - 310 : appFrame.size.height - 70 - 320;
    self.view.frame = frame;
}

- (void)dealloc {
    
    [_viewController release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark - Properties

- (void)setViewController:(UIViewController *)viewController {
    
    if (viewController) {
        
        UIViewController *oldVC = _viewController;
        
       [_viewController autorelease], _viewController = [viewController retain];
        _viewController.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        _viewController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [self addChildViewController:_viewController];
        [self.view addSubview:_viewController.view];
        
        [oldVC.view removeFromSuperview];
        [oldVC removeFromParentViewController];
    }
}

#pragma mark -
#pragma mark - Autototate iOS 6.0 +

- (BOOL)shouldAutorotate {
    
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    
    return UIInterfaceOrientationMaskAll;
}

@end
