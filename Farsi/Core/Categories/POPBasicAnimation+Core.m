//
//  POPBasicAnimation+Core.m
//  Farsi
//
//  Created by Farzad Nazifi on 3/15/16.
//  Copyright © 2016 Notice. All rights reserved.
//

#import "POPBasicAnimation+Core.h"

@implementation POPBasicAnimation (Core)

+ (void)fadeViewToAlpha:(double)alpha WithDelay:(double)delay forDuration:(double)duration forView:(UIView*)view{
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.duration = duration;
    anim.toValue = @(alpha);
    anim.beginTime = CACurrentMediaTime() + delay;
    [view pop_addAnimation:anim forKey:@"fade"];
}

@end
