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
        
        _image = [image retain];
        _title = [title copy];
        _viewController = [vc retain];
    }
    
    return self;
}

- (id)initWithActionBlock:(ActionBlock)actionBlock image:(UIImage *)image andTitle:(NSString *)title {
    
    self = [super init];
    
    if (self) {
        
        self.actionBlock = actionBlock ? actionBlock : ^{
            
            NSLog(@"ActionBlock is nil!");
        };
        
        _image = [image retain];
        _title = [title copy];
    }
    
    return self;
}

-(void)dealloc {
    
    [_viewController release];
    [_actionBlock release];
    [_title release];
    [_image release];
    [_selectedImage release];
    
    [super dealloc];
}

@end