//
//  KTMainViewController.m
//  KanaTest
//
//  Created by Vladislav Korotnev on 3/12/13.
//  Copyright (c) 2013 Vladislav Korotnev. All rights reserved.
//

#import "KTMainViewController.h"

@interface KTMainViewController ()

@end

@implementation KTMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"menu"]];
}

#pragma mark - Flipside View

- (void)flipsideViewControllerDidFinish:(KTFlipsideViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)showInfo:(id)sender
{    
    KTFlipsideViewController *controller = [[[KTFlipsideViewController alloc] initWithNibName:@"KTFlipsideViewController" bundle:nil] autorelease];
    controller.delegate = self;
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)startHiragana:(id)sender {
    KTTestViewController *controller = [[[KTTestViewController alloc] initWithNibName:@"KTTestViewController" bundle:nil] autorelease];
    [controller setTestName:@"Hiragana test"];
    [controller setTestData:[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"hiragana" ofType:@"plist"]]];
    
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
}

- (IBAction)startKatakana:(id)sender {
    KTTestViewController *controller = [[[KTTestViewController alloc] initWithNibName:@"KTTestViewController" bundle:nil] autorelease];
    [controller setTestName:@"Katakana test"];
    [controller setTestData:[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"katakana" ofType:@"plist"]]];
    controller.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:controller animated:YES completion:nil];
}

@end
