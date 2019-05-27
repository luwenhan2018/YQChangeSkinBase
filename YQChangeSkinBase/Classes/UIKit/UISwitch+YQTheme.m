//
//  UISwitch+YQTheme.m
//  YQTheme
//
//  Created by LWH on 2019/05/08.
//

#import "UISwitch+YQTheme.h"
#import "NSObject+YQTheme.h"
#import "YQThemeManager.h"
#import <objc/runtime.h>

@interface UISwitch ()

@end

@implementation UISwitch (YQTheme)

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_onTintColor) {
        UIColor *color = [YQThemeManager colorWithID:self.theme_onTintColor];
        self.onTintColor = color;
    }
    if (self.theme_thumbTintColor) {
        UIColor *color = [YQThemeManager colorWithID:self.theme_thumbTintColor];
        self.thumbTintColor = color;
    }
}

// MARK: - ================ Setter ===========================

- (void)setTheme_onTintColor:(NSString *)color {
    self.onTintColor = [YQThemeManager colorWithID:color];
    objc_setAssociatedObject(self, @selector(theme_onTintColor), color, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

- (void)setTheme_thumbTintColor:(NSString *)color {
    self.thumbTintColor = [YQThemeManager colorWithID:color];
    objc_setAssociatedObject(self, @selector(theme_thumbTintColor), color, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

// MARK: - ================ Getter ===========================

- (NSString *)theme_onTintColor {
    return objc_getAssociatedObject(self, @selector(theme_onTintColor));
}

- (NSString *)theme_thumbTintColor {
    return objc_getAssociatedObject(self, @selector(theme_thumbTintColor));
}

@end
