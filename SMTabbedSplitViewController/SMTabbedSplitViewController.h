//
//  SMSplitViewController.h
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 15.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//
//  This content is released under the ( http://opensource.org/licenses/MIT ) MIT License.
//  Repository: https://github.com/sergik-ru/SMTabbedSplitViewController
//

#import <UIKit/UIKit.h>
#import "SMTabBar.h"

typedef enum {
    
    SMTabbedSplt = 0,
    SMDefaultSplit
} SMSplitType;

@class SMMasterViewController, SMDetailViewController;

@interface SMTabbedSplitViewController : UIViewController <SMTabBarDelegate>
{
    SMMasterViewController *_masterVC;
    SMDetailViewController *_detailVC;
    BOOL _masterIsHidden;
}

@property (nonatomic, readonly, retain) SMTabBar *tabBar;
@property (nonatomic, assign) UIColor *background;
@property (nonatomic, retain) NSArray *tabsViewControllers;
@property (nonatomic, retain) NSArray *actionsButtons;
@property (nonatomic, retain) NSArray *viewControllers;
@property (nonatomic, readonly, assign) UIViewController *masterViewController;
@property (nonatomic, assign) UIViewController *detailViewController;
@property (nonatomic) SMSplitType splitType;

- (id)initTabbedSplit;
- (id)initSplit;

- (void)hideMaster;
- (void)showMaster;

@end