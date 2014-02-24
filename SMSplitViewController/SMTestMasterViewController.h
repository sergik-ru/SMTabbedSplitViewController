//
//  SMTestMasterViewController.h
//  SMTabbedSplitViewController
//
//  Created by Sergey Marchukov on 18.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMTestMasterViewController : UIViewController

@property (retain, nonatomic) IBOutlet UILabel *textLabel;
@property (retain, nonatomic) IBOutlet UIButton *buttonNext;
@property (retain, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, copy) NSString *siteURL;

- (IBAction)buttonClick:(id)sender;

@end
