//
//  RowOneStackView.m
//  Farsi
//
//  Created by Farzad Nazifi on 3/23/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import "RowOneStackView.h"
#import "FarsiKeyboardViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "CharacterButton.h"
#import "FarsiThemeView.h"

@implementation RowOneStackView

- (void)awakeFromNib{
    [super awakeFromNib];
    FarsiThemeView *vc = (FarsiThemeView*)[[self.superview nextResponder] nextResponder];
    [[RACObserve(vc, currentView) skip:1] subscribeNext:^(id x) {
        [self switchToView:vc.currentView];
    }];
}


- (void)switchToView:(NSUInteger)viewNumber{
    NSArray *alphabetsR1 = [NSArray arrayWithObjects:@"ض", @"ص", @"ق", @"ف", @"غ", @"ع", @"ه", @"خ", @"ح", @"ج", @"چ", nil];
    NSArray *numbersR1 = [NSArray arrayWithObjects:@"۱", @"۲", @"۳", @"۴", @"۵", @"۶", @"۷", @"۸", @"۹", @"۰", @"", nil];
    NSArray *specialsR1 = [NSArray arrayWithObjects:@"[", @"]", @"{", @"}", @"#", @"%", @"^", @"*", @"+", @"=", @"", nil];
    NSArray *specialsR1InsertStr = [NSArray arrayWithObjects:@"]", @"[", @"}", @"{", @"#", @"%", @"^", @"*", @"+", @"=", @"Delete", nil];

    switch (viewNumber) {
        case 0:{
            for (int i = 0; i < [self.arrangedSubviews count]; i++) {
                CharacterButton *button = (CharacterButton*)self.arrangedSubviews[i];
                [button setTitle:alphabetsR1[i] forState:UIControlStateNormal];
                button.insertStr = alphabetsR1[i];
                if (i == 10) {button.hidden = NO;}
            }
        }
            break;
        case 1:{
            for (int i = 0; i < [self.arrangedSubviews count]; i++) {
                CharacterButton *button = (CharacterButton*)self.arrangedSubviews[i];
                [button setTitle:numbersR1[i] forState:UIControlStateNormal];
                button.insertStr = numbersR1[i];
                if (i == 10) {button.hidden = YES;}
            }
        }
    
            break;
        case 2:{
            for (int i = 0; i < [self.arrangedSubviews count]; i++) {
                CharacterButton *button = (CharacterButton*)self.arrangedSubviews[i];
                [button setTitle:specialsR1[i] forState:UIControlStateNormal];
                button.insertStr = specialsR1InsertStr[i];
                if (i == 10) {button.hidden = YES;}
            }
        }
            
            break;
        default:
            break;
    }
}

@end
