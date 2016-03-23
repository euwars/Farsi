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
    FarsiThemeView *themeView;
    UILabel *popupLabel;
}
@end

@implementation FarsiKeyboardViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:themeView];
    
    [themeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.view addSubview:popupLabel];
    
    [RACObserve(self, popoverRect) subscribeNext:^(id x) {
        popupLabel.hidden = NO;
        popupLabel.text = self.popoverStr;
        popupLabel.frame = self.popoverRect;
    }];
    
    [[RACObserve(self, insertedString) skip:1]subscribeNext:^(id x) {
        if ([self.insertedString isEqualToString:@" "] && !(themeView == 0)) {
            themeView.currentView = 0;
        }
        [self.textDocumentProxy insertText:self.insertedString];
        popupLabel.hidden = YES;
    }];
    
    [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"Delete" object:nil]
      takeUntil:[self rac_willDeallocSignal]]
     subscribeNext:^(id x) {
         [self.textDocumentProxy deleteBackward];
         popupLabel.hidden = YES;
     }];
    
    [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"TypeCancel" object:nil]
      takeUntil:[self rac_willDeallocSignal]]
     subscribeNext:^(id x) {
         popupLabel.hidden = YES;
     }];
    
    [[[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"NextKeyboard" object:nil]
      takeUntil:[self rac_willDeallocSignal]]
     subscribeNext:^(id x) {
         [self advanceToNextInputMode];
     }];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        //custom initialization
        UINib *nib = [UINib nibWithNibName:@"FarsiTheme" bundle:nil];
        NSArray *array = [nib instantiateWithOwner:self options:nil];
        themeView = array[0];
        popupLabel = array[1];
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [RACObserve(self.textDocumentProxy, returnKeyType) subscribeNext:^(id x) {
        
        switch (self.textDocumentProxy.keyboardType) {
            case UIReturnKeyGo:
                [themeView changeReturnTitleTo:@"برو"];
                break;
            case UIReturnKeyGoogle:
                [themeView changeReturnTitleTo:@"گوگل"];
                break;
            case UIReturnKeyJoin:
                [themeView changeReturnTitleTo:@"ورود"];
                break;
            case UIReturnKeyNext:
                [themeView changeReturnTitleTo:@"بعدی"];
                break;
            case UIReturnKeyRoute:
                [themeView changeReturnTitleTo:@"مسیر"];
                break;
            case UIReturnKeySearch:
                [themeView changeReturnTitleTo:@"جستجو"];
                break;
            case UIReturnKeySend:
                [themeView changeReturnTitleTo:@"ارسال"];
                break;
            case UIReturnKeyYahoo:
                [themeView changeReturnTitleTo:@"یاهو!"];
                break;
            case UIReturnKeyDone:
                [themeView changeReturnTitleTo:@"تمام"];
                break;
            case UIReturnKeyEmergencyCall:
                [themeView changeReturnTitleTo:@"اضطراری"];
                break;
            default:
                [themeView changeReturnTitleTo:@"بازگشت"];
                break;
        }
    }];
}

- (void)textWillChange:(id<UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
}

- (void)textDidChange:(id<UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.
}

@end
