//
//  SMMasterViewController.m
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 16.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import "SMMasterViewController.h"

#define masterVCFrame CGRectMake(70, 0, 320, self.view.bounds.size.height)

@interface SMMasterViewController ()

@property (nonatomic) CGRect masterFrame;

@end

@implementation SMMasterViewController

#pragma mark -
#pragma mark - Initialization

- (id)init {
    
    return [self initWithFrame:masterVCFrame];
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super init];
    
    if (self) {
        
        self.view.frame = frame;
        self.view.clipsToBounds = YES;
//        self.view.layer.cornerRadius = 7;
        self.view.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

#pragma mark -
#pragma mark - ViewController Lifecycle

- (void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    
    CGRect frame = masterVCFrame;
    frame.size.width -= (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) ? 0 : 10;
    
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
        
        _viewController = [viewController retain];
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
