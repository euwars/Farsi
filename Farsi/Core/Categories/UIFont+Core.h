//
//  UIFont+Core.h
//  Farsi
//
//  Created by Farzad Nazifi on 3/14/16.
//  Copyright © 2016 Notice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Core)

typedef NS_ENUM(NSInteger, FAFontWeight) {
    FAFontWeightRegular = 0,
    FAFontWeightBold = 1,
    FAFontWeightBlack = 2,
    FAFontWeightLight = 3,
    FAFontWeightUltraLight = 4,
};

+ (UIFont *)vazirWithWeight:(FAFontWeight)weight size:(CGFloat)size;


@end
