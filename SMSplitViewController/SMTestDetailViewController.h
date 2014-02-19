//
//  SMTestDetailViewController.h
//  SMTabbedSplitViewController
//
//  Created by Sergey Marchukov on 20.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMTestDetailViewController : UIViewController <UIWebViewDelegate>

@property (retain, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, copy) NSString *siteURL;

@end
