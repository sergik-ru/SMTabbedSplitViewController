//
//  SMTestMasterViewController.h
//  SMTabbedSplitViewController
//
//  Created by Sergey Marchukov on 18.02.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMTestMasterViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *textLabel;
@property (strong, nonatomic) IBOutlet UIButton *buttonNext;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (nonatomic, copy) NSString *siteURL;

- (IBAction)buttonClick:(id)sender;

@end
