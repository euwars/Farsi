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
#import "UIColor+Hex.h"
#import "UIColor+Core.h"

@implementation CharacterButton{
    CALayer *backgroundLayer;
    NSTimer *timer;
}

- (id)initWithCoder:(NSCoder *)aCoder{
    if(self = [super initWithCoder:aCoder]){
//        self.titleLabel.layer.shadowRadius = 4.0f;
//        self.titleLabel.layer.shadowOpacity = .45;
//        self.titleLabel.layer.shadowOffset = CGSizeZero;
        
        backgroundLayer = [CALayer layer];
        backgroundLayer.cornerRadius = 6;
        backgroundLayer.opacity = 1.0;
        backgroundLayer.zPosition = -1;
        backgroundLayer.shadowOffset = CGSizeMake(0, 1.0);
        backgroundLayer.backgroundColor = self.isAction ? [UIColor colorthree].CGColor : [UIColor colortwo].CGColor;
        backgroundLayer.shadowColor = self.isAction ? [[UIColor colorthree] darkerColor].CGColor : [[UIColor colortwo] darkerColor].CGColor;
        backgroundLayer.shadowOpacity = 1.0;
        backgroundLayer.shadowRadius = 0.0;
        [self.layer addSublayer:backgroundLayer];
        
        [[self rac_signalForControlEvents:UIControlEventTouchDown]
         subscribeNext:^(UIControl *x) {
             FarsiKeyboardViewController *vc = (FarsiKeyboardViewController*)[[[[[self.superview nextResponder]nextResponder] nextResponder] nextResponder] nextResponder];
             
             CGRect frame = [self.superview convertRect:self.frame fromView:(UIView*)[[[[self.superview nextResponder]nextResponder] nextResponder] nextResponder]];
             if (!self.isAction) {
                 vc.popoverStr = self.titleLabel.text;
                 vc.popoverRect = CGRectMake(frame.origin.x-frame.size.width*.15, frame.origin.y*-1 - frame.size.height, frame.size.width*1.3, frame.size.height);
             }

         }];

        [[self rac_signalForControlEvents:UIControlEventTouchUpOutside]
         subscribeNext:^(UIControl *x) {
             [[NSNotificationCenter defaultCenter] postNotificationName:@"TypeCancel" object:nil];
         }];
        
        
        [[self rac_signalForControlEvents:UIControlEventTouchUpInside]
         subscribeNext:^(UIControl *x) {
             
             FarsiKeyboardViewController *vc = (FarsiKeyboardViewController*)[[[[[self.superview nextResponder] nextResponder]nextResponder] nextResponder] nextResponder];
             
             
                 vc.insertedString = self.insertStr ? self.insertStr : self.titleLabel.text;


                 
        }];
    }
    return self;
}

- (void)longPress:(UILongPressGestureRecognizer*)gesture {
    if ( gesture.state == UIGestureRecognizerStateBegan ) {
        FarsiKeyboardViewController *vc = (FarsiKeyboardViewController*)[[[[[self.superview nextResponder]nextResponder] nextResponder] nextResponder] nextResponder];
        vc.insertedString = @"NextKeyboard";
    }
}


- (void)longPress2:(UILongPressGestureRecognizer*)gesture {
    if ( gesture.state == UIGestureRecognizerStateBegan ) {
       timer = [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(removeagha) userInfo:nil repeats:YES];
    }
    if (gesture.state == UIGestureRecognizerStateEnded) {
        [timer invalidate];
    }
}

- (void)removeagha{
    FarsiKeyboardViewController *vc = (FarsiKeyboardViewController*)[[[[[self.superview nextResponder]nextResponder] nextResponder] nextResponder] nextResponder];
    vc.insertedString = @"Delete";
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
    FarsiThemeView *vc = (FarsiThemeView*)[[[self.superview nextResponder] nextResponder] nextResponder];
    [RACObserve(vc, colorSet) subscribeNext:^(id x) {
        vc.backgroundColor = [UIColor colorone];
        backgroundLayer.backgroundColor = self.isAction ? [UIColor colorthree].CGColor : [UIColor colortwo].CGColor;
        backgroundLayer.shadowColor = self.isAction ? [[UIColor colorthree] darkerColor].CGColor : [[UIColor colortwo] darkerColor].CGColor;
        [self setTitleColor:[UIColor colorfour] forState:UIControlStateNormal];
        [self setTintColor:[UIColor colorfour]];
    }];
    
    if (self.isAction && [self.insertStr isEqualToString:@"Emoji"]) {
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
        [self addGestureRecognizer:longPress];
    }
    
    if (self.isAction && [self.insertStr isEqualToString:@"Delete"]) {
        UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress2:)];
        [self addGestureRecognizer:longPress];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    backgroundLayer.frame = CGRectMake(2.5, 5, self.frame.size.width-5, self.frame.size.height-10);
}


@end
