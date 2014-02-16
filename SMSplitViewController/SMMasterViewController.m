//
//  SMMasterViewController.m
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 16.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import "SMMasterViewController.h"

@interface SMMasterViewController ()

@end

@implementation SMMasterViewController

#pragma mark -
#pragma mark - Initialization

- (id)init {
    
    return [self initWithFrame:CGRectMake(70, 0, 320, self.view.bounds.size.height)];
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super init];
    
    if (self) {
        
        self.view.frame = frame;
        self.view.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin;
    }
    
    return self;
}

#pragma mark -
#pragma mark - ViewController Lifecycle

- (void)loadView {
    
    [super loadView];
    
    //self.view = _viewController.view;
    self.view.backgroundColor = [UIColor redColor];
}

- (void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    
    
}

@end
