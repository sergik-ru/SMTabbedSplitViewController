//
//  SMTestMasterViewController.m
//  SMTabbedSplitViewController
//
//  Created by Sergey Marchukov on 18.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import "SMTestMasterViewController.h"
#import "SMTabbedSplitViewController.h"
#import "SMTestDetailViewController.h"

@interface SMTestMasterViewController ()

@end

@implementation SMTestMasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *btn_bg = [[UIImage imageNamed:@"btn_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(2, 2, 2, 2)];
    [_buttonNext setBackgroundImage:btn_bg forState:UIControlStateNormal];

}

- (IBAction)buttonClick:(id)sender {
    
    UINavigationController *nc = (UINavigationController *)[[[UIApplication sharedApplication] delegate] window].rootViewController;
    SMTabbedSplitViewController *split = (SMTabbedSplitViewController *)nc.topViewController;
    SMTestDetailViewController *detailVC = [[SMTestDetailViewController alloc] init];
    split.detailViewController = detailVC;
    detailVC.siteURL = _siteURL;
}

- (void)setSiteURL:(NSString *)siteURL {
    
    _siteURL = [siteURL copy];
    
    NSRange range = [_siteURL rangeOfString:@"www"];
    NSString *site = [_siteURL stringByReplacingCharactersInRange:NSMakeRange(0, range.location) withString:@""];
    NSString *title = [NSString stringWithFormat:@"Open %@", site];
    [self.buttonNext setTitle:title forState:UIControlStateNormal];
}

@end
