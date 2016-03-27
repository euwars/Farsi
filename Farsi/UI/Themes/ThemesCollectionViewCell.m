//
//  ThemesCollectionViewCell.m
//  Farsi
//
//  Created by Farzad Nazifi on 3/25/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import "ThemesCollectionViewCell.h"
#import "FACore.h"

@implementation ThemesCollectionViewCell{
    IBOutlet UIView *view1;
    IBOutlet UIView *view2;
    IBOutlet UIView *view3;
    IBOutlet UIView *view4;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if((self = [super initWithCoder:aDecoder])) {
        [RACObserve(self, colorSet) subscribeNext:^(id x) {
            view1.backgroundColor = [UIColor colorWithCSS:_colorSet[0]];
            view2.backgroundColor = [UIColor colorWithCSS:_colorSet[1]];
            view3.backgroundColor = [UIColor colorWithCSS:_colorSet[2]];
            view4.backgroundColor = [UIColor colorWithCSS:_colorSet[3]];
        }];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self.imageView setTransform:CGAffineTransformMakeScale(-1, 1)];

}

@end
