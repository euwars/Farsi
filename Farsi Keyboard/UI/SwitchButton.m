//
//  SwitchButton.m
//  Farsi
//
//  Created by Farzad Nazifi on 3/22/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import "SwitchButton.h"
#import "UIViewController+Core.h"
#import "FarsiKeyboardViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "FarsiThemeView.h"

@implementation SwitchButton

- (void)awakeFromNib{
    [super awakeFromNib];
    
    [[self rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(UIControl *x) {
         FarsiThemeView *vc = (FarsiThemeView*)[[[[self.superview nextResponder] nextResponder] nextResponder] nextResponder];
         if (self.titleLabel.text.length > 0) {
         if (vc.currentView == 1 | vc.currentView == 2) {

             [self setTitle:@"۱۲۳" forState:UIControlStateNormal];
             vc.currentView = 0;
         }else{
             vc.currentView = 1;
             [self setTitle:@"الف" forState:UIControlStateNormal];
         }
         }
    }];
    
    
    if (self.viewNumber == 100) {
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        [self addGestureRecognizer:longPress];
    }
}

- (void)longPress:(UILongPressGestureRecognizer*)gesture {
    if ( gesture.state == UIGestureRecognizerStateBegan ) {
        if (self.viewNumber == 100) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"NextKeyboard" object:nil];
        }
    }
}

@end
