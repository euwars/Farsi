//
//  SuggestionButton.m
//  Farsi
//
//  Created by Farzad Nazifi on 3/26/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import "SuggestionButton.h"
#import "UIColor+Core.h"
#import "FarsiThemeView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "FarsiKeyboardViewController.h"

@implementation SuggestionButton{
    CALayer *backgroundLayer;
}

- (id)initWithCoder:(NSCoder *)aCoder{
    if(self = [super initWithCoder:aCoder]){
        backgroundLayer = [CALayer layer];
        backgroundLayer.cornerRadius = 6;
        backgroundLayer.opacity = 1.0;
        backgroundLayer.zPosition = -1;
        backgroundLayer.shadowOpacity = 1.0;
        backgroundLayer.shadowRadius = 0.0;
        backgroundLayer.shadowOffset = CGSizeMake(0, 1.0);
        backgroundLayer.shadowColor = [[UIColor colortwo] darkerColor].CGColor;
        backgroundLayer.backgroundColor = [UIColor colortwo].CGColor;
        [self.layer addSublayer:backgroundLayer];
        
        
        
        [[self rac_signalForControlEvents:UIControlEventTouchUpInside]
         subscribeNext:^(UIControl *x) {
             FarsiKeyboardViewController *vc = (FarsiKeyboardViewController*)[[[[[self.superview nextResponder] nextResponder]nextResponder] nextResponder] nextResponder];
             vc.insertedString = self.insertStr;
         }];
        
        }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    FarsiThemeView *vc = (FarsiThemeView*)[[[self.superview nextResponder] nextResponder] nextResponder];
    [RACObserve(vc, colorSet) subscribeNext:^(id x) {
        backgroundLayer.backgroundColor = [UIColor colortwo].CGColor;
        [self setTitleColor:[UIColor colorfour] forState:UIControlStateNormal];
 
    }];

}

- (void)layoutSubviews{
    [super layoutSubviews];
    backgroundLayer.frame = CGRectMake(2.5, 5, self.frame.size.width-5, self.frame.size.height-10);
}


@end
