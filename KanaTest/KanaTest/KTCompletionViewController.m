//
//  KTCompletionViewController.m
//  KanaTest
//
//  Created by Vladislav Korotnev on 3/12/13.
//  Copyright (c) 2013 Vladislav Korotnev. All rights reserved.
//

#import "KTCompletionViewController.h"

@interface KTCompletionViewController ()

@end

@implementation KTCompletionViewController
@synthesize congratulationString;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated {
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"result"]];
    [self.grats setText:[self.congratulationString copy]];
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

- (void)dealloc {
    [_grats release];
    [super dealloc];
}
- (IBAction)imOuttaHere:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)tellTheWorld:(id)sender {
    if ([UIActivityViewController class]!=nil) {
        NSArray* dataToShare = @[[self.grats.text stringByReplacingOccurrencesOfString:@"you" withString:@"I"]];  // usability lol
        
        UIActivityViewController* activityViewController;
        activityViewController =[[UIActivityViewController alloc] initWithActivityItems:dataToShare applicationActivities:nil];

        [self presentViewController:activityViewController animated:YES completion:^{}];
        return;
    }
}
@end
