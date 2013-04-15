//
//  KTTestViewController.m
//  KanaTest
//
//  Created by Vladislav Korotnev on 3/12/13.
//  Copyright (c) 2013 Vladislav Korotnev. All rights reserved.
//

#import "KTTestViewController.h"

@interface KTTestViewController ()

@end

@implementation KTTestViewController
@synthesize testData,testName,alreadyPresentedQuestions;
static int totalAnswered=0;
static int correctAnswers=0;
static bool shouldGTFO=false;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated  {
    [testData retain];
    [self seedQuestion];
    totalAnswered=0;
    correctAnswers=0;
    alreadyPresentedQuestions = [NSMutableArray new];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"intest"]];
    self.titleItem.title = [testName copy];
}
- (void) viewDidAppear:(BOOL)animated   {
    if (shouldGTFO) {
        [self dismissViewControllerAnimated:true completion:nil];
        shouldGTFO = false;
    }
}

- (void) seedQuestion {
    if (shouldGTFO) {
        return; //bugfix
    }
    totalAnswered = totalAnswered+1;
    if (alreadyPresentedQuestions.count == testData.allKeys.count) {
        // Done all questions correctly yay
    
            KTCompletionViewController *controller = [[[KTCompletionViewController alloc] initWithNibName:@"KTCompletionViewController" bundle:nil] autorelease];
            controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
        if (correctAnswers == 0) {
            [controller setCongratulationString:@"Oh well... No question answered correctly :("];
        }
        if (correctAnswers >0) {
            [controller setCongratulationString:[NSString stringWithFormat:@"Oh, %i questions out of %i were answered incorrectly. Just keep practicing and one day you'll pass this %@ with max score!",(totalAnswered-correctAnswers),totalAnswered,self.titleItem.title]];
        }
       
        if (correctAnswers >= totalAnswered-3) {
            [controller setCongratulationString:[NSString stringWithFormat:@"Welp, just %i questions out of %i were answered incorrectly. Keep on practicing and soon you'll pass this %@!",(totalAnswered-correctAnswers),totalAnswered,self.titleItem.title]];
        }
        
        if (correctAnswers == totalAnswered) {
            [controller setCongratulationString:[NSString stringWithFormat:@"Woah woah woah! You have passed all questions in the %@! Congratulations on that, good job!",self.titleItem.title]];
        }
        
            [self presentViewController:controller animated:YES completion:nil];
        shouldGTFO=true;
            return;
        
    }
    
    int newNumber = arc4random() % testData.allKeys.count;
    if((alreadyPresentedQuestions.count + 1) == testData.allKeys.count){
        // prevent lockup when 1 question left
        for (NSString*shit in testData.allKeys) {
            if (![alreadyPresentedQuestions containsObject:shit]) {
                newNumber = [testData.allKeys indexOfObject:shit];
            }
        }
    }   else
        while ([alreadyPresentedQuestions containsObject:[testData.allKeys objectAtIndex:newNumber]]) {
            newNumber = arc4random() % testData.allKeys.count;
        }
    
    [alreadyPresentedQuestions addObject:[testData.allKeys objectAtIndex:newNumber]];
    // save so the question wont repeat
    [alreadyPresentedQuestions retain];
    
    self.currentSym.text = [testData objectForKey:[testData.allKeys objectAtIndex:newNumber]];
    
    int curCorrectOne = (arc4random() % 4)+1;
    
    switch (curCorrectOne) {
        case 1:
            [self.button1 setTitle:[testData.allKeys objectAtIndex:newNumber] forState:UIControlStateNormal];
            int shit = newNumber;
            while (shit == newNumber) {
                shit = arc4random()  % testData.allKeys.count ;
            }
            [self.button2 setTitle:[testData.allKeys objectAtIndex:shit] forState:UIControlStateNormal];
            int shit2 = newNumber;
            while (shit2 == newNumber || shit2 == shit) {
                shit2 = arc4random()  % testData.allKeys.count ;
            }
            [self.button3 setTitle:[testData.allKeys objectAtIndex:shit2] forState:UIControlStateNormal];
            int shit3 = newNumber;
            while (shit3 == newNumber || shit3 == shit || shit3 == shit2) {
                shit3 = arc4random()  % testData.allKeys.count ;
            }
            [self.button4 setTitle:[testData.allKeys objectAtIndex:shit3] forState:UIControlStateNormal];
            break;
            
        case 2:
            [self.button2 setTitle:[testData.allKeys objectAtIndex:newNumber] forState:UIControlStateNormal];
            int ashit = newNumber;
            while (ashit == newNumber) {
                ashit = arc4random()  % testData.allKeys.count ;
            }
            [self.button1 setTitle:[testData.allKeys objectAtIndex:ashit] forState:UIControlStateNormal];
            int ashit2 = newNumber;
            while (ashit2 == newNumber || ashit2 == ashit) {
                ashit2 = arc4random()  % testData.allKeys.count ;
            }
            [self.button3 setTitle:[testData.allKeys objectAtIndex:ashit2] forState:UIControlStateNormal];
            int ashit3 = newNumber;
            while (ashit3 == newNumber || ashit3 == ashit || ashit3 == ashit2) {
                ashit3 = arc4random()  % testData.allKeys.count ;
            }
            [self.button4 setTitle:[testData.allKeys objectAtIndex:ashit3] forState:UIControlStateNormal];
            break;
        case 3:
            [self.button3 setTitle:[testData.allKeys objectAtIndex:newNumber] forState:UIControlStateNormal];
            int bshit = newNumber;
            while (bshit == newNumber) {
                bshit = arc4random()  % testData.allKeys.count ;
            }
            [self.button2 setTitle:[testData.allKeys objectAtIndex:bshit] forState:UIControlStateNormal];
            int bshit2 = newNumber;
            while (bshit2 == newNumber || bshit2 == bshit) {
                bshit2 = arc4random()  % testData.allKeys.count ;
            }
            [self.button1 setTitle:[testData.allKeys objectAtIndex:bshit2] forState:UIControlStateNormal];
            int bshit3 = newNumber;
            while (bshit3 == newNumber || bshit3 == bshit || bshit3 == bshit2) {
                bshit3 = arc4random()  % testData.allKeys.count ;
            }
            [self.button4 setTitle:[testData.allKeys objectAtIndex:bshit3] forState:UIControlStateNormal];
            break;
        case 4:
            [self.button4 setTitle:[testData.allKeys objectAtIndex:newNumber] forState:UIControlStateNormal];
            int cshit = newNumber;
            while (cshit == newNumber) {
                cshit = arc4random()  % testData.allKeys.count ;
            }
            [self.button2 setTitle:[testData.allKeys objectAtIndex:cshit] forState:UIControlStateNormal];
            int cshit2 = newNumber;
            while (cshit2 == newNumber || cshit2 == cshit) {
                cshit2 = arc4random()  % testData.allKeys.count ;
            }
            [self.button3 setTitle:[testData.allKeys objectAtIndex:cshit2] forState:UIControlStateNormal];
            int cshit3 = newNumber;
            while (cshit3 == newNumber || cshit3 == cshit || cshit3 == cshit2) {
                cshit3 = arc4random()  % testData.allKeys.count ;
            }
            [self.button1 setTitle:[testData.allKeys objectAtIndex:cshit3] forState:UIControlStateNormal];
            break;
            
        default:
            NSLog(@"WTF, shit!");
            break;
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeTest:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}
- (void)dealloc {
    [_titleItem release];
    [_currentSym release];
    [_progress release];
    [_button1 release];
    [_button2 release];
    [_button3 release];
    [_button4 release];
    [super dealloc];
}
- (IBAction)answerButtonHandler:(UIButton *)sender {
    if ([[testData objectForKey:sender.titleLabel.text] isEqualToString:self.currentSym.text]) {
        [WToast showWithText:@"Correct!"];
        correctAnswers++;
        [self seedQuestion];
    } else {
        [WToast showWithText:@"Nope :("];
        [self seedQuestion];
    }
        
    
}
@end
