//
//  HomePageViewController.m
//  Farsi
//
//  Created by Farzad Nazifi on 3/20/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import "HomePageViewController.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataSource = self;
    self.delegate = self;
    
    UIViewController *startingViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"number1"];
    NSArray *viewControllers = @[startingViewController];
    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    for (UIScrollView *scrollview in self.view.subviews){
        scrollview.delegate = self;
    }
    self.currentPageIndex = 1;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    if ([viewController.title isEqualToString:@"number2"]) {
        return [self.storyboard instantiateViewControllerWithIdentifier:@"number1"];
    }

    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    if ([viewController.title isEqualToString:@"number1"]) {
        return [self.storyboard instantiateViewControllerWithIdentifier:@"number2"];
    }
    
    return nil;
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{
    if (completed) {
        if ([previousViewControllers[0].title isEqualToString:@"number1"]) {
            self.currentPageIndex = 0;
        }else{
            self.currentPageIndex = 1;
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.currentPageIndex == 1 && scrollView.contentOffset.x/scrollView.frame.size.width < 1) {
        self.scrollRatio = (scrollView.contentOffset.x/scrollView.frame.size.width);
    }
    if (self.currentPageIndex == 0 && scrollView.contentOffset.x/scrollView.frame.size.width > 1) {
        self.scrollRatio = (scrollView.contentOffset.x/scrollView.frame.size.width) - 1;
    }
}

@end
