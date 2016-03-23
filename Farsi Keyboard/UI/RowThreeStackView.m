//
//  RowThreeStackView.m
//  Farsi
//
//  Created by Farzad Nazifi on 3/23/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import "RowThreeStackView.h"
#import "FarsiThemeView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "SwitchButton.h"

@implementation RowThreeStackView

- (void)awakeFromNib{
    [super awakeFromNib];
    FarsiThemeView *vc = (FarsiThemeView*)[[[self.superview nextResponder]nextResponder] nextResponder];
    [[RACObserve(vc, currentView) skip:1] subscribeNext:^(id x) {
        [self switchToView:vc.currentView];
    }];
}

- (void)switchToView:(NSUInteger)viewNumber{
    NSArray *alphabetsR3 = [NSArray arrayWithObjects:@"ظ", @"ط", @"ژ", @"ز", @"ر", @"ذ", @"د", @"و", @"پ", @"ث",@"", nil];
    NSArray *numbersR3 = [NSArray arrayWithObjects:@"#+=", @"«", @".", @"،", @"؟", @"!", @"#", @"%", @"»", @"", @"", nil];
    NSArray *numbersR3InsertStr = [NSArray arrayWithObjects:@"Switch2", @"»", @".", @"،", @"؟", @"!", @"#", @"%", @"«", @"", @"", nil];
    NSArray *specialsR3 = [NSArray arrayWithObjects:@"۱۲۳", @" ّ--", @" ّ--", @" ٌ--", @" ُ--", @" ٍ--", @" ً--", @" ِ--", @" َ--", @"", @"", nil];
    NSArray *specialsR3InsertStr = [NSArray arrayWithObjects:@"Switch1", @"س", @"ّ", @"ٌ", @"ُ", @"ٍ", @"ً", @"ِ", @"َ", @"", @"Delete", nil];

    switch (viewNumber) {
        case 0:{
            for (int i = 0; i < [self.arrangedSubviews count]; i++) {
                CharacterButton *button = (CharacterButton*)self.arrangedSubviews[i];
                    [button setTitle:alphabetsR3[i] forState:UIControlStateNormal];
                    button.insertStr = alphabetsR3[i];
                    if (i == 9) {button.hidden = NO;}
            }
        }
            break;
        case 1:{
            NSLog(@"%@",self.arrangedSubviews);
            for (int i = 0; i < [self.arrangedSubviews count]; i++) {
                
                CharacterButton *button = (CharacterButton*)self.arrangedSubviews[i];
                [button setTitle:numbersR3[i] forState:UIControlStateNormal];
                button.insertStr = numbersR3InsertStr[i];
                if (i == 9) {button.hidden = YES;}
            }
        }
            
            break;
        case 2:{
            for (int i = 0; i < [self.arrangedSubviews count]; i++) {
                CharacterButton *button = (CharacterButton*)self.arrangedSubviews[i];
                [button setTitle:specialsR3[i] forState:UIControlStateNormal];
                button.insertStr = specialsR3InsertStr[i];
                if (i == 9) {button.hidden = YES;}
            }
        }
            
            break;
        default:
            break;
    }
}


@end
