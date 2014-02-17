//
//  SMTabBar.m
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 15.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import "SMTabBar.h"
#import "SMTabBarItem.h"
#import "SMTabBarItemCell.h"

#define iOS_7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define tabBarWidth 70
#define tabHeight 60
#define tabsButtonsFrame CGRectMake(0, 10 + iOS_7 * 20, tabBarWidth, _tabsButtonsHeight)
#define actionButtonFrame CGRectMake(0, self.view.bounds.size.height - _actionsButtonsHeight + iOS_7 * 20 - tabHeight / 2 * iOS_7 - 10 * !iOS_7, tabBarWidth, _actionsButtonsHeight)

@interface SMTabBar ()

@property (nonatomic, copy) UITableView *tabsTable;
@property (nonatomic, copy) UITableView *actionsTable;

@end

@implementation SMTabBar
{
    __block CGFloat _tabsButtonsHeight;
    __block CGFloat _actionsButtonsHeight;
    NSIndexPath *_selectedTab;
    NSIndexPath *_selectedAction;
}

#pragma mark -
#pragma mark - Initialization

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        self.view.backgroundColor = [UIColor clearColor];
        self.view.clipsToBounds = YES;
    }
    
    return self;
}

- (void)tabsInit:(NSArray *)tabs {
    
    if (tabs) {
        
        _tabsButtons = [NSArray arrayWithArray:tabs];
        
        [_tabsButtons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            if ([obj isKindOfClass:[SMTabBarItem class]])
                _tabsButtonsHeight += tabHeight;
            
        }];
        
        _tabsTable = [[[UITableView alloc] initWithFrame:tabsButtonsFrame style:UITableViewStylePlain] autorelease];
        _tabsTable.scrollEnabled = NO;
        _tabsTable.dataSource = self;
        _tabsTable.delegate = self;
        
        if (iOS_7) {
            
            _tabsTable.separatorInset = UIEdgeInsetsZero;
        }
        
        _tabsTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tabsTable.backgroundColor = [UIColor clearColor];
        _tabsTable.tableFooterView = [[[UIView alloc] init] autorelease];
        
        [self.view addSubview:_tabsTable];
    }
}

- (void)actionsInit:(NSArray *)actions {
    
    if (actions) {
        
        _actionsButtons = [NSArray arrayWithArray:actions];
        
        [_actionsButtons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            if ([obj isKindOfClass:[SMTabBarItem class]])
                _actionsButtonsHeight += tabHeight;
            
        }];
        
        _actionsTable = [[[UITableView alloc] initWithFrame:actionButtonFrame style:UITableViewStylePlain] autorelease];
        _actionsTable.scrollEnabled = NO;
        _actionsTable.delegate = self;
        _actionsTable.dataSource = self;
        
        if (iOS_7) {
            
            _actionsTable.separatorInset = UIEdgeInsetsZero;
        }

        _actionsTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _actionsTable.backgroundColor = [UIColor clearColor];
        _actionsTable.tableFooterView = [[[UIView alloc] init] autorelease];
        
        [self.view addSubview:_actionsTable];
    }
}

- (UIView *)tableHeaderSeparator {
    
    UIView *lineView = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 0.7)] autorelease];
    lineView.backgroundColor = [UIColor lightGrayColor];
    return lineView;
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

- (void)dealloc {
    
    [_selectedAction release];
    [_selectedTab release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark - Properties

- (void)setTabsButtons:(NSArray *)tabsButtons {
    
    [self tabsInit:tabsButtons];
}

- (void)setActionsButtons:(NSArray *)actionsButtons {
    
    [self actionsInit:actionsButtons];
}

#pragma mark -
#pragma mark - UITableViewDataSource/Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableView == _tabsTable ? _tabsButtons.count : _actionsButtons.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return tabHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SMTabBarItemCell *cell = [[[SMTabBarItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] autorelease];
    
    SMTabBarItem *tabItem = nil;
    
    if (tableView == _tabsTable) {
        
        tabItem = [_tabsButtons objectAtIndex:indexPath.row];
    }
    else if (tableView == _actionsTable) {
        
        tabItem = [_actionsButtons objectAtIndex:indexPath.row];
    }
    
    cell.iconView.image = tabItem.image;
    cell.titleLabel.text = tabItem.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == _tabsTable) {
        
        [_selectedTab autorelease], _selectedTab = indexPath.copy;
        [_actionsTable deselectRowAtIndexPath:_selectedAction animated:NO];
    }
    else {
        
        [_selectedAction autorelease], _selectedAction = indexPath.copy;
        [_tabsTable deselectRowAtIndexPath:_selectedTab animated:NO];
    }
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
