//
//  FarsiKeyboardViewController.m
//  Farsi
//
//  Created by Farzad Nazifi on 3/19/16.
//  Copyright © 2016 Farzad Nazifi. All rights reserved.
//

#import "FarsiKeyboardViewController.h"
#import "Masonry.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "FarsiThemeView.h"

@interface FarsiKeyboardViewController (){
    NSTimer *myTimerName;
}

@property (nonatomic, strong) UIButton *nextKeyboardButton;

@end

@implementation FarsiKeyboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    FarsiThemeView *firstViewUIView = [[[NSBundle mainBundle] loadNibNamed:@"FarsiTheme" owner:self options:nil] firstObject];
    [self.view addSubview:firstViewUIView];
    
    [firstViewUIView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [[RACObserve(self, insertedString) skip:1]subscribeNext:^(id x) {
        [self.textDocumentProxy insertText:self.insertedString];
    }];
    
    [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"Delete" object:nil]
      takeUntil:[self rac_willDeallocSignal]]
     subscribeNext:^(id x) {
         [self.textDocumentProxy deleteBackward];
     }];
    
    [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"NextKeyboard" object:nil]
      takeUntil:[self rac_willDeallocSignal]]
     subscribeNext:^(id x) {
         [self advanceToNextInputMode];
     }];
}

- (void)textWillChange:(id<UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
}

- (void)textDidChange:(id<UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.
}

@end
