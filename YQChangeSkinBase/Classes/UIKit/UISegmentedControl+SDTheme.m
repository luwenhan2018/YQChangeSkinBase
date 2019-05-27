//
//  UISegmentedControl+YQTheme.m
//  YQTheme
//
//  Created by SlashDevelopers on 2018/5/8.
//

#import "UISegmentedControl+YQTheme.h"
#import "NSAttributedString+YQTheme.h"
#import "NSObject+YQTheme.h"
#import "NSDictionary+YQTheme.h"
#import "YQThemeManager.h"
#import <objc/runtime.h>

@interface UISegmentedControl ()

@property (nonatomic, strong) NSMutableDictionary *theme_titleTextAttributes;

@end

@implementation UISegmentedControl (YQTheme)

- (void)theme_setTitleTextAttributes:(NSDictionary *)attributes
                            forState:(UIControlState)state
{
    self.theme_titleTextAttributes[@(state)] = attributes;
    [self setTitleTextAttributes:attributes.theme_replaceTitleTextAttributes forState:state];
    [self theme_registChangedNotification];
}

- (void)theme_didChanged {
    [super theme_didChanged];
    [self.theme_titleTextAttributes enumerateKeysAndObjectsUsingBlock:^(NSNumber *key, NSDictionary *obj, BOOL * _Nonnull stop) {
        [self setTitleTextAttributes:obj.theme_replaceTitleTextAttributes forState:(UIControlState)key.unsignedIntegerValue];
    }];
}

// MARK: - ================ Getters ===========================

- (NSMutableDictionary *)theme_titleTextAttributes {
    NSMutableDictionary *dict = objc_getAssociatedObject(self, @selector(theme_titleTextAttributes));
    if (dict) {
        return dict;
    }
    dict = [NSMutableDictionary dictionary];
    objc_setAssociatedObject(self, @selector(theme_titleTextAttributes), dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return dict;
}

@end
