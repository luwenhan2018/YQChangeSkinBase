//
//  UITabBarItem+YQTheme.m
//  Pods
//
//  Created by LWH on 2019/05/27.
//  Copyright © 2019 LWH. All rights reserved.
//

#import "UITabBarItem+YQTheme.h"
#import "NSObject+YQTheme.h"
#import "YQThemeManager.h"
#import <objc/runtime.h>

@implementation UITabBarItem (YQTheme)

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_selectedImage) {
        self.selectedImage = [[YQThemeManager imageWithName:self.theme_selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
}

// MARK: - ================ Setters ===========================

- (void)setTheme_selectedImage:(NSString *)image {
    self.selectedImage = [[YQThemeManager imageWithName:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    objc_setAssociatedObject(self, @selector(theme_selectedImage), image, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

// MARK: - ================ Getters ===========================

- (NSString *)theme_selectedImage {
    return objc_getAssociatedObject(self, @selector(theme_selectedImage));
}

@end
