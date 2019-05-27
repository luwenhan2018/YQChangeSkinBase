//
//  UIActivityIndicatorView+YQTheme.m
//  Pods
//
//  Created by LWH on 2019/05/27.
//  Copyright © 2019 LWH. All rights reserved.
//

#import "UIActivityIndicatorView+YQTheme.h"
#import "NSObject+YQTheme.h"
#import "YQThemeManager.h"
#import <objc/runtime.h>

@implementation UIActivityIndicatorView (YQTheme)

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_color) {
        self.color = [YQThemeManager colorWithID:self.theme_color];
    }
}

// MARK: - ================ Setters ===========================

- (void)setTheme_color:(NSString *)color {
    self.color = [YQThemeManager colorWithID:color];
    objc_setAssociatedObject(self, @selector(theme_color), color, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

// MARK: - ================ Getters ===========================

- (NSString *)theme_color {
    return objc_getAssociatedObject(self, @selector(theme_color));
}

@end
