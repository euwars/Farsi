//
//  RowFourStackView.m
//  Farsi
//
//  Created by Farzad Nazifi on 3/24/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import "RowFourStackView.h"
#import "FarsiThemeView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation RowFourStackView

- (void)awakeFromNib{
    [super awakeFromNib];
    FarsiThemeView *vc = (FarsiThemeView*)[[self.superview nextResponder] nextResponder];
    [[RACObserve(vc, currentView) skip:1] subscribeNext:^(id x) {
        [self switchToView:vc.currentView];
    }];
}

- (void)switchToView:(NSUInteger)viewNumber{

    switch (viewNumber) {
        case 0:{
            CharacterButton *button = (CharacterButton*)self.arrangedSubviews[0];
            [button setTitle:@"۱۲۳" forState:UIControlStateNormal];
            button.insertStr = @"Switch1";
        }
            break;
        case 1:{
            CharacterButton *button = (CharacterButton*)self.arrangedSubviews[0];
            [button setTitle:@"الف" forState:UIControlStateNormal];
            button.insertStr = @"Switch0";
        }
            
            break;
        case 2:{
            CharacterButton *button = (CharacterButton*)self.arrangedSubviews[0];
            [button setTitle:@"الف" forState:UIControlStateNormal];
            button.insertStr = @"Switch0";
        }
            
            break;
        default:
            break;
    }
}


@end
