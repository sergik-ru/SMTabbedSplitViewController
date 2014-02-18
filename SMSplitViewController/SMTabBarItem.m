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
        
        self.image = image;
        self.title = title;
        self.viewController = vc;
    }
    
    return self;
}

@end


