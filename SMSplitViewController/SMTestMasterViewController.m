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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *btn_bg = [[UIImage imageNamed:@"btn_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(2, 2, 2, 2)];
    [_buttonNext setBackgroundImage:btn_bg forState:UIControlStateNormal];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_textLabel release];
    [_buttonNext release];
    [_imageView release];
    [_siteURL release];
    [super dealloc];
}

- (IBAction)buttonClick:(id)sender {
    
    UINavigationController *nc = (UINavigationController *)[[[UIApplication sharedApplication] delegate] window].rootViewController;
    SMTabbedSplitViewController *split = (SMTabbedSplitViewController *)nc.topViewController;
    SMTestDetailViewController *detailVC = [[[SMTestDetailViewController alloc] init] autorelease];
    split.detailViewController = detailVC;
    detailVC.siteURL = _siteURL;
}

- (void)setSiteURL:(NSString *)siteURL {
    
    _siteURL = siteURL.copy;
    
    NSRange range = [_siteURL rangeOfString:@"www"];
    NSString *site = [_siteURL stringByReplacingCharactersInRange:NSMakeRange(0, range.location) withString:@""];
    NSString *title = [NSString stringWithFormat:@"Open %@", site];
    [self.buttonNext setTitle:title forState:UIControlStateNormal];
}

@end
