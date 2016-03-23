//
//  FarsiThemeView.m
//  Farsi
//
//  Created by Farzad Nazifi on 3/22/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import "FarsiThemeView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@implementation FarsiThemeView

- (void)changeViewTo:(NSUInteger)viewNumber{
    if (viewNumber == 0) {
        self.alphabetsView.hidden = NO;
        self.numbersView.hidden = YES;
        self.specialsView.hidden = YES;
    }
    
    if (viewNumber == 1) {
        self.alphabetsView.hidden = YES;
        self.numbersView.hidden = NO;
        self.specialsView.hidden = YES;
    }
    
    if (viewNumber == 2) {
        self.alphabetsView.hidden = YES;
        self.numbersView.hidden = YES;
        self.specialsView.hidden = NO;
    }
}

- (void)changeReturnTitleTo:(NSString*)title{
    [self.alphabetReturn.titleLabel setText:title];
    [self.numbersReturn.titleLabel setText:title];
    [self.specialReturn.titleLabel setText:title];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"Switch0" object:nil]
      takeUntil:[self rac_willDeallocSignal]]
     subscribeNext:^(id x) {
         [[NSNotificationCenter defaultCenter] postNotificationName:@"TypeCancel" object:nil];
         self.currentView = 0;
     }];
    
    [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"Switch1" object:nil]
      takeUntil:[self rac_willDeallocSignal]]
     subscribeNext:^(id x) {
         [[NSNotificationCenter defaultCenter] postNotificationName:@"TypeCancel" object:nil];
         self.currentView = 1;
     }];
    
    [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"Switch2" object:nil]
      takeUntil:[self rac_willDeallocSignal]]
     subscribeNext:^(id x) {
         [[NSNotificationCenter defaultCenter] postNotificationName:@"TypeCancel" object:nil];
         self.currentView = 2;
     }];
}

@end
