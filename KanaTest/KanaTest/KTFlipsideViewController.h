//
//  KTFlipsideViewController.h
//  KanaTest
//
//  Created by Vladislav Korotnev on 3/12/13.
//  Copyright (c) 2013 Vladislav Korotnev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KTFlipsideViewController;

@protocol KTFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(KTFlipsideViewController *)controller;
@end

@interface KTFlipsideViewController : UIViewController<UIActionSheetDelegate>

@property (assign, nonatomic) id <KTFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
