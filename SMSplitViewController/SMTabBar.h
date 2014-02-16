//
//  SMTabBar.h
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 15.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SMTabBarDelegate;

@interface SMTabBar : UIViewController <UITableViewDelegate, UITableViewDataSource>

//@property (nonatomic, assign) NSInteger *selectedTab;
@property (nonatomic, assign) UIImage *background;
@property (nonatomic, assign) NSArray *tabsButtons;
@property (nonatomic, assign) NSArray *actionsButtons;
@property (nonatomic, assign) id<SMTabBarDelegate> delegate;
@property (nonatomic, copy) UITableView *tabsTable;
@property (nonatomic, copy) UITableView *actionsTable;

@end

@protocol SMTabBarDelegate <NSObject>

@required

- (void)tabBar:(SMTabBar *)tabBar selectedViewController:(UIViewController *)vc;
- (void)tabBar:(SMTabBar *)tabBar selectedAction:(NSInteger *)index;

@end