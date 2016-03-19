//
//  TutorialViewController.m
//  Farsi
//
//  Created by Farzad Nazifi on 3/19/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import "TutorialViewController.h"
#import "FACore.h"

@interface TutorialViewController (){
    AVPlayerLayer *layer;
    IBOutlet UIView *videoOverlay;
}

@end

@implementation TutorialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"tutorial" ofType:@"mp4"];
    NSURL *url=[[NSURL alloc] initFileURLWithPath:path];
    AVPlayer *av = [[AVPlayer alloc] initWithURL:url];
    av.muted = YES;
    av.actionAtItemEnd = AVPlayerActionAtItemEndNone;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerItemDidReachEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:[av currentItem]];
    layer = [AVPlayerLayer playerLayerWithPlayer:av];
    layer.videoGravity = AVLayerVideoGravityResizeAspect;
    layer.zPosition = -1;
    [videoOverlay.layer addSublayer:layer];
    [av play];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    layer.frame = videoOverlay.frame;
}

- (IBAction)settingsAction:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"prefs:root=General&path=Keyboard/KEYBOARDS"]];
}

- (void)playerItemDidReachEnd:(NSNotification *)notification {
    AVPlayerItem *p = [notification object];
    [p seekToTime:kCMTimeZero];
}

@end
