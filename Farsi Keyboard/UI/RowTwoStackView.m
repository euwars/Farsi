//
//  RowTwoStackView.m
//  Farsi
//
//  Created by Farzad Nazifi on 3/23/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import "RowTwoStackView.h"
#import "FarsiThemeView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation RowTwoStackView

- (void)awakeFromNib{
    [super awakeFromNib];
    FarsiThemeView *vc = (FarsiThemeView*)[[[self.superview nextResponder]nextResponder] nextResponder];
    [[RACObserve(vc, currentView) skip:1] subscribeNext:^(id x) {
        [self switchToView:vc.currentView];
    }];
}

- (void)switchToView:(NSUInteger)viewNumber{
    NSArray *alphabetsR2 = [NSArray arrayWithObjects:@"ش", @"س", @"ی", @"ب", @"ل", @"ا", @"ت", @"ن", @"م", @"ک", @"گ", nil];
    NSArray *numbersR2 = [NSArray arrayWithObjects:@"-", @"/", @":", @"؛", @")", @"(", @"$", @"&", @"@", @"\"", @"", nil];
    NSArray *numbersR2InsertStr = [NSArray arrayWithObjects:@"-", @"/", @":", @"؛", @"(", @")", @"$", @"&", @"@", @"\"", @"", nil];
    NSArray *specialsR2 = [NSArray arrayWithObjects:@"-", @"\\", @"|", @"~", @"<", @">", @"€", @"£", @"¥", @"•", @"", nil];
    NSArray *specialsR2InsertStr = [NSArray arrayWithObjects:@"-", @"\\", @"|", @"~", @">", @"<", @"€", @"£", @"¥", @"•", @"", nil];

    switch (viewNumber) {
        case 0:{
            for (int i = 0; i < [self.arrangedSubviews count]; i++) {
                CharacterButton *button = (CharacterButton*)self.arrangedSubviews[i];
                [button setTitle:alphabetsR2[i] forState:UIControlStateNormal];
                button.insertStr = alphabetsR2[i];
                if (i == 10) {button.hidden = NO;}
            }
        }
            break;
        case 1:{
            for (int i = 0; i < [self.arrangedSubviews count]; i++) {
                CharacterButton *button = (CharacterButton*)self.arrangedSubviews[i];
                [button setTitle:numbersR2[i] forState:UIControlStateNormal];
                button.insertStr = numbersR2InsertStr[i];
                if (i == 10) {button.hidden = YES;}
            }
        }
            
            break;
        case 2:{
            for (int i = 0; i < [self.arrangedSubviews count]; i++) {
                CharacterButton *button = (CharacterButton*)self.arrangedSubviews[i];
                [button setTitle:specialsR2[i] forState:UIControlStateNormal];
                button.insertStr = specialsR2InsertStr[i];
                if (i == 10) {button.hidden = YES;}
            }
        }
            
            break;
        default:
            break;
    }
}

@end
