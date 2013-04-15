//
//  KTTestViewController.h
//  KanaTest
//
//  Created by Vladislav Korotnev on 3/12/13.
//  Copyright (c) 2013 Vladislav Korotnev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WToast.h"
#import "KTCompletionViewController.h"
@interface KTTestViewController : UIViewController
- (IBAction)closeTest:(id)sender;
@property (retain, nonatomic) IBOutlet UINavigationItem *titleItem;
@property (nonatomic, retain) NSString* testName;
@property (nonatomic,retain)NSDictionary* testData;
@property (nonatomic,retain)NSMutableArray* alreadyPresentedQuestions;
@property (retain, nonatomic) IBOutlet UILabel *currentSym;
@property (retain, nonatomic) IBOutlet UIProgressView *progress;
- (IBAction)answerButtonHandler:(UIButton *)sender;
@property (retain, nonatomic) IBOutlet UIButton *button1;
@property (retain, nonatomic) IBOutlet UIButton *button2;
@property (retain, nonatomic) IBOutlet UIButton *button3;
@property (retain, nonatomic) IBOutlet UIButton *button4;

@end
