//
//  UIFont+Core.m
//  PersianTyper
//
//  Created by Farzad Nazifi on 3/14/16.
//  Copyright © 2016 Notice. All rights reserved.
//

#import "UIFont+Core.h"

@implementation UIFont (Core)

NSString*  FontForWeight(PTFontWeight fontWeight) {
    NSDictionary *fontsDictionary = @{
                                      @(PTFontWeightRegular): @"Vazir",
                                      @(PTFontWeightBold): @"Vazir-Bold"
                                      };
    return fontsDictionary[@(fontWeight)];
}

+ (UIFont *)vazirWithWeight:(PTFontWeight)weight size:(CGFloat)size{
    UIFont *font = [UIFont fontWithName:FontForWeight(weight) size:size];
    
    return font;
}

@end
