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
#define tabsButtonsFrame CGRectMake(0, 0, tabBarWidth, _tabsButtonsHeight)
#define actionButtonFrame CGRectMake(0, self.view.bounds.size.height - _tabsButtonsHeight, tabBarWidth, _actionsButtonsHeight)

@implementation SMTabBar
{
    __block CGFloat _tabsButtonsHeight;
    __block CGFloat _actionsButtonsHeight;
}

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
    
    if (_tabsTable) {
        
        _tabsTable.frame = tabsButtonsFrame;
    }
    
    if (_actionsTable) {
        
        _actionsTable.frame = actionButtonFrame;
    }
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
        
        [_tabsButtons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
           // if ([obj isKindOfClass:[SMTabBarItem class]])
                _tabsButtonsHeight += 50;
            
        }];
        
        _tabsTable = [[[UITableView alloc] initWithFrame:tabsButtonsFrame style:UITableViewStylePlain] autorelease];
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
        
        [_actionsButtons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
          //  if ([obj isKindOfClass:[SMTabBarItem class]])
                _actionsButtonsHeight += 50;
            
        }];
        
        
        _actionsTable = [[[UITableView alloc] initWithFrame:actionButtonFrame style:UITableViewStylePlain] autorelease];
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

#pragma mark -
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
    cell.frame = CGRectMake(0, 0, tabBarWidth, 70);
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
