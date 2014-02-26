//
//  SMMainViewController.m
//  SMTabbedSplitViewController
//
//  Created by Sergey Marchukov on 23.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import "SMMainViewController.h"
#import "SMTestMasterViewController.h"
#import "SMTabbedSplitViewController.h"
#import "SMTabBarItem.h"

@interface SMMainViewController ()

@end

@implementation SMMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClick:(id)sender {
    
    SMTabbedSplitViewController *split = [[[SMTabbedSplitViewController alloc] initTabbedSplit] autorelease];
    
    //split.tabBar.backgroundImage = [UIImage imageNamed:@""];
    
    SMTestMasterViewController *tab1VC = [[[SMTestMasterViewController alloc] init] autorelease];
    tab1VC.view.backgroundColor = [UIColor lightGrayColor];
    SMTabBarItem *tab1 = [[[SMTabBarItem alloc] initWithVC:tab1VC image:[UIImage imageNamed:@"Evernote"] andTitle:@"Evernote"] autorelease];
    tab1VC.textLabel.text = tab1.title;
    tab1VC.imageView.image = tab1.image;
    tab1VC.siteURL = @"https://www.evernote.com";
    
    SMTestMasterViewController *tab2VC = [[[SMTestMasterViewController alloc] init] autorelease];
    tab2VC.view.backgroundColor = [UIColor greenColor];
    SMTabBarItem *tab2 = [[[SMTabBarItem alloc] initWithVC:tab2VC image:[UIImage imageNamed:@"Twitter"] andTitle:@"Twitter"] autorelease];
    tab2VC.textLabel.text = tab2.title;
    tab2VC.imageView.image = tab2.image;
    tab2VC.siteURL = @"https://www.twitter.com";
    
    SMTestMasterViewController *tab3VC = [[[SMTestMasterViewController alloc] init] autorelease];
    tab3VC.view.backgroundColor = [UIColor blueColor];
    SMTabBarItem *tab3 = [[[SMTabBarItem alloc] initWithVC:tab3VC image:[UIImage imageNamed:@"Google+"] andTitle:@"Google+"] autorelease];
    tab3VC.textLabel.text = tab3.title;
    tab3VC.imageView.image = tab3.image;
    tab3VC.siteURL = @"https://www.plus.google.com";
    
    SMTestMasterViewController *tab4VC = [[[SMTestMasterViewController alloc] init] autorelease];
    tab4VC.view.backgroundColor = [UIColor blackColor];
    SMTabBarItem *tab4 = [[[SMTabBarItem alloc] initWithVC:tab4VC image:[UIImage imageNamed:@"Instagram"] andTitle:@"Instagram"] autorelease];
    tab4VC.textLabel.text = tab4.title;
    tab4VC.imageView.image = tab4.image;
    tab4VC.siteURL = @"http://www.instagram.com";
    
    SMTestMasterViewController *tab5VC = [[[SMTestMasterViewController alloc] init] autorelease];
    tab5VC.view.backgroundColor = [UIColor grayColor];
    SMTabBarItem *tab5 = [[[SMTabBarItem alloc] initWithVC:tab5VC image:[UIImage imageNamed:@"LastFM"] andTitle:@"LastFM"] autorelease];
    tab5VC.textLabel.text = tab5.title;
    tab5VC.imageView.image = tab5.image;
    tab5VC.siteURL = @"https://www.last.fm";
    
    SMTestMasterViewController *tab6VC = [[[SMTestMasterViewController alloc] init] autorelease];
    tab6VC.view.backgroundColor = [UIColor orangeColor];
    SMTabBarItem *tab6 = [[[SMTabBarItem alloc] initWithVC:tab6VC image:[UIImage imageNamed:@"Reddit"] andTitle:@"Reddit"] autorelease];
    tab6VC.textLabel.text = tab6.title;
    tab6VC.imageView.image = tab6.image;
    tab6VC.siteURL = @"http://www.reddit.com";
    
    SMTabBarItem *action = [[[SMTabBarItem alloc] initWithActionBlock:^{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"About" message:@"SMTabbedSplitViewController by Marchukov Sergey" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    } image:[UIImage imageNamed:@"info"] andTitle:@"About"] autorelease];
    
    SMTabBarItem *action2 = [[[SMTabBarItem alloc] initWithActionBlock:^{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Exit message" message:@"Do you really want to quit?" delegate:self cancelButtonTitle:@"YES" otherButtonTitles:@"NO", nil];
        [alert show];
        [alert release];
    } image:[UIImage imageNamed:@"exit"] andTitle:@"Exit"] autorelease];
    
    split.tabsViewControllers = @[tab1, tab2, tab3, tab4, tab5, tab6];
    split.actionsTabs = @[action, action2];
    
    split.background = [UIColor whiteColor];
    
    [self.navigationController pushViewController:split animated:YES];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
    
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

@end
