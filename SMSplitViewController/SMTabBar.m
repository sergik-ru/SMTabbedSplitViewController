//
//  SMTabBar.m
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 15.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import "SMTabBar.h"

@interface SMTabBar ()

@end

@implementation SMTabBar


- (id)init {
    
    return [self initTabBar:[NSArray array] andActions:[NSArray array]];
}

- (id)initTabBar:(NSArray *)tabs andActions:(NSArray *)actions {
    
    self = [self init];
    
    if (self) {
        
        _tabsButtons = [NSArray arrayWithArray:tabs];
        _actionsButtons = [NSArray arrayWithArray:actions];
    }
    
    return self;
}

- (void)setTabsButtons:(NSArray *)tabsButtons {
    
    
}


@end
