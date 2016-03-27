//
//  HomeViewController.m
//  Farsi
//
//  Created by Farzad Nazifi on 3/20/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import "HomeViewController.h"
#import "HomePageViewController.h"

@interface HomeViewController (){
    BOOL tracker;
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.tintColor = [UIColor colorWithCSS:@"212339"];
    imageView.image = [UIImage imageNamed:@"farsilogo"];
    self.navigationItem.titleView = imageView;
    tracker = YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showHomeNavigation"]) {
//        HomePageViewController *pageVC = (HomePageViewController*)segue.destinationViewController;

        

//        
//        [[RACObserve(pageVC, currentPageIndex) skip:1] subscribeNext:^(id x) {
//            [segmentedControl setSelectedSegmentIndex:pageVC.currentPageIndex];
//        }];
//        
//        [[RACObserve(pageVC, scrollRatio) skip:1] subscribeNext:^(id x) {
//            if (tracker) {
//                [segmentedControl _moveThumbToNewFrame:CGRectMake((self.view.frame.size.width/2)*pageVC.scrollRatio, 34, (segmentedControl.frame.size.width/2)-3, 2)];
//            }
//        }];
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

@end
