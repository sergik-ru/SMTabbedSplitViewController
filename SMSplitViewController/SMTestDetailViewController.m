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

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.webView.delegate = self;
}

- (void)setSiteURL:(NSURL *)siteURL {
    
    _siteURL = siteURL;
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:_siteURL];
    [self.webView loadRequest:requestObj];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
    
}

-(void)webViewDidStartLoad:(UIWebView *)webView {
    
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    
}


@end
