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
        self.view.layer.cornerRadius = 7;
    }
    
    return self;
}

#pragma mark -
#pragma mark - ViewController Lifecycle

- (void)loadView {
    
    [super loadView];
    
    self.view.backgroundColor = [UIColor redColor];
}

- (void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    
    CGRect frame = masterVCFrame;
    frame.size.width -= (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) ? 0 : 10;
    
    self.view.frame = frame;
}

- (void)setViewController:(UIViewController *)viewController {
    
    if (_viewController != viewController) {
        
        UIViewController *oldVC = _viewController;
        
        _viewController = viewController;
        
        [self addChildViewController:_viewController];
        [self.view addSubview:_viewController.view];
        
        [oldVC.view removeFromSuperview];
        [oldVC removeFromParentViewController];
    }
}

@end