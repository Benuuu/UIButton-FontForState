//
//  UIButton+FontForState.m
//  FontForState
//
//  Created by Benjamin Wu on 11/15/13.
//  Copyright (c) 2013 Intrepid Pursuits. All rights reserved.
//

#import "UIButton+FontForState.h"
#import <objc/runtime.h>

static char *const kFontForStateNotificationCenterContext   = "kFontForStateNotificationCenterContext";
static char *const kFontForStateHasRegisteredKey            = "kFontForStateHasRegisteredKey";
static char *const kFontForStateDictionaryKey               = "kFontForStateDictionaryKey";

@implementation UIButton (FontForState)

- (UIFont *)fontForState:(UIControlState)state {
    NSMutableDictionary *fontDictionary = objc_getAssociatedObject(self, kFontForStateDictionaryKey);
    return [fontDictionary objectForKey:[NSNumber numberWithInt:state]];
}

- (void)setFont:(UIFont *)font forState:(UIControlState)state {
    [self ffs_addStateObservers];
    
    NSMutableDictionary *fontDictionary = objc_getAssociatedObject(self, kFontForStateDictionaryKey);
    if (!fontDictionary) {
        fontDictionary = [[NSMutableDictionary alloc] init];
    }
    [fontDictionary setObject:font forKey:[NSNumber numberWithInt:state]];
    objc_setAssociatedObject(self, kFontForStateDictionaryKey, fontDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (self.state == state) {
        [self.titleLabel setFont:font];
    }
}

- (void)ffs_addStateObservers {
    NSNumber *hasRegistered = objc_getAssociatedObject(self, kFontForStateHasRegisteredKey);
    if (![hasRegistered boolValue]) {
        [self addObserver:self forKeyPath:@"enabled" options:NSKeyValueObservingOptionNew context:kFontForStateNotificationCenterContext];
        [self addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew context:kFontForStateNotificationCenterContext];
        [self addObserver:self forKeyPath:@"selected" options:NSKeyValueObservingOptionNew context:kFontForStateNotificationCenterContext];
        objc_setAssociatedObject(self, kFontForStateHasRegisteredKey, [NSNumber numberWithBool:YES], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (context == kFontForStateNotificationCenterContext) {
        UIFont *font = [self fontForState:self.state];
        NSLog(@"font: %@", font);
        if (font) {
            [self.titleLabel setFont:font];
        } else {
            [self.titleLabel setFont:[self fontForState:UIControlStateNormal]];
        }
    }
}


@end
