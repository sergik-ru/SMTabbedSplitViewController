//
//  SMTabBar.m
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 15.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import "SMTabBar.h"
#import "SMTabBarItem.h"

#define iOS_7_STATUS_BAR (20 * ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0))
#define tabBarWidth 70
#define tabsButtonsFrame CGRectMake(0, 10 + iOS_7_STATUS_BAR, tabBarWidth, _tabsButtonsHeight)
#define actionButtonFrame CGRectMake(0, self.view.bounds.size.height - _actionsButtonsHeight + iOS_7_STATUS_BAR - 10, tabBarWidth, _actionsButtonsHeight)

@implementation SMTabBar
{
    __block CGFloat _tabsButtonsHeight;
    __block CGFloat _actionsButtonsHeight;
}

#pragma mark -
#pragma mark - Initialization

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
#pragma mark - ViewController Lifecycle

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

#pragma mark -
#pragma mark - Autototate iOS 6.0 +

- (BOOL)shouldAutorotate {
    
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    
    return UIInterfaceOrientationMaskAll;
}

@end
