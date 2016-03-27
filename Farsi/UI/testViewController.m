//
//  testViewController.m
//  Farsi
//
//  Created by Farzad Nazifi on 3/24/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import "testViewController.h"
#import "FAUserInfo.h"
#import "FACore.h"
#import "MMWormhole.h"

@interface testViewController ()
@property (strong, nonatomic) IBOutlet UITextField *tv;
@property (nonatomic, strong) MMWormhole *wormhole;

@end

@implementation testViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.tv resignFirstResponder];

}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    [self.tv becomeFirstResponder];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)textchange:(id)sender {
    INFO.colorSet = [[(UITextField*)sender text] length];
    [INFO save];
    // funny story: need delay for this. because INFO is being saved to disk and its slower that notification manager
    [self performSelector:@selector(go) withObject:nil afterDelay:.1];
}
- (void)go{
    [self.wormhole passMessageObject:nil identifier:@"ColorChanged"];

}
@end
