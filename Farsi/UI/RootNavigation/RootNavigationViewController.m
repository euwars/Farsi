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
    // Do any additional setup after loading the view.
    
    [RACObserve(INFO, keyboardIsActive) subscribeNext:^(id x) {
        UIViewController *rootVC = INFO.keyboardIsActive ? [self.storyboard instantiateViewControllerWithIdentifier:@"Home"] : [self.storyboard instantiateViewControllerWithIdentifier:@"GetStarted"];
        [self setViewControllers:@[rootVC] animated:NO];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
