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
#define tabItemHeight 60
#define tabsButtonsFrame CGRectMake(0, 10 + iOS_7 * 20, tabBarWidth, _tabsButtonsHeight)
#define actionButtonFrame CGRectMake(0, self.view.bounds.size.height - _actionsButtonsHeight + iOS_7 * 20 - tabItemHeight / 2 * iOS_7 - 10 * !iOS_7, tabBarWidth, _actionsButtonsHeight)

@interface SMTabBar ()

@property (nonatomic, retain) UITableView *tabsTable;
@property (nonatomic, retain) UITableView *actionsTable;

@end

@implementation SMTabBar
{
    __block CGFloat _tabsButtonsHeight;
    __block CGFloat _actionsButtonsHeight;
    NSIndexPath *_selectedTab;
}

#pragma mark -
#pragma mark - Initialization

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        self.view.clipsToBounds = YES;
//        self.view.layer.cornerRadius = 7;
        self.view.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)tabsInit:(NSArray *)tabs {
    
    if (tabs) {
        
        NSMutableArray *tmpItems = [NSMutableArray array];
        
        [tabs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            if ([obj isKindOfClass:[SMTabBarItem class]]) {
                
                _tabsButtonsHeight += tabItemHeight;
                [tmpItems addObject:obj];
            }
        }];
        
        _tabsButtons = [[NSArray arrayWithArray:tmpItems] retain];
        
        _tabsTable = [[UITableView alloc] initWithFrame:tabsButtonsFrame style:UITableViewStylePlain];
        _tabsTable.scrollEnabled = NO;
        _tabsTable.dataSource = self;
        _tabsTable.delegate = self;
        
        if (iOS_7) {
            
            _tabsTable.separatorInset = UIEdgeInsetsZero;
        }
        
        _tabsTable.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tabsTable.backgroundColor = [UIColor clearColor];
        _tabsTable.tableFooterView = [[[UIView alloc] init] autorelease];
        
        if (_tabsButtons.count > 0) {
            
            NSIndexPath *firstTab = [NSIndexPath indexPathForRow:0 inSection:0];
            _selectedTabIndex = [firstTab row];
            [_tabsTable selectRowAtIndexPath:firstTab animated:YES scrollPosition:UITableViewScrollPositionNone];
            [self tableView:_tabsTable didSelectRowAtIndexPath:firstTab];
        }
        
        [self.view addSubview:_tabsTable];
    }
}

- (void)actionsInit:(NSArray *)actions {
    
    if (actions) {
        
        NSMutableArray *tmpItems = [NSMutableArray array];
        
        [actions enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            if ([obj isKindOfClass:[SMTabBarItem class]]) {
                
                _actionsButtonsHeight += tabItemHeight;
                [tmpItems addObject:obj];
            }
        }];
        
        _actionsButtons = [[NSArray arrayWithArray:tmpItems] retain];
        
        _actionsTable = [[UITableView alloc] initWithFrame:actionButtonFrame style:UITableViewStylePlain];
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
    
    [_tabsTable release];
    [_actionsTable release];
    [_selectedTab release];
    
    [_tabsButtons release];
    [_actionsButtons release];
    
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
    
    return tabItemHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SMTabBarItemCell *cell = [[[SMTabBarItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] autorelease];
    
    SMTabBarItem *tabItem = nil;
    
    if (tableView == _tabsTable) {
        
        tabItem = [_tabsButtons objectAtIndex:indexPath.row];
        cell.viewController = tabItem.viewController;
    }
    else if (tableView == _actionsTable) {
        
        tabItem = [_actionsButtons objectAtIndex:indexPath.row];
        cell.actionBlock = tabItem.actionBlock;
    }
    
    cell.iconView.image = tabItem.image;
    cell.titleLabel.text = tabItem.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == _tabsTable) {
        
        if (![_selectedTab isEqual:indexPath]) {
            
            [_selectedTab autorelease], _selectedTab = indexPath.copy;
            _selectedTabIndex = [indexPath row];
            SMTabBarItemCell *cell = (SMTabBarItemCell *)[tableView cellForRowAtIndexPath:indexPath];
            [self.delegate tabBar:self selectedViewController:cell.viewController];
        }
    }
    else {
        
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
        [_tabsTable selectRowAtIndexPath:_selectedTab animated:NO scrollPosition:UITableViewScrollPositionNone];
        SMTabBarItemCell *selectedCell = (SMTabBarItemCell *)[tableView cellForRowAtIndexPath:indexPath];
        if (selectedCell.actionBlock)
            selectedCell.actionBlock();
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
