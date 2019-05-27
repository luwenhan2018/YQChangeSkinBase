//
//  UITabBar+YQTheme.m
//  YQTheme
//
//  Created by LWH on 2019/05/27.
//  Copyright © 2019 LWH. All rights reserved.
//

#import "UITabBar+YQTheme.h"
#import "NSObject+YQTheme.h"
#import "YQThemeManager.h"
#import <objc/runtime.h>

@interface UITabBar ()

@end

@implementation UITabBar (YQTheme)

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_barTintColor) {
        self.barTintColor = [YQThemeManager colorWithID:self.theme_barTintColor];
    }
}

// MARK: - ================ Setters ===========================

- (void)setTheme_barTintColor:(NSString *)barTintColor {
    self.barTintColor = [YQThemeManager colorWithID:barTintColor];
    objc_setAssociatedObject(self, @selector(theme_barTintColor), barTintColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

// MARK: - ================ Getters ===========================

- (NSString *)theme_barTintColor {
    return objc_getAssociatedObject(self, @selector(theme_barTintColor));
}

@end
