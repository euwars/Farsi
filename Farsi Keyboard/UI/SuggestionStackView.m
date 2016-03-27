//
//  SuggestionStackView.m
//  Farsi
//
//  Created by Farzad Nazifi on 3/27/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import "SuggestionStackView.h"
#import "FarsiThemeView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "SuggestionButton.h"
#import "UIColor+Core.h"

@implementation SuggestionStackView

- (void)awakeFromNib{
    [super awakeFromNib];    
    FarsiThemeView *vc = (FarsiThemeView*)[[self.superview nextResponder] nextResponder];
    [[RACObserve(vc, suggestionWords) skip:1] subscribeNext:^(id x) {
        
        SuggestionButton *button = (SuggestionButton*)self.arrangedSubviews[0];
        [button setTitle:[vc.suggestionWords[2] valueForKey:@"word"] forState:UIControlStateNormal];

        SuggestionButton *button1 = (SuggestionButton*)self.arrangedSubviews[1];
        [button1 setTitle:[vc.suggestionWords[0] valueForKey:@"word"] forState:UIControlStateNormal];
        
        SuggestionButton *button2 = (SuggestionButton*)self.arrangedSubviews[2];
        [button2 setTitle:[vc.suggestionWords[1] valueForKey:@"word"] forState:UIControlStateNormal];
        
    }];
}

@end
