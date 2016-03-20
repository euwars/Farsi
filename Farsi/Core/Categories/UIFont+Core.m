//
//  UIFont+Core.m
//  Farsi
//
//  Created by Farzad Nazifi on 3/14/16.
//  Copyright © 2016 Notice. All rights reserved.
//

#import "UIFont+Core.h"

@implementation UIFont (Core)

NSString*  FontForWeight(FAFontWeight fontWeight) {
    NSDictionary *fontsDictionary = @{
                                      @(FAFontWeightRegular): @"Vazir",
                                      @(FAFontWeightBold): @"Vazir-Bold"
                                      };
    return fontsDictionary[@(fontWeight)];
}

+ (UIFont *)vazirWithWeight:(FAFontWeight)weight size:(CGFloat)size{
    UIFont *font = [UIFont fontWithName:FontForWeight(weight) size:size];
    
    return font;
}

@end
