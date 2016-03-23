//
//  CharacterButton.h
//  Farsi
//
//  Created by Farzad Nazifi on 3/22/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CharacterButton : UIButton

@property (strong, nonatomic) IBInspectable NSString *insertStr;
@property (assign) IBInspectable BOOL isAction;
@end
