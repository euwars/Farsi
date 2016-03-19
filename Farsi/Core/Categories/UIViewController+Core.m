//
//  UIViewController+Core.m
//  PersianTyper
//
//  Created by Farzad Nazifi on 3/14/16.
//  Copyright © 2016 Notice. All rights reserved.
//

#import "UIViewController+Core.h"
#import "PTCore.h"
#import <UIKit/UIKit.h>

@implementation UIViewController (Core)

+ (void)showSafariViewControllerForURLstr:(NSString *)urlstr from:(UIViewController*)vc{
    SFSafariViewController *sf = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:urlstr]];
    [vc showViewController:sf sender:vc];
}

@end

