//
//  FAWord.h
//  DataBaseMaker
//
//  Created by Farzad Nazifi on 3/26/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import <Realm/Realm.h>

@interface FAWord : RLMObject
@property NSString *word;
@property NSInteger freq;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<FAWord>
RLM_ARRAY_TYPE(FAWord)
