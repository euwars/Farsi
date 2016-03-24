//
//  UIColor+Core.m
//  Farsi
//
//  Created by Farzad Nazifi on 3/14/16.
//  Copyright © 2016 Notice. All rights reserved.
//

#import "UIColor+Core.h"
#import "UIColor+Hex.h"
#import "FAUserInfo.h"

@implementation UIColor (Core)

- (UIColor *)lighterColor{
    CGFloat h, s, b, a;
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a])
        return [UIColor colorWithHue:h
                          saturation:s
                          brightness:MIN(b * 1.3, 1.0)
                               alpha:a];
    return nil;
}

- (UIColor *)darkerColor{
    CGFloat h, s, b, a;
    if ([self getHue:&h saturation:&s brightness:&b alpha:&a])
        return [UIColor colorWithHue:h
                          saturation:s
                          brightness:b * 0.5
                               alpha:a];
    return nil;
}


+ (UIColor *)colorone{
    return [UIColor colorWithCSS:[self allColors][INFO.colorSet][0]];
}

+ (UIColor *)colortwo{
    return [UIColor colorWithCSS:[self allColors][INFO.colorSet][1]];
}

+ (UIColor *)colorthree{
    return [UIColor colorWithCSS:[self allColors][INFO.colorSet][2]];
}

+ (UIColor *)colorfour{
    return [UIColor colorWithCSS:[self allColors][INFO.colorSet][3]];
}

+ (NSArray *)allColors{return [NSArray arrayWithObjects:[self color0], [self color1], [self color2], [self color3], [self color4], [self color5], [self color6], [self color7], [self color8], [self color9], [self color10], [self color11], [self color12], [self color13], [self color14], [self color15], [self color16], [self color17], [self color18], [self color19], nil];
}

+ (NSArray *)color0{return [NSArray arrayWithObjects:@"d2d5dc", @"ffffff", @"adb4be", @"000000", nil];}
+ (NSArray *)color1{return [NSArray arrayWithObjects:@"424242", @"7b7b7b", @"585858", @"ffffff", nil];}
+ (NSArray *)color2{return [NSArray arrayWithObjects:@"311e3e", @"512645", @"87314e", @"df405a", nil];}
+ (NSArray *)color3{return [NSArray arrayWithObjects:@"1e2022", @"52616a", @"c9d6de", @"f0f5f9", nil];}
+ (NSArray *)color4{return [NSArray arrayWithObjects:@"343838", @"005f6b", @"008c9e", @"00dffc", nil];}
+ (NSArray *)color5{return [NSArray arrayWithObjects:@"34314c", @"47b8e0", @"ffc952", @"ff7473", nil];}
+ (NSArray *)color6{return [NSArray arrayWithObjects:@"2b90d9", @"d9e1e8", @"9baec8", @"282c37", nil];}
+ (NSArray *)color7{return [NSArray arrayWithObjects:@"1F2124", @"383A3F", @"F68657", @"F6B352", nil];}
+ (NSArray *)color8{return [NSArray arrayWithObjects:@"252c41", @"f4f5f9", @"dddfe6", @"f1404b", nil];}
+ (NSArray *)color9{return [NSArray arrayWithObjects:@"274555", @"f9a11b", @"fdc23e", @"ff7761", nil];}
+ (NSArray *)color10{return [NSArray arrayWithObjects:@"3C3530", @"AACD6E", @"C5C6B6", @"F16B6F", nil];}
+ (NSArray *)color11{return [NSArray arrayWithObjects:@"1e2022", @"52616a", @"c9d6de", @"f0f5f9", nil];}
+ (NSArray *)color12{return [NSArray arrayWithObjects:@"272625", @"3f4040", @"5e5e5f", @"fff1b9", nil];}
+ (NSArray *)color13{return [NSArray arrayWithObjects:@"", @"", @"", @"", nil];}
+ (NSArray *)color14{return [NSArray arrayWithObjects:@"", @"", @"", @"", nil];}
+ (NSArray *)color15{return [NSArray arrayWithObjects:@"", @"", @"", @"", nil];}
+ (NSArray *)color16{return [NSArray arrayWithObjects:@"", @"", @"", @"", nil];}
+ (NSArray *)color17{return [NSArray arrayWithObjects:@"", @"", @"", @"", nil];}
+ (NSArray *)color18{return [NSArray arrayWithObjects:@"", @"", @"", @"", nil];}
+ (NSArray *)color19{return [NSArray arrayWithObjects:@"", @"", @"", @"", nil];}

@end
