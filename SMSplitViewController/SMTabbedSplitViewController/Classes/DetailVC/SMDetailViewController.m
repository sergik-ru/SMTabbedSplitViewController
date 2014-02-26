//
//  SMDetailViewController.m
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 16.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import "SMDetailViewController.h"

@implementation SMDetailViewController

#pragma mark -
#pragma mark - Initialization

- (id)init {
    
    return [self initWithFrame:CGRectZero];
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super init];
    
    if (self) {
        
        self.view.frame = frame;
        self.view.clipsToBounds = YES;
        self.view.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

#pragma mark -
#pragma mark - ViewController Lifecycle

- (void)dealloc {
    
    [_viewController release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark - Properties

- (void)setViewController:(UIViewController *)viewController {
    
    if (viewController) {
        
        UIViewController *oldVC = _viewController;
        
        _viewController = [viewController retain];
        _viewController.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        _viewController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [self addChildViewController:_viewController];
        [self.view addSubview:_viewController.view];
        
        [oldVC.view removeFromSuperview];
        [oldVC removeFromParentViewController];
        [oldVC release];
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
