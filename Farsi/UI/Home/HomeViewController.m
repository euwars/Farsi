//
//  HomeViewController.m
//  Farsi
//
//  Created by Farzad Nazifi on 3/20/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import "HomeViewController.h"
#import "HomePageViewController.h"

@interface HomeViewController ()
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = [UIImage imageNamed:@"farsilogo"];
    self.navigationItem.titleView = imageView;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showHomeNavigation"]) {
        HomePageViewController *pageVC = (HomePageViewController*)segue.destinationViewController;
        
        NXTSegmentedControl *segmentedControl = [[NXTSegmentedControl alloc] initWithItems:@[@"تست", @"شخصی سازی"]];
        [segmentedControl setTitleTextAttributes:@{ NSFontAttributeName: [UIFont vazirWithWeight:FAFontWeightRegular size:14], NSForegroundColorAttributeName: [UIColor colorWithCSS:@"ffffff"]} forState:UIControlStateNormal];
        segmentedControl.tintColor = [UIColor clearColor];
        segmentedControl.thumbColor = [UIColor colorWithCSS:@"#383A3F"];
        segmentedControl.selectedSegmentIndex = 1;
        [self.topBar addSubview: segmentedControl];

        [segmentedControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@4);
            make.height.mas_equalTo(@40);
            make.width.mas_equalTo(self.view.frame.size.width*.9);
            make.centerX.equalTo(self.topBar.mas_centerX);
        }];
        
        [[segmentedControl rac_signalForControlEvents:UIControlEventValueChanged]
         subscribeNext:^(UIControl *x) {
             UIViewController *currentVC = segmentedControl.selectedSegmentIndex ? [self.storyboard instantiateViewControllerWithIdentifier:@"number1"] : [self.storyboard instantiateViewControllerWithIdentifier:@"number2"];
             [pageVC setViewControllers:@[currentVC] direction:segmentedControl.selectedSegmentIndex ? UIPageViewControllerNavigationDirectionForward : UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
         }];
        
        [[RACObserve(pageVC, currentPageIndex) skip:1] subscribeNext:^(id x) {
            [segmentedControl setSelectedSegmentIndex:pageVC.currentPageIndex];
        }];
    }
}

@end