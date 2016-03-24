//
//  FarsiKeyboardViewController.h
//  Farsi
//
//  Created by Farzad Nazifi on 3/19/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FAUserInfo.h"
#import "MMWormhole.h"

@interface FarsiKeyboardViewController : UIInputViewController

@property NSString *insertedString;

@property NSString *popoverStr;
@property CGRect popoverRect;
@property (nonatomic, strong) MMWormhole *wormhole;

@end
