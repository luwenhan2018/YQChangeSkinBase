//
//  UILabel+YQTheme.m
//  YQTheme
//
//  Created by SlashDevelopers on 2018/06/07.
//  Copyright (c) 2018 SlashDevelopers. All rights reserved.
//

#import "UILabel+YQTheme.h"
#import "NSObject+YQTheme.h"
#import "NSAttributedString+YQTheme.h"
#import "YQThemeManager.h"
#import <objc/runtime.h>

@interface UILabel()

@end

@implementation UILabel (YQTheme)

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_textColor) {
        self.textColor = [YQThemeManager colorWithID:self.theme_textColor];
    }
    if (self.attributedText) {
        self.attributedText = self.attributedText.theme_replaceRealityColor;
    }
}

// MARK: - ================ Setters ===========================

- (void)setTheme_textColor:(NSString *)color {
    self.textColor = [YQThemeManager colorWithID:color];
    objc_setAssociatedObject(self, @selector(theme_textColor), color, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

- (void)setTheme_attributedText:(NSAttributedString *)attributedText {
    self.attributedText = attributedText.theme_replaceRealityColor;
    [self theme_registChangedNotification];
}

- (void)setYQTextColorID:(NSString *)YQTextColorID {
    self.theme_textColor = YQTextColorID;
}

- (void)setYq_textColor:(NSString *)yq_textColor {
    self.theme_textColor = yq_textColor;
}

// MARK: - ================ Getters ===========================

- (NSString *)theme_textColor {
    return objc_getAssociatedObject(self, @selector(theme_textColor));
}

- (NSAttributedString *)theme_attributedText {
    return self.attributedText;
}

- (NSString *)yq_textColor {
    return self.theme_textColor;
}

@end
