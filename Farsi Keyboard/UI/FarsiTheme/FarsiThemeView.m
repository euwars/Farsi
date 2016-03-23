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

- (void)changeReturnTitleTo:(NSString*)title{
    [self.alphabetReturn setTitle:title forState:UIControlStateNormal];
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
