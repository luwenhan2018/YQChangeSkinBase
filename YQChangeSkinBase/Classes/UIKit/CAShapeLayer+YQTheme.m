//
//  CAShapeLayer+YQTheme.m
//  Pods
//
//  Created by LWH on 2019/05/27.
//  Copyright © 2019 LWH. All rights reserved.
//

#import "CAShapeLayer+YQTheme.h"
#import "NSObject+YQTheme.h"
#import "YQThemeManager.h"
#import <objc/runtime.h>

@implementation CAShapeLayer (YQTheme)

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_fillColor) {
        self.fillColor = [YQThemeManager colorWithID:self.theme_fillColor].CGColor;
    }
    if (self.theme_strokeColor) {
        self.strokeColor = [YQThemeManager colorWithID:self.theme_strokeColor].CGColor;
    }
}

// MARK: - ================ Setter ===========================

- (void)setTheme_fillColor:(NSString *)color {
    self.fillColor = [YQThemeManager colorWithID:color].CGColor;
    objc_setAssociatedObject(self, @selector(theme_fillColor), color, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

- (void)setTheme_strokeColor:(NSString *)color {
    self.strokeColor = [YQThemeManager colorWithID:color].CGColor;
    objc_setAssociatedObject(self, @selector(theme_strokeColor), color, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

// MARK: - ================ Getter ===========================

- (NSString *)theme_fillColor {
    return objc_getAssociatedObject(self, @selector(theme_fillColor));
}

- (NSString *)theme_strokeColor {
    return objc_getAssociatedObject(self, @selector(theme_strokeColor));
}

@end
