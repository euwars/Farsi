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

- (id)initWithCoder:(NSCoder *)aCoder{
    if(self = [super initWithCoder:aCoder]){
    
    }
    return self;
}


- (void)awakeFromNib{
    [super awakeFromNib];
    
    [[self rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(UIControl *x) {
         FarsiThemeView *View = (FarsiThemeView*)[[[[self.superview nextResponder] nextResponder] nextResponder] nextResponder];
         
         if (self.viewNumber == 0) {
             View.alphabetsView.hidden = NO;
             View.numbersView.hidden = YES;
             View.specialsView.hidden = YES;
         }
         
         if (self.viewNumber == 1) {
             View.alphabetsView.hidden = YES;
             View.numbersView.hidden = NO;
             View.specialsView.hidden = YES;
         }
         
         if (self.viewNumber == 2) {
             View.alphabetsView.hidden = YES;
             View.numbersView.hidden = YES;
             View.specialsView.hidden = NO;
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
