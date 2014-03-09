//
//  SMMainViewController.m
//  SMTabbedSplitViewController
//
//  Created by Sergey Marchukov on 06.03.14.
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
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *btn_bg = [[UIImage imageNamed:@"btn_bg_black"] resizableImageWithCapInsets:UIEdgeInsetsMake(2, 2, 2, 2)];
    [_btn_openSplit setBackgroundImage:btn_bg forState:UIControlStateNormal];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    _btn_openSplit.frame = CGRectMake(self.view.frame.size.width / 2 - 150, self.view.frame.size.height / 2 - 20, 300, 40);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClick:(id)sender {
    
    SMTabbedSplitViewController *split = [[[SMTabbedSplitViewController alloc] initTabbedSplit] autorelease];
    
    SMTestMasterViewController *tab1VC = [[[SMTestMasterViewController alloc] init] autorelease];
    tab1VC.view.backgroundColor = [UIColor colorWithRed:0/255.0 green:127/255.0 blue:237/255.0 alpha:1.0];
    SMTabBarItem *tab1 = [[[SMTabBarItem alloc] initWithVC:tab1VC image:[UIImage imageNamed:@"Twitter"] andTitle:@"Twitter"] autorelease];
    tab1.selectedImage = [UIImage imageNamed:@"Twitter_sel"];
    tab1VC.textLabel.text = tab1.title;
    tab1VC.imageView.image = [UIImage imageNamed:@"twitter-logo"];
    tab1VC.siteURL = @"https://www.twitter.com";
    
    SMTestMasterViewController *tab2VC = [[[SMTestMasterViewController alloc] init] autorelease];
    tab2VC.view.backgroundColor = [UIColor colorWithRed:59/255.0 green:89/255.0 blue:152/255.0 alpha:1.0];
    SMTabBarItem *tab2 = [[[SMTabBarItem alloc] initWithVC:tab2VC image:[UIImage imageNamed:@"Facebook"] andTitle:@"Facebook"] autorelease];
    tab2.selectedImage = [UIImage imageNamed:@"Facebook_sel"];
    tab2VC.textLabel.text = tab2.title;
    tab2VC.imageView.image = [UIImage imageNamed:@"facebook-logo"];
    tab2VC.siteURL = @"https://www.facebook.com";
    
    SMTestMasterViewController *tab3VC = [[[SMTestMasterViewController alloc] init] autorelease];
    tab3VC.view.backgroundColor = [UIColor colorWithRed:221/255.0 green:75/255.0 blue:57/255.0 alpha:1.0];
    SMTabBarItem *tab3 = [[[SMTabBarItem alloc] initWithVC:tab3VC image:[UIImage imageNamed:@"Google+"] andTitle:@"Google+"] autorelease];
    tab3.selectedImage = [UIImage imageNamed:@"Google+_sel"];
    tab3VC.textLabel.text = tab3.title;
    tab3VC.imageView.image = [UIImage imageNamed:@"googleplus-logo"];
    tab3VC.siteURL = @"https://www.plus.google.com";
    
    SMTestMasterViewController *tab4VC = [[[SMTestMasterViewController alloc] init] autorelease];
    tab4VC.view.backgroundColor = [UIColor colorWithRed:0 green:99/255.0 blue:220/255.0 alpha:1.0];
    SMTabBarItem *tab4 = [[[SMTabBarItem alloc] initWithVC:tab4VC image:[UIImage imageNamed:@"Flickr"] andTitle:@"Flickr"] autorelease];
    tab4.selectedImage = [UIImage imageNamed:@"Flickr_sel"];
    tab4VC.textLabel.text = tab4.title;
    tab4VC.imageView.image = [UIImage imageNamed:@"flickr-logo"];
    tab4VC.siteURL = @"http://www.flickr.com";
    
    SMTestMasterViewController *tab5VC = [[[SMTestMasterViewController alloc] init] autorelease];
    tab5VC.view.backgroundColor = [UIColor colorWithRed:255/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
    SMTabBarItem *tab5 = [[[SMTabBarItem alloc] initWithVC:tab5VC image:[UIImage imageNamed:@"Youtube"] andTitle:@"Youtube"] autorelease];
    tab5.selectedImage = [UIImage imageNamed:@"Youtube_sel"];
    tab5VC.textLabel.text = tab5.title;
    tab5VC.imageView.image = [UIImage imageNamed:@"youtube-logo"];
    tab5VC.siteURL = @"https://www.youtube.com";
    
    SMTestMasterViewController *tab6VC = [[[SMTestMasterViewController alloc] init] autorelease];
    tab6VC.view.backgroundColor = [UIColor colorWithRed:76/255.0 green:146/255.0 blue:195/255.0 alpha:1.0];
    SMTabBarItem *tab6 = [[[SMTabBarItem alloc] initWithVC:tab6VC image:[UIImage imageNamed:@"Linkedin"] andTitle:@"Linkedin"] autorelease];
    tab6.selectedImage = [UIImage imageNamed:@"Linkedin_sel"];
    tab6VC.textLabel.text = tab6.title;
    tab6VC.imageView.image = [UIImage imageNamed:@"linkedin-logo"];
    tab6VC.siteURL = @"http://www.linkedin.com";
    
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
    split.actionsButtons = @[action, action2];
    
    split.background = [UIColor whiteColor];
    
    [self.navigationController pushViewController:split animated:YES];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (void)dealloc {
    [_btn_openSplit release];
    [super dealloc];
}
@end
