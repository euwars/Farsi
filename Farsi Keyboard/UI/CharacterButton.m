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
    CALayer *sublayer;
    NSTimer *timer;
}

- (id)initWithCoder:(NSCoder *)aCoder{
    if(self = [super initWithCoder:aCoder]){
        self.titleLabel.layer.shadowRadius = 4.0f;
        self.titleLabel.layer.shadowOpacity = .45;
        self.titleLabel.layer.shadowOffset = CGSizeZero;
        
        sublayer = [CALayer layer];
        sublayer.cornerRadius = 6;
        sublayer.opacity = 1.0;
        sublayer.zPosition = -1;
        sublayer.shadowOffset = CGSizeMake(0, 1.0);
        sublayer.shadowOpacity = 1.0;
        sublayer.shadowRadius = 0.0;
        [self.layer addSublayer:sublayer];
        
        [[self rac_signalForControlEvents:UIControlEventTouchDown]
         subscribeNext:^(UIControl *x) {
             FarsiKeyboardViewController *vc = (FarsiKeyboardViewController*)[[[[[self.superview nextResponder]nextResponder] nextResponder] nextResponder] nextResponder];
             
             CGRect frame = [self.superview convertRect:self.frame fromView:(UIView*)[[[[self.superview nextResponder]nextResponder] nextResponder] nextResponder]];
             if (!self.isAction) {
                 vc.popoverStr = self.titleLabel.text;
                 vc.popoverRect = CGRectMake(frame.origin.x-frame.size.width*.25, frame.origin.y*-1 - frame.size.height*.75, frame.size.width*1.5, frame.size.height*.8);
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
        
        sublayer.backgroundColor = self.isAction ? [UIColor colorthree].CGColor : [UIColor colortwo].CGColor;
        self.titleLabel.layer.shadowColor = [[UIColor colorfour] CGColor];

        sublayer.shadowColor = self.isAction ? [[UIColor colorthree] darkerColor].CGColor : [[UIColor colortwo] darkerColor].CGColor;
        
        [self setTitleColor:[UIColor colorfour] forState:UIControlStateNormal];
        
        [self setTintColor:[UIColor colorfour]];
        [self setNeedsDisplay];
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
    sublayer.frame = CGRectMake(2.5, 5, self.frame.size.width-5, self.frame.size.height-10);
}

@end
