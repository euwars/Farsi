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
#import <Realm/Realm.h>
#import "FAWord.h"

@interface FarsiKeyboardViewController (){
    FarsiThemeView *themeView;
    UILabel *popupLabel;
    RLMRealm *realm;
    NSString *lastkeyword;
}
@end

@implementation FarsiKeyboardViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:themeView];
    
    [themeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.inputView);
    }];
    
    [self.view addSubview:popupLabel];

    
    [RACObserve(self, popoverRect) subscribeNext:^(id x) {
        popupLabel.hidden = NO;
        popupLabel.text = self.popoverStr;
        popupLabel.frame = self.popoverRect;
    }];
    
    [[RACObserve(self, insertedString) skip:1]subscribeNext:^(id x) {
        if (self.insertedString.length < 3) {
            [self.textDocumentProxy insertText:self.insertedString];
            [self updateSuggestionData];
        }else{
            [self actionForString:self.insertedString];
        }
        popupLabel.hidden = YES;
    }];
    
    self.wormhole = [[MMWormhole alloc] initWithApplicationGroupIdentifier:@"group.com.farsi" optionalDirectory:@"Farsi"];
    [self.wormhole listenForMessageWithIdentifier:@"ColorChanged" listener:^(id messageObject) {
        themeView.colorSet = INFO.colorSet;
    }];
}

- (void)actionForString:(NSString*)string{
    if ([string isEqualToString:@"Delete"]) {
        [self.textDocumentProxy deleteBackward];
        [self updateSuggestionData];
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
    if ([string isEqualToString:@"Suggestion0"]) {
        for (int i = 0; i < [lastkeyword length]; i++) {
            [self.textDocumentProxy deleteBackward];
        }
        [self.textDocumentProxy insertText:[NSString stringWithFormat:@"%@ ",[themeView.suggestionWords[0] valueForKey:@"word"]]];
    }
    if ([string isEqualToString:@"Suggestion1"]) {
        for (int i = 0; i < [lastkeyword length]; i++) {
            [self.textDocumentProxy deleteBackward];
        }
        [self.textDocumentProxy insertText:[NSString stringWithFormat:@"%@ ",[themeView.suggestionWords[1] valueForKey:@"word"]]];    }
    if ([string isEqualToString:@"Suggestion2"]) {
        for (int i = 0; i < [lastkeyword length]; i++) {
            [self.textDocumentProxy deleteBackward];
        }
        [self.textDocumentProxy insertText:[NSString stringWithFormat:@"%@ ",[themeView.suggestionWords[2] valueForKey:@"word"]]];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        //custom initialization
        UINib *nib = [UINib nibWithNibName:@"FarsiTheme" bundle:nil];
        NSArray *array = [nib instantiateWithOwner:self options:nil];
        themeView = array[0];
        popupLabel = array[1];
        
        RLMRealmConfiguration *config = [RLMRealmConfiguration defaultConfiguration];
        config.path = [[NSBundle mainBundle] pathForResource:@"words" ofType:@"realm"];
        config.readOnly = YES;
        realm = [RLMRealm realmWithConfiguration:config error:nil];
    }
    return self;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self updateSuggestionData];

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

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context){
         [self updateH];
     } completion:^(id<UIViewControllerTransitionCoordinatorContext> context){
     }];
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.heightConstraint = [NSLayoutConstraint constraintWithItem:self.inputView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:226];
    self.heightConstraint.priority = UILayoutPriorityRequired - 1; // This will eliminate the constraint conflict warning.
    [self.inputView removeConstraint:self.heightConstraint];

    [self.inputView addConstraint:self.heightConstraint];
    [self updateH];
}

- (void)updateViewConstraints{
    [super updateViewConstraints];
    [self updateH];
}

- (void)updateH{
    if (self.traitCollection.userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        if (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassCompact && self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassRegular) {
            self.heightConstraint.constant = 258;
        }
        if (self.traitCollection.horizontalSizeClass == UIUserInterfaceSizeClassRegular && self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact) {
            self.heightConstraint.constant = 193;
        }
        
        
    }else{
        
    }
}

- (void)textWillChange:(id<UITextInput>)textInput {
    // The app is about to change the document's contents. Perform any preparation here.
    
}

- (void)textDidChange:(id<UITextInput>)textInput {
    // The app has just changed the document's contents, the document context has been updated.

}


- (void)updateSuggestionData{
    
    __block NSString *lastWord = nil;
    [[self.textDocumentProxy documentContextBeforeInput] enumerateSubstringsInRange:NSMakeRange(0, [[self.textDocumentProxy documentContextBeforeInput] length]) options:NSStringEnumerationByWords | NSStringEnumerationReverse usingBlock:^(NSString *substring, NSRange subrange, NSRange enclosingRange, BOOL *stop) {
        lastWord = substring;
        lastkeyword = lastWord;
        *stop = YES;
    }];
    
    RLMResults<FAWord *> *suggestionList = [[FAWord objectsInRealm:realm where:[NSString stringWithFormat:@"word BEGINSWITH '%@'",lastWord]] sortedResultsUsingProperty:@"freq" ascending:NO];
    if (suggestionList.count >2) {
        themeView.suggestionWords = [NSArray arrayWithObjects:suggestionList[0], suggestionList[1], suggestionList[2], suggestionList[3], nil];
    }
    
}
@end
