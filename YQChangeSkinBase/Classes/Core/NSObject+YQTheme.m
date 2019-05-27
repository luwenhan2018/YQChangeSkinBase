//
//  NSObject+YQTheme.m
//  YQTheme
//
//  Created by LWH on 2019/05/27.
//  Copyright © 2019 LWH. All rights reserved
//

#import "NSObject+YQTheme.h"
#import "NSObject+YQDeallocBlock.h"
#import "YQThemeManager.h"
#import <objc/runtime.h>

static NSString *const kHasRegistChangedThemeNotification;

@interface NSObject ()

@property (nonatomic, copy) void(^theme_changeBlock)(id observer);

@end

@implementation NSObject (YQTheme)

- (void)theme_registChangedNotification {
    NSNumber *hasRegist = objc_getAssociatedObject(self, &kHasRegistChangedThemeNotification);
    if (hasRegist) {
        return;
    }
    objc_setAssociatedObject(self, &kHasRegistChangedThemeNotification, @(YES), OBJC_ASSOCIATION_COPY_NONATOMIC);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(theme_didChanged) name:YQThemeChangedNotification object:nil];
    __weak typeof(self) weakSelf = self;
    [self yq_executeAtDealloc:^{
        [[NSNotificationCenter defaultCenter] removeObserver:weakSelf];
    }];
}

- (void)theme_observerChangedUsingBlock:(void(^)(id observer))themeChangeBlock {
    self.theme_changeBlock = themeChangeBlock;
    [self theme_didChanged];
    [self theme_registChangedNotification];
}

- (void)theme_didChanged {
    if (self.theme_changeBlock) {
        __weak typeof(self) weakSelf = self;
        self.theme_changeBlock(weakSelf);
    }
}

- (void)setTheme_changeBlock:(void (^)(void))block {
    objc_setAssociatedObject(self, @selector(theme_changeBlock), block, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(void))theme_changeBlock {
    return objc_getAssociatedObject(self, @selector(theme_changeBlock));
}

@end
