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
        
        self.view.clipsToBounds = YES;
        self.view.layer.cornerRadius = 7;
        self.view.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

#pragma mark -
#pragma mark - ViewController Lifecycle

- (void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    
    CGRect frame = detailFrame;
    
    frame.origin.x -= UIInterfaceOrientationIsPortrait(self.interfaceOrientation) ? 10 : 0;
    frame.size.width = UIInterfaceOrientationIsPortrait(self.interfaceOrientation) ? 768 - 70 - 310 : 1024 - 70 - 320;
    self.view.frame = frame;
}

@end
