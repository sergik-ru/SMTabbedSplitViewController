//
//  SMSplitViewController.h
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 15.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMTabBar.h"

typedef enum {
    
    SMTabbedSplt = 0,
    SMDefaultSplit
} SMSplitType;

@interface SMTabbedSplitViewController : UIViewController <SMTabBarDelegate>

@property (nonatomic, readonly, retain) SMTabBar *tabBar;
@property (nonatomic, assign) UIColor *background;
@property (nonatomic, retain) NSArray *tabsViewControllers;
@property (nonatomic, retain) NSArray *actionsTabs;
@property (nonatomic, assign) UIViewController *detailViewController;

- (id)initTabbedSplit;
- (id)initSplit;

@end