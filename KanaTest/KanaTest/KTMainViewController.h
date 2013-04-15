//
//  KTMainViewController.h
//  KanaTest
//
//  Created by Vladislav Korotnev on 3/12/13.
//  Copyright (c) 2013 Vladislav Korotnev. All rights reserved.
//

#import "KTFlipsideViewController.h"
#import "KTTestViewController.h"
@interface KTMainViewController : UIViewController <KTFlipsideViewControllerDelegate>

- (IBAction)showInfo:(id)sender;
- (IBAction)startHiragana:(id)sender;
- (IBAction)startKatakana:(id)sender;

@end
