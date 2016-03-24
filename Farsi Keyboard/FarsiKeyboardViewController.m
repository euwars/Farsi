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
#import "FAUserInfo.h"

@interface FarsiKeyboardViewController (){
    FarsiThemeView *themeView;
    UILabel *popupLabel;
}
@end

@implementation FarsiKeyboardViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.view addSubview:popupLabel];
//    
//    [RACObserve(self, popoverRect) subscribeNext:^(id x) {
//        popupLabel.hidden = NO;
//        popupLabel.text = self.popoverStr;
//        popupLabel.frame = self.popoverRect;
//    }];
    
    [[RACObserve(self, insertedString) skip:1]subscribeNext:^(id x) {
        if (self.insertedString.length < 3) {
            [self.textDocumentProxy insertText:self.insertedString];
        }else{
            [self actionForString:self.insertedString];
        }
        popupLabel.hidden = YES;
    }];
    
    self.wormhole = [[MMWormhole alloc] initWithApplicationGroupIdentifier:@"group.com.farsi" optionalDirectory:@"Farsi"];
    [self.wormhole listenForMessageWithIdentifier:@"ColorChanged" listener:^(id messageObject) {
        themeView.colorSet = INFO.colorSet;
        NSLog(@"biya dg");
    }];
}

- (void)actionForString:(NSString*)string{
    if ([string isEqualToString:@"Delete"]) {
        [self.textDocumentProxy deleteBackward];
    }
    if ([string isEqualToString:@"TypeCancel"]) {
        
    }
    if ([string isEqualToString:@"NextKeyboard"]) {
        [self advanceToNextInputMode];
    }
    if ([string isEqualToString:@"Switch0"]) {
        themeView.currentView = 0;
    }
    if ([string isEqualToString:@"Switch1"]) {
        themeView.currentView = 1;
    }
    if ([string isEqualToString:@"Switch2"]) {
        themeView.currentView = 2;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        //custom initialization
        UINib *nib = [UINib nibWithNibName:@"FarsiTheme" bundle:nil];
        NSArray *array = [nib instantiateWithOwner:self options:nil];
        themeView = array[0];
        popupLabel = array[1];
        [self.view addSubview:themeView];
        
        [themeView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        
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
