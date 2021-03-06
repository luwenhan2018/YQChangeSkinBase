//
//  UITextView+YQTheme.m
//  Pods
//
//  Created by LWH on 2019/05/27.
//  Copyright © 2019 LWH. All rights reserved.
//

#import "UITextView+YQTheme.h"
#import "NSObject+YQTheme.h"
#import "YQThemeManager.h"
#import <objc/runtime.h>

@implementation UITextView (YQTheme)

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_textColor) {
        self.textColor = [YQThemeManager colorWithID:self.theme_textColor];
    }
}

// MARK: - ================ Setters ===========================

- (void)setTheme_textColor:(NSString *)color {
    self.textColor = [YQThemeManager colorWithID:color];
    objc_setAssociatedObject(self, @selector(theme_textColor), color, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

// MARK: - ================ Getters ===========================

- (NSString *)theme_textColor {
    return objc_getAssociatedObject(self, @selector(theme_textColor));
}

@end
