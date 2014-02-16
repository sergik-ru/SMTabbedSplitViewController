//
//  SMTabBar.m
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 15.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import "SMTabBar.h"
#import "SMTabBarItem.h"

#define tabBarWidth 70

@implementation SMTabBar

- (id)init {
    
    return [self initTabBar:@[] andActions:@[]];
}

- (id)initTabBar:(NSArray *)tabs andActions:(NSArray *)actions {

    self = [super init];
    
    if (self) {
        
        self.view.backgroundColor = [UIColor blackColor];
        
        [self tabsInit:tabs];
        [self actionsInit:actions];
    }
    
    return self;
}

- (void)viewWillLayoutSubviews {
    
    [super viewWillLayoutSubviews];
    
    self.view.frame = CGRectMake(0, 0, tabBarWidth, self.view.bounds.size.height);
}

- (BOOL)shouldAutorotate {
    
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    
    return UIInterfaceOrientationMaskAll;
}

- (void)tabsInit:(NSArray *)tabs {
    
    if (tabs) {
        
        _tabsButtons = [NSArray arrayWithArray:tabs];
        
        __block CGFloat buttonsHeight = 0;
        
        [_tabsButtons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
           // if ([obj isKindOfClass:[SMTabBarItem class]])
                buttonsHeight += 115;
            
        }];
        
        _tabsButtonFrame = CGRectMake(0, 0, tabBarWidth, buttonsHeight);
        
        _tabsTable = [[[UITableView alloc] initWithFrame:_tabsButtonFrame style:UITableViewStylePlain] autorelease];
        _tabsTable.scrollEnabled = NO;
        _tabsTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tabsTable.dataSource = self;
        _tabsTable.delegate = self;
        _tabsTable.backgroundColor = [UIColor clearColor];
        
        [self.view addSubview:_tabsTable];
    }
}

- (void)actionsInit:(NSArray *)actions {
    
    if (actions) {
        
        _actionsButtons = [NSArray arrayWithArray:actions];
        
        __block CGFloat buttonsHeight = 0;
        
        [_actionsButtons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
          //  if ([obj isKindOfClass:[SMTabBarItem class]])
                buttonsHeight += 115;
            
        }];

        _actionsButtonFrame = CGRectMake(0, self.view.bounds.size.height - _tabsButtonFrame.size.height, tabBarWidth, buttonsHeight);
        _actionsTable = [[[UITableView alloc] initWithFrame:_actionsButtonFrame style:UITableViewStylePlain] autorelease];
        _actionsTable.scrollEnabled = NO;
        _actionsTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _actionsTable.delegate = self;
        _actionsTable.dataSource = self;
        _actionsTable.backgroundColor = [UIColor clearColor];
        
        [self.view addSubview:_actionsTable];
    }
}

#pragma mark -
#pragma mark - Properties

- (void)setTabsButtons:(NSArray *)tabsButtons {
    
    
}

#pragma mark - UITableViewDataSource/Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableView == _tabsTable ? _tabsButtons.count : _actionsButtons.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if (!cell)
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"] autorelease];
    
    cell.backgroundColor = tableView == _tabsTable ? [UIColor redColor] : [UIColor blueColor];
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    
//}

@end
