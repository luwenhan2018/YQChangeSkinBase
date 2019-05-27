//
//  UIImageView+YQTheme.m
//  YQTheme
//
//  Created by LWH on 2019/05/27.
//  Copyright © 2019 LWH. All rights reserved.
//

#import "UIImageView+YQTheme.h"
#import "NSObject+YQTheme.h"
#import "YQThemeManager.h"
#import <objc/runtime.h>

@interface UIImageView ()

@end

@implementation UIImageView (YQTheme)

- (void)theme_didChanged {
    [super theme_didChanged];
    if (self.theme_image) {
        self.image = [YQThemeManager imageWithName:self.theme_image];
    }
}

// MARK: - ================ Setters ===========================

- (void)setTheme_image:(NSString *)image {
    self.image = [YQThemeManager imageWithName:image];
    objc_setAssociatedObject(self, @selector(theme_image), image, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self theme_registChangedNotification];
}

- (void)setYq_image:(NSString *)yq_image {
    self.theme_image = yq_image;
}

// MARK: - ================ Getters ===========================

- (NSString *)theme_image {
    return objc_getAssociatedObject(self, @selector(theme_image));
}

- (NSString *)yq_image {
    return self.theme_image;
}

@end
