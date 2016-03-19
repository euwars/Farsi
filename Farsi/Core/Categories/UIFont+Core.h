//
//  UIFont+Core.h
//  PersianTyper
//
//  Created by Farzad Nazifi on 3/14/16.
//  Copyright © 2016 Notice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Core)

typedef NS_ENUM(NSInteger, PTFontWeight) {
    PTFontWeightRegular = 0,
    PTFontWeightBold = 1,
    PTFontWeightBlack = 2,
    PTFontWeightLight = 3,
    PTFontWeightUltraLight = 4,
};

+ (UIFont *)vazirWithWeight:(PTFontWeight)weight size:(CGFloat)size;


@end
