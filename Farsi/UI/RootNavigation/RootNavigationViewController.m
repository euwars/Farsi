//
//  RootNavigationViewController.m
//  Farsi
//
//  Created by Farzad Nazifi on 3/19/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import "RootNavigationViewController.h"
#import "FACore.h"

@interface RootNavigationViewController ()

@end

@implementation RootNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    
    [RACObserve(INFO, keyboardIsActive) subscribeNext:^(id x) {
        UIViewController *rootVC = !INFO.keyboardIsActive ? [self.storyboard instantiateViewControllerWithIdentifier:@"Home"] : [self.storyboard instantiateViewControllerWithIdentifier:@"GetStarted"];
        [self setViewControllers:@[rootVC] animated:NO];
    }];  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
