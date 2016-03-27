//
//  ThemesCollectionViewCell.h
//  Farsi
//
//  Created by Farzad Nazifi on 3/25/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemesCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSArray *colorSet;
@property (strong, nonatomic) IBOutlet UIVisualEffectView *blurView;

@end
