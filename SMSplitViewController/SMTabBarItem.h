//
//  SMTabBarItem.h
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 15.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMTabBarItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) UIImage *image;
@property (nonatomic, assign) UIImage *selectedImage;
@property (nonatomic, assign) UIImage *unselectedImage;

@end