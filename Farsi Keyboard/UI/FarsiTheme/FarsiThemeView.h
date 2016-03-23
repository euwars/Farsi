//
//  FarsiThemeView.h
//  Farsi
//
//  Created by Farzad Nazifi on 3/22/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CharacterButton.h"

@interface FarsiThemeView : UIView
@property (nonatomic, weak) IBOutlet UIView *view;

@property NSUInteger currentView;

@property (strong, nonatomic) IBOutlet UIView *alphabetsView;
@property (strong, nonatomic) IBOutlet UIView *numbersView;
@property (strong, nonatomic) IBOutlet UIView *specialsView;
@property (strong, nonatomic) IBOutlet CharacterButton *alphabetReturn;
@property (strong, nonatomic) IBOutlet CharacterButton *numbersReturn;
@property (strong, nonatomic) IBOutlet CharacterButton *specialReturn;

- (void)changeViewTo:(NSUInteger)viewNumber;
- (void)changeReturnTitleTo:(NSString*)title;

@end
