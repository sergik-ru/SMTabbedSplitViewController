//
//  SMMainViewController.h
//  SMTabbedSplitViewController
//
//  Created by Sergey Marchukov on 06.03.14.
//  Copyright (c) 2014 Sergey Marchukov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMMainViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *btn_openSplit;

- (IBAction)buttonClick:(id)sender;

@end
