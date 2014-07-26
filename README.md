SMTabbedSplitViewController
===========================

Tabbed Split View Controller for iPad is a custom split view controller, with vertical left tabbar control for navigation between master view controllers. Tabbar contains tabs for navigation between view controllers and actions buttons for some actions (for example, exit from application). Also it can be used without tabbar control as customizable alternative UISplitViewController.

![Screenshot](https://raw.github.com/sergik-ru/SMTabbedSplitViewController/master/Screenshots/screenshot1.png)

Main features:
  - Flexible opportunities for display setup (you can change tabbar, master & detail view controllers sizes, styles and etc).
  - Left vertical tabbar for navigation between master view controllers.
  - Tabbar contains tabs and actions buttons.
  - Uses without tabbar like UISplitViewController.

Version History
----------
- 1.0.3 - iOS 8 & some others fixes
- 1.0.2 - Converted to ARC
- 1.0.1 - Example App Redisign
- 1.0 - Initial Version

Requirements
--------------

* Made to work with iOS 6+.
* ARC (1.0.2+) and under ARC (1.0.1)

Installation
--------------

SMTabbedSplitViewController can be installed via CocoaPods. Simply add
```
pod 'SMTabbedSplitViewController', '>= 1.0.3’
```
to your Podfile. 

If you don't use Cocoapods download and import SMTabbedSplitViewController folder into your project.

Then, subclass SMTabbedSplitViewController and override -init
```
#import "SMTabbedSplitViewController.h"
//or #import <SMTabbedSplitViewController.h> for CocoaPods
@interface ViewController : SMTabbedSplitViewController
```
or create instance of SMTabbedSplitViewController

```
SMTabbedSplitViewController *split = [[SMTabbedSplitViewController alloc] initTabbedSplit];
```
Use constructor -initTabbedSplit for create split with tabbar and -initSplit for create split without tabbar (default -init method called -initTabbedSplit) 

For create tabbar tabs you must create instance of view controller for this tab and use it when creating an object SMTabBarItem (also you can customize this tab item)
```
SMTestMasterViewController *tab1VC = [[SMTestMasterViewController alloc] init];
tab1VC.view.backgroundColor = [UIColor colorWithRed:0/255.0 green:127/255.0 blue:237/255.0 alpha:1.0];
SMTabBarItem *tab1 = [[SMTabBarItem alloc] initWithVC:tab1VC image:[UIImage imageNamed:@"Twitter"] andTitle:@"Twitter"];
tab1.selectedImage = [UIImage imageNamed:@"Twitter_sel"];
```
and set a tabsViewControllers property
```
split.tabsViewControllers = @[tab1, tab2, tab3, tab4, tab5, tab6];
```
For create actions buttons you must create SMTabBarItem with another constructor accepts action block instead of the view controller (like create tabs)
```
SMTabBarItem *action = [[SMTabBarItem alloc] initWithActionBlock:^{  
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"About" message:@"SMTabbedSplitViewController by Marchukov Sergey" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
[alert show];
} image:[UIImage imageNamed:@"info"] andTitle:@"About"];
```
and set a tabsActions property
```
split.actionsButtons = @[action, action2];
```
For create split view controller without tabbar, you must set master and detail view controllers (without SMTabBarItem) in viewControllers property like UISplitViewController
```
split.viewControllers = @[masterVC, detailVC];
```
Contact methods
---------------
If you have comments or suggestions for improving the project, you can always contact me the following ways:
- Email: Address is in my GitHub profile or git log.
- Leave a GitHub bug/issue.

Please report bugs/issues to help improve this code. Thanks!
License
----
This project is released under MIT License.

The MIT License (MIT)

Copyright (c) 2014 Sergey Marchukov

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
