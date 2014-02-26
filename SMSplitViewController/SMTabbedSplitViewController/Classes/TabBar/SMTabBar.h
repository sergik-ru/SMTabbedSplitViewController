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

@property (nonatomic, assign) UIImage *backgroundImage;
@property (nonatomic, retain) NSArray *tabsButtons;
@property (nonatomic, retain) NSArray *actionsButtons;
@property (nonatomic, assign) id<SMTabBarDelegate> delegate;
@property (nonatomic, assign) NSUInteger selectedTabIndex;

@end

@protocol SMTabBarDelegate <NSObject>

@required

- (void)tabBar:(SMTabBar *)tabBar selectedViewController:(UIViewController *)vc;

@end