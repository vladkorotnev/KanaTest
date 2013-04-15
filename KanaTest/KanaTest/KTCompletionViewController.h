//
//  KTCompletionViewController.h
//  KanaTest
//
//  Created by Vladislav Korotnev on 3/12/13.
//  Copyright (c) 2013 Vladislav Korotnev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KTCompletionViewController : UIViewController
@property (nonatomic,retain) NSString* congratulationString;
@property (retain, nonatomic) IBOutlet UILabel *grats;
- (IBAction)imOuttaHere:(id)sender;
- (IBAction)tellTheWorld:(id)sender;

@end
