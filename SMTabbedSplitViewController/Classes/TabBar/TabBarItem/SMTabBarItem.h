//
//  SMTabBarItem.h
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 15.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//
//  This content is released under the ( http://opensource.org/licenses/MIT ) MIT License.
//

#import <UIKit/UIKit.h>

typedef void (^ActionBlock)(void);

@interface SMTabBarItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) ActionBlock actionBlock;
@property (nonatomic, strong) UIViewController *viewController;
@property (nonatomic, strong) UIImage *selectedImage;

- (id)initWithVC:(UIViewController *)vc image:(UIImage *)image andTitle:(NSString *)title;
- (id)initWithActionBlock:(ActionBlock)actionBlock image:(UIImage *)image andTitle:(NSString *)title;

@end