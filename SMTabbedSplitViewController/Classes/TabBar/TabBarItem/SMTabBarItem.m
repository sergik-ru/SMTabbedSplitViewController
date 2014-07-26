//
//  SMTabBarItem.m
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 15.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//
//  This content is released under the ( http://opensource.org/licenses/MIT ) MIT License.
//

#import "SMTabBarItem.h"

@implementation SMTabBarItem

- (id)init {
    
    return [self initWithVC:nil image:[UIImage imageNamed:@""] andTitle:@""];
}

- (id)initWithVC:(UIViewController *)vc image:(UIImage *)image andTitle:(NSString *)title {
    
    self = [super init];
    
    if (self) {
        
        _image = image;
        _title = [title copy];
        _viewController = vc;
    }
    
    return self;
}

- (id)initWithActionBlock:(ActionBlock)actionBlock image:(UIImage *)image andTitle:(NSString *)title {
    
    self = [super init];
    
    if (self) {
        
        ActionBlock block = actionBlock ? actionBlock : ^{
            
            NSLog(@"ActionBlock is nil!");
        };

        _actionBlock = [block copy];
        _image = image;
        _title = [title copy];
    }
    
    return self;
}


@end