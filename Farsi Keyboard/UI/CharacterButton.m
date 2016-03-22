//
//  CharacterButton.m
//  Farsi
//
//  Created by Farzad Nazifi on 3/22/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import "characterButton.h"
#import "UIViewController+Core.h"
#import "FarsiKeyboardViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation CharacterButton

- (id)initWithCoder:(NSCoder *)aCoder{
    if(self = [super initWithCoder:aCoder]){
        
//        self.titleLabel.layer.shadowColor = [self.currentTitleColor CGColor];
//        self.titleLabel.layer.shadowRadius = 4.0f;
//        self.titleLabel.layer.shadowOpacity = .9;
//        self.titleLabel.layer.shadowOffset = CGSizeZero;

        [[self rac_signalForControlEvents:UIControlEventTouchUpInside]
         subscribeNext:^(UIControl *x) {
             
             FarsiKeyboardViewController *vc = (FarsiKeyboardViewController*)[[[[[[self.superview nextResponder] nextResponder]nextResponder] nextResponder] nextResponder] nextResponder];
             if ([self.insertStr isEqualToString:@"Delete"]) {
                 [[NSNotificationCenter defaultCenter] postNotificationName:@"Delete" object:nil];
             }else{
                 vc.insertedString = self.insertStr ? self.insertStr : self.titleLabel.text;
             }
        }];
    }
    return self;
}

@end
