//
//  SMTabBar.h
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 15.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//
//  This content is released under the ( http://opensource.org/licenses/MIT ) MIT License.
//

#import <UIKit/UIKit.h>

@protocol SMTabBarDelegate;

@interface SMTabBar : UIViewController

@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, strong) NSArray *tabsButtons;
@property (nonatomic, strong) NSArray *actionsButtons;
@property (weak, nonatomic) id<SMTabBarDelegate> delegate;
@property (nonatomic) NSUInteger selectedTabIndex;

@end

@protocol SMTabBarDelegate <NSObject>

@required

- (void)tabBar:(SMTabBar *)tabBar selectedViewController:(UIViewController *)vc;

@end