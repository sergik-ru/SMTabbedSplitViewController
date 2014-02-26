//
//  SMTabBarItemCell.h
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 16.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ActionBlock)(void);

typedef enum {
    
    SMTabBarItemCellTab,
    SMTabBarItemCellAction
} SMTabBarItemCellType;

@interface SMTabBarItemCell : UITableViewCell
{
    UIView *_topSeparator;
    UIView *_separator;
    UIView *_viewBackground;
}

@property (nonatomic, assign) UILabel *titleLabel;
@property (nonatomic, assign) UIImageView *iconView;
@property (nonatomic, assign) UIViewController *viewController;
@property (nonatomic, assign) UIImage *image;
@property (nonatomic, assign) UIImage *selectedImage;
@property (nonatomic, copy) ActionBlock actionBlock;
@property (nonatomic) SMTabBarItemCellType cellType;
@property (nonatomic) BOOL isFirstCell;

@end
