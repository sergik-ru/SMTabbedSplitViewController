//
//  SMTabBarItemCell.h
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 16.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ActionBlock)(void);

@interface SMTabBarItemCell : UITableViewCell

@property (nonatomic, assign) UILabel *titleLabel;
@property (nonatomic, assign) UIImageView *iconView;
@property (nonatomic, assign) UIImage *selecteImage;
@property (nonatomic, assign) UIImage *unselectedImage;
@property (nonatomic, assign) UIViewController *viewController;
@property (nonatomic, assign) ActionBlock actionBlock;

@end
