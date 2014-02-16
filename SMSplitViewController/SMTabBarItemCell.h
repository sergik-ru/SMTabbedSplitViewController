//
//  SMTabBarItemCell.h
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 16.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMTabBarItemCell : UITableViewCell

@property (nonatomic, copy) UILabel *titleLabel;
@property (nonatomic, assign) UIImageView *iconView;
@property (nonatomic, assign) UIImage *selecteImage;
@property (nonatomic, assign) UIImage *unselectedImage;

@end
