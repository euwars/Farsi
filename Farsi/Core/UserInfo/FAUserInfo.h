//
//  FAUserInfo.h
//  Farsi
//
//  Created by Farzad Nazifi on 3/18/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import <GVUserDefaults/GVUserDefaults.h>

@interface FAUserInfo : GVUserDefaults

@property (nonatomic) BOOL keyboardIsActive;
@property (nonatomic) NSUInteger colorSet;

- (BOOL)save;
- (void)reset;
- (NSDictionary *)asDictionary;

#ifndef INFO
#define INFO [FAUserInfo standardUserDefaults]
#endif

@end
