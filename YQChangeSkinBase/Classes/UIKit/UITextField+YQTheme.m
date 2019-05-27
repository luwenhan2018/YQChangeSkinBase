//
//  UITextField+YQTheme.m
//  YQTheme
//
//  Created by LWH on 2019/05/27.
//  Copyright © 2019 LWH. All rights reserved.
//

#import "UITextField+YQTheme.h"
#import "NSObject+YQTheme.h"
#import "NSAttributedString+YQTheme.h"
#import "YQThemeManager.h"
#import <objc/runtime.h>

@interface UITextField ()

@end

@implementation UITextField (YQTheme)

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_textColor) {
        self.textColor = [YQThemeManager colorWithID:self.theme_textColor];
    }
    if (self.attributedPlaceholder) {
        self.attributedPlaceholder = self.attributedPlaceholder.theme_replaceRealityColor;
    }
}

// MARK: - ================ Setters ===========================

- (void)setTheme_textColor:(NSString *)color {
    self.textColor = [YQThemeManager colorWithID:color];
    objc_setAssociatedObject(self, @selector(theme_textColor), color, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

- (void)setTheme_attributedPlaceholder:(NSAttributedString *)attributedPlaceholder {
    self.attributedPlaceholder = attributedPlaceholder.theme_replaceRealityColor;
    [self theme_registChangedNotification];
}

// MARK: - ================ Getters ===========================

- (NSString *)theme_textColor {
    return objc_getAssociatedObject(self, @selector(theme_textColor));
}

- (NSAttributedString *)theme_attributedPlaceholder {
    return self.attributedPlaceholder;
}

@end
