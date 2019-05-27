//
//  UIPageControl+YQTheme.m
//  YQTheme
//
//  Created by SlashDevelopers on 2018/5/8.
//

#import "UIPageControl+YQTheme.h"
#import "NSObject+YQTheme.h"
#import "YQThemeManager.h"
#import <objc/runtime.h>

@interface UIPageControl ()

@end

@implementation UIPageControl (YQTheme)

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_pageIndicatorTintColor) {
        self.pageIndicatorTintColor = [YQThemeManager colorWithID:self.theme_pageIndicatorTintColor];
    }
    if (self.theme_currentPageIndicatorTintColor) {
        self.currentPageIndicatorTintColor = [YQThemeManager colorWithID:self.theme_currentPageIndicatorTintColor];
    }
}

// MARK: - ================ Setters ===========================

- (void)setTheme_pageIndicatorTintColor:(NSString *)pageIndicatorTintColor {
    [self setPageIndicatorTintColor:[YQThemeManager colorWithID:pageIndicatorTintColor]];
    objc_setAssociatedObject(self, @selector(theme_pageIndicatorTintColor), pageIndicatorTintColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

- (void)setTheme_currentPageIndicatorTintColor:(NSString *)currentPageIndicatorTintColor {
    [self setCurrentPageIndicatorTintColor:[YQThemeManager colorWithID:currentPageIndicatorTintColor]];
    objc_setAssociatedObject(self, @selector(theme_currentPageIndicatorTintColor), currentPageIndicatorTintColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

// MARK: - ================ Getters ===========================

- (NSString *)theme_pageIndicatorTintColor {
    return objc_getAssociatedObject(self, @selector(theme_pageIndicatorTintColor));
}

- (NSString *)theme_currentPageIndicatorTintColor {
    return objc_getAssociatedObject(self, @selector(theme_currentPageIndicatorTintColor));
}

@end
