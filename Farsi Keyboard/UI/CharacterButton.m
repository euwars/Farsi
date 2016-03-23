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
#import "FarsiThemeView.h"

@implementation CharacterButton

- (id)initWithCoder:(NSCoder *)aCoder{
    if(self = [super initWithCoder:aCoder]){
        
//        self.titleLabel.layer.shadowColor = [self.currentTitleColor CGColor];
//        self.titleLabel.layer.shadowRadius = 4.0f;
//        self.titleLabel.layer.shadowOpacity = .9;
//        self.titleLabel.layer.shadowOffset = CGSizeZero;

        [[self rac_signalForControlEvents:UIControlEventTouchDown]
         subscribeNext:^(UIControl *x) {
             FarsiKeyboardViewController *vc = (FarsiKeyboardViewController*)[[[[[[self.superview nextResponder] nextResponder]nextResponder] nextResponder] nextResponder] nextResponder];
             
             CGRect frame = [self.superview convertRect:self.frame fromView:(UIView*)[[[[[self.superview nextResponder] nextResponder]nextResponder] nextResponder] nextResponder]];
             NSLog(@"%@",NSStringFromCGRect(frame));
             vc.popoverStr = self.titleLabel.text;
             
             vc.popoverRect = CGRectMake(frame.origin.x-frame.size.width*.25, frame.origin.y*-1 - frame.size.height*.75, frame.size.width*1.5, frame.size.height*.8);
         }];

        [[self rac_signalForControlEvents:UIControlEventTouchUpOutside]
         subscribeNext:^(UIControl *x) {
             [[NSNotificationCenter defaultCenter] postNotificationName:@"TypeCancel" object:nil];
         }];
        
        
        [[self rac_signalForControlEvents:UIControlEventTouchUpInside]
         subscribeNext:^(UIControl *x) {
             
             FarsiKeyboardViewController *vc = (FarsiKeyboardViewController*)[[[[[[self.superview nextResponder] nextResponder]nextResponder] nextResponder] nextResponder] nextResponder];
             
             
             if (self.insertStr.length < 2) {
                 vc.insertedString = self.insertStr ? self.insertStr : self.titleLabel.text;
             }else{
                 [[NSNotificationCenter defaultCenter] postNotificationName:self.insertStr object:nil];
             }

                 
        }];
    }
    return self;
}

@end
