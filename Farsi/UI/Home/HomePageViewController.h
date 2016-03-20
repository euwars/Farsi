//
//  HomePageViewController.h
//  Farsi
//
//  Created by Farzad Nazifi on 3/20/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomePageViewController : UIPageViewController <UIPageViewControllerDelegate, UIPageViewControllerDataSource, UIScrollViewDelegate>
@property NSUInteger currentPageIndex;
@property CGFloat scrollRatio;

@end
