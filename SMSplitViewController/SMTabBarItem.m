//
//  SMTabBarItem.m
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 15.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
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
        _title = title;
        _viewController = [vc retain];
    }
    
    return self;
}

- (id)initWithActionBlock:(ActionBlock)actionBlock image:(UIImage *)image andTitle:(NSString *)title {
    
    self = [super init];
    
    if (self) {
        
        _actionBlock = actionBlock ? actionBlock : ^{
            
            NSLog(@"ActionBlock is nil!");
        };
        
        _image = image;
        _title = title;
    }
    
    return self;
}

-(void)dealloc {
    
    [_viewController release];
    
    [super dealloc];
}

@end


