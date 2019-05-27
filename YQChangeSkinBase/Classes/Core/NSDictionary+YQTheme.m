//
//  NSDictionary+YQTheme.m
//  YQTheme
//
//  Created by LWH on 2018/05/08.
//

#import "NSDictionary+YQTheme.h"
#import "NSAttributedString+YQTheme.h"
#import "YQThemeManager.h"

@implementation NSDictionary (YQTheme)

- (NSDictionary *)theme_replaceTitleTextAttributes {
    if (!self[YQThemeForegroundColorAttributeName]) {
        return self;
    }
    NSMutableDictionary *tmpAttributes = [self mutableCopy];
    tmpAttributes[NSForegroundColorAttributeName] = [YQThemeManager colorWithID:self[YQThemeForegroundColorAttributeName]];
    return [tmpAttributes copy];
}

@end

