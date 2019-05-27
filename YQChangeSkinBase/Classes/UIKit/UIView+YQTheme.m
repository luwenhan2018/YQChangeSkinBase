//
//  UIView+YQTheme.m
//  HuashengSecurities
//
//  Created by SlashDevelopers on 2018/4/25.
//  Copyright © 2018年 www.hstong.com. All rights reserved.
//

#import "UIView+YQTheme.h"
#import "NSObject+YQTheme.h"
#import "YQThemeManager.h"
#import <objc/runtime.h>

@interface UIView ()

@end

@implementation UIView (YQTheme)

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_backgroundColor) {
        self.backgroundColor = [YQThemeManager colorWithID:self.theme_backgroundColor];
    }
    if (self.theme_tintColor) {
        self.tintColor = [YQThemeManager colorWithID:self.theme_tintColor];
    }
}

// MARK: - ================ Setters ===========================

- (void)setTheme_backgroundColor:(NSString *)backgroundColorId {
    self.backgroundColor = [YQThemeManager colorWithID:backgroundColorId];
    objc_setAssociatedObject(self, @selector(theme_backgroundColor), backgroundColorId, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

- (void)setTheme_tintColor:(NSString *)tintColorId {
    self.tintColor = [YQThemeManager colorWithID:tintColorId];
    objc_setAssociatedObject(self, @selector(theme_tintColor), tintColorId, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

- (void)setYq_background:(NSString *)yq_background {
    self.theme_backgroundColor = yq_background;
}

// MARK: - ================ Getters ===========================

- (NSString *)theme_backgroundColor {
    return objc_getAssociatedObject(self, @selector(theme_backgroundColor));
}

- (NSString *)theme_tintColor {
    return objc_getAssociatedObject(self, @selector(theme_tintColor));
}

- (NSString *)yq_background {
    return self.theme_backgroundColor;
}

@end
