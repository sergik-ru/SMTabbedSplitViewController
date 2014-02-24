//
//  SMTestDetailViewController.m
//  SMTabbedSplitViewController
//
//  Created by Sergey Marchukov on 20.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import "SMTestDetailViewController.h"

@interface SMTestDetailViewController ()

@end

@implementation SMTestDetailViewController

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
    self.webView.delegate = self;
}

- (void)setSiteURL:(NSString *)siteURL {
    
    _siteURL = siteURL;
    
    NSURL *url = [NSURL URLWithString:_siteURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
    
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    
}

- (void)dealloc {
    
    [_webView release];
    [_siteURL release];
    [super dealloc];
}

@end
