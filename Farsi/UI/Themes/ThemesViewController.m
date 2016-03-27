//
//  ThemesViewController.m
//  Farsi
//
//  Created by Farzad Nazifi on 3/25/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import "ThemesViewController.h"
#import "FACore.h"
#import "ThemesCollectionViewCell.h"
#import "MMWormhole.h"
#import "SwipeView.h"

@interface ThemesViewController () <SwipeViewDelegate>

@property (strong, nonatomic) IBOutlet SwipeView *swipeView;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, strong) MMWormhole *wormhole;
@property (strong, nonatomic) IBOutlet UIView *v1;
@property (strong, nonatomic) IBOutlet UIView *v2;
@property (strong, nonatomic) IBOutlet UIView *v3;
@property (strong, nonatomic) IBOutlet UIView *v4;

@end

@implementation ThemesViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.swipeView setTransform:CGAffineTransformMakeScale(-1, 1)];
    self.wormhole = [[MMWormhole alloc] initWithApplicationGroupIdentifier:@"group.com.farsi"
                                                         optionalDirectory:@"Farsi"];
    //configure swipe view
    _swipeView.alignment = SwipeViewAlignmentCenter;
    _swipeView.pagingEnabled = YES;
    _swipeView.itemsPerPage = 1;
    _swipeView.truncateFinalPage = YES;
    
    [_swipeView scrollToPage:INFO.colorSet duration:1];
}

- (NSInteger)numberOfItemsInSwipeView:(SwipeView *)swipeView{
    return 13;
}

- (UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    UIImageView *imageView = nil;
    
    //create new view if no view is available for recycling
    if (view == nil)
    {
        //don't do anything specific to the index within
        //this `if (view == nil) {...}` statement because the view will be
        //recycled and used with other index values later
        view = [[UIView alloc] initWithFrame:CGRectMake(30, 0, swipeView.frame.size.width - 60, swipeView.frame.size.height)];
        [view setTransform:CGAffineTransformMakeScale(-1, 1)];
        view.layer.cornerRadius = 10;

        
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(view.frame.size.width*.05, 0, view.frame.size.width*.9, view.frame.size.height)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.backgroundColor = [UIColor clearColor];
        imageView.tag = 1;
        imageView.layer.shadowColor = [UIColor blackColor].CGColor;
        imageView.layer.shadowOpacity = .5;
        imageView.layer.shadowOffset = CGSizeMake(0, 1.0);

        [view addSubview:imageView];
    }
    else
    {
        //get a reference to the label in the recycled view
        imageView = (UIImageView *)[view viewWithTag:1];
    }

    imageView.image = [self makeRoundedImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ld",(long)index]] radius:10];
    //set item label
    //remember to always set any properties of your carousel item
    //views outside of the `if (view == nil) {...}` check otherwise
    //you'll get weird issues with carousel item content appearing
    //in the wrong place in the carousel
    
    return view;
}

-(UIImage *)makeRoundedImage:(UIImage *) image radius: (float) radius;{
    CALayer *imageLayer = [CALayer layer];
    imageLayer.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    imageLayer.contents = (id) image.CGImage;
    
    imageLayer.masksToBounds = YES;
    imageLayer.cornerRadius = radius;
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    [imageLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *roundedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return roundedImage;
}

- (void)go{
    [self.wormhole passMessageObject:nil identifier:@"ColorChanged"];
}

- (void)swipeViewCurrentItemIndexDidChange:(SwipeView *)swipeView{
    INFO.colorSet = swipeView.currentPage;
    [INFO save];
    [self performSelector:@selector(go) withObject:nil afterDelay:.1];
    
    _v1.backgroundColor = [UIColor colorWithCSS:[UIColor allColors][swipeView.currentPage][0]];
    _v2.backgroundColor = [UIColor colorWithCSS:[UIColor allColors][swipeView.currentPage][1]];
    _v3.backgroundColor = [UIColor colorWithCSS:[UIColor allColors][swipeView.currentPage][2]];
    _v4.backgroundColor = [UIColor colorWithCSS:[UIColor allColors][swipeView.currentPage][3]];
}
@end
