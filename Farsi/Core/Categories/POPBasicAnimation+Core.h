//
//  POPBasicAnimation+Core.h
//  PersianTyper
//
//  Created by Farzad Nazifi on 3/15/16.
//  Copyright © 2016 Notice. All rights reserved.
//

#import <pop/pop.h>
#import <UIKit/UIKit.h>

@interface POPBasicAnimation (Core)

+ (void)fadeViewToAlpha:(double)alpha WithDelay:(double)delay forDuration:(double)duration forView:(UIView*)view;

@end
