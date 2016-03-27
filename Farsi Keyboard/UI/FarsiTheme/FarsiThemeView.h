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
@property NSUInteger colorSet;
@property NSUInteger currentView;
@property (nonatomic, strong) NSArray *suggestionWords;
@property (strong, nonatomic) IBOutlet CharacterButton *alphabetReturn;

- (void)changeReturnTitleTo:(NSString*)title;

@end
