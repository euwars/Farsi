//
//  FAUserInfo.m
//  Farsi
//
//  Created by Farzad Nazifi on 3/18/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import "FAUserInfo.h"

@implementation FAUserInfo

@dynamic keyboardIsActive;

- (BOOL)save {
    return [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)reset {
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:@"com.Farsi"];
}

- (NSDictionary *)asDictionary {
    return [[NSUserDefaults standardUserDefaults] dictionaryRepresentation];
}

@end
