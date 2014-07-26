//
//  SMTabBar.m
//  SMSplitViewController
//
//  Created by Sergey Marchukov on 15.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//
//  This content is released under the ( http://opensource.org/licenses/MIT ) MIT License.
//

#import "SMTabBar.h"
#import "SMTabBarItem.h"
#import "SMTabBarItemCell.h"

#define iOS_7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
static const NSInteger tabBarWidth = 70;
static const NSInteger tabItemHeight = 60;
#define tabsButtonsFrame CGRectMake(0, 10 + iOS_7 * 20, tabBarWidth, _tabsButtonsHeight)
#define actionButtonFrame CGRectMake(0, self.view.frame.size.height - _actionsButtonsHeight + iOS_7 * 20 - tabItemHeight / 2 * iOS_7 - 10 * !iOS_7, tabBarWidth, _actionsButtonsHeight)

@interface SMTabBar () <UITableViewDelegate, UITableViewDataSource>
{
    CGFloat _tabsButtonsHeight;
    CGFloat _actionsButtonsHeight;
    NSIndexPath *_selectedTab;
}

@property (nonatomic, strong) UITableView *tabsTable;
@property (nonatomic, strong) UITableView *actionsTable;

@end

@implementation SMTabBar

#pragma mark -
#pragma mark - Initialization

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        self.view.clipsToBounds = YES;
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
        
        _tabsButtons = [NSArray arrayWithArray:tmpItems];
        
        _tabsTable = [[UITableView alloc] initWithFrame:tabsButtonsFrame style:UITableViewStylePlain];
        _tabsTable.scrollEnabled = NO;
        _tabsTable.dataSource = self;
        _tabsTable.delegate = self;
        
        _tabsTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tabsTable.backgroundColor = [UIColor clearColor];
        _tabsTable.tableFooterView = [[UIView alloc] init];
        
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
        
        _actionsButtons = [NSArray arrayWithArray:tmpItems];
        
        _actionsTable = [[UITableView alloc] initWithFrame:actionButtonFrame style:UITableViewStylePlain];
        _actionsTable.scrollEnabled = NO;
        _actionsTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _actionsTable.delegate = self;
        _actionsTable.dataSource = self;
        
        _actionsTable.backgroundColor = [UIColor clearColor];
        _actionsTable.tableFooterView = [[UIView alloc] init];
        
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
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        
        [_tabsTable selectRowAtIndexPath:[NSIndexPath indexPathForRow:_selectedTabIndex inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
    }
}

#pragma mark -
#pragma mark - Properties

- (void)setBackgroundImage:(UIImage *)backgroundImage {
    
    _backgroundImage = backgroundImage;
    CGRect frame = CGRectMake(0, 20 * iOS_7, self.view.bounds.size.width, self.view.bounds.size.height);
    UIGraphicsBeginImageContext(self.view.frame.size);
    [backgroundImage drawInRect:frame];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:image];
}

- (UIImage *)background {
    
    return _backgroundImage;
}

- (void)setTabsButtons:(NSArray *)tabsButtons {
    
    [self tabsInit:tabsButtons];
}

-(void)setActionsButtons:(NSArray *)actionsButtons {
 
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
    SMTabBarItemCell *cell = [[SMTabBarItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    SMTabBarItem *tabItem = nil;
    
    if (tableView == _tabsTable) {
        
        tabItem = [_tabsButtons objectAtIndex:indexPath.row];
        cell.viewController = tabItem.viewController;
        cell.cellType = SMTabBarItemCellTab;
        cell.isFirstCell = indexPath.row == 0;
        cell.selectedColor = tabItem.viewController.view.backgroundColor;
    }
    else if (tableView == _actionsTable) {
        
        tabItem = [_actionsButtons objectAtIndex:indexPath.row];
        cell.actionBlock = tabItem.actionBlock;
        cell.cellType = SMTabBarItemCellAction;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.iconView.image = tabItem.image;
    cell.selectedImage = tabItem.selectedImage;
    cell.image = tabItem.image;
    cell.titleLabel.text = tabItem.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == _tabsTable) {
        
        if (![_selectedTab isEqual:indexPath]) {
            
            _selectedTab = [indexPath copy];
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
