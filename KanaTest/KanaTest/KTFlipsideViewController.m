//
//  KTFlipsideViewController.m
//  KanaTest
//
//  Created by Vladislav Korotnev on 3/12/13.
//  Copyright (c) 2013 Vladislav Korotnev. All rights reserved.
//

#import "KTFlipsideViewController.h"

@interface KTFlipsideViewController ()

@end

@implementation KTFlipsideViewController

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
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (actionSheet.cancelButtonIndex == buttonIndex) {
        return;
    }
    NSArray *urls = [NSArray arrayWithObjects:
                     @"tweetbot:///user_profile/{handle}", // TweetBot
                        @"echofon:///user_timeline?{handle}", // Echofon
                     @"twit:///user?screen_name={handle}", // Twittelator Pro
                     @"x-seesmic://twitter_profile?twitter_screen_name={handle}", // Seesmic
                     @"x-birdfeed://user?screen_name={handle}", // Birdfeed
                     @"tweetings:///user?screen_name={handle}", // Tweetings
                     @"simplytweet:?link=http://twitter.com/{handle}", // SimplyTweet
                     @"icebird://user?screen_name={handle}", // IceBird
                     @"fluttr://user/{handle}", // Fluttr
                     @"twitter://user?screen_name={handle}", // Twitter
                     @"http://twitter.com/{handle}",
                     nil];
    
    UIApplication *application = [UIApplication sharedApplication];
    
    for (NSString *candidate in urls) {
        NSURL *url = [NSURL URLWithString:[candidate stringByReplacingOccurrencesOfString:@"{handle}" withString:[actionSheet buttonTitleAtIndex:buttonIndex]]];
        if ([application canOpenURL:url])
        {
            [application openURL:url];
            return;
        }
    }
}
- (IBAction)twitterFollow:(id)sender {
    [[ [UIActionSheet alloc]initWithTitle:@"Whom to follow?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"vladkorotnev",@"Hack_iOS", nil]showInView:self.view ];
}

-(void)viewWillAppear:(BOOL)animated    {
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"about"]];
}

#pragma mark - Actions

- (IBAction)done:(id)sender
{
    [self.delegate flipsideViewControllerDidFinish:self];
}

@end
