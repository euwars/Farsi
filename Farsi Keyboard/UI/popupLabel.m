//
//  popupLabel.m
//  Farsi
//
//  Created by Farzad Nazifi on 3/22/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import "popupLabel.h"

@implementation popupLabel

- (void)drawTextInRect:(CGRect)rect {
    UIEdgeInsets insets = {0, 0, 6, 0};
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}

@end
