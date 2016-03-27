//
//  FAWord.m
//  DataBaseMaker
//
//  Created by Farzad Nazifi on 3/26/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import "FAWord.h"

@implementation FAWord

// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

+ (NSString *)primaryKey {
    return @"word";
}

@end
