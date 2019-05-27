//
//  UITableView+YQTheme.m
//  YQTheme
//
//  Created by LWH on 2019/05/27.
//  Copyright © 2019 LWH. All rights reserved.
//

#import "UITableView+YQTheme.h"
#import "NSObject+YQTheme.h"
#import "YQThemeManager.h"
#import <objc/runtime.h>

@implementation UITableView (YQTheme)

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_separatorColor) {
        self.separatorColor = [YQThemeManager colorWithID:self.theme_separatorColor];
    }
}

// MARK: - ================ Setters ===========================

- (void)setTheme_separatorColor:(NSString *)separatorColor {
    self.separatorColor = [YQThemeManager colorWithID:separatorColor];
    objc_setAssociatedObject(self, @selector(theme_separatorColor), separatorColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

// MARK: - ================ Getters ===========================

- (NSString *)theme_separatorColor {
    return objc_getAssociatedObject(self, @selector(theme_separatorColor));
}

@end
