//
//  GetStartedViewController.m
//  Farsi
//
//  Created by Farzad Nazifi on 3/14/16.
//  Copyright © 2016 Notice. All rights reserved.
//

#import "GetStartedViewController.h"
#import "FACore.h"

@implementation GetStartedViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    
    self.backgroundImageView.alpha = 1;
    self.logoImageView.alpha = 0;
    self.sloganLabel.alpha = 0;
    self.getstartedButton.alpha = 0;
    self.githubButton.alpha = 0;

    [POPBasicAnimation fadeViewToAlpha:.85 WithDelay:0 forDuration:1 forView:self.backgroundImageView];
    [POPBasicAnimation fadeViewToAlpha:1 WithDelay:0.5 forDuration:1 forView:self.logoImageView];
    [POPBasicAnimation fadeViewToAlpha:.8 WithDelay:1.25 forDuration:1 forView:self.sloganLabel];
    [POPBasicAnimation fadeViewToAlpha:1 WithDelay:1.75 forDuration:1 forView:self.githubButton];
    [POPBasicAnimation fadeViewToAlpha:1 WithDelay:2.25 forDuration:1 forView:self.getstartedButton];
}

- (IBAction)githubAction:(id)sender {
    [UIViewController showSafariViewControllerForURLstr:@"https://github.com/euwars/Farsi" from:self];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
