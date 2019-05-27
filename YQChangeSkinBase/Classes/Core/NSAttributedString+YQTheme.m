//
//  NSAttributedString+YQTheme.m
//  YQTheme
//
//  Created by SlashDevelopers on 2018/06/07.
//  Copyright (c) 2018 SlashDevelopers. All rights reserved.
//

#import "NSAttributedString+YQTheme.h"
#import "YQThemeManager.h"

NSAttributedStringKey const YQThemeForegroundColorAttributeName = @"YQThemeForegroundColorAttributeName";

@implementation NSAttributedString (YQTheme)

- (NSAttributedString *)theme_replaceRealityColor {
    NSMutableAttributedString *tmpAttributedText = [self mutableCopy];
    [self enumerateAttributesInRange:NSMakeRange(0, self.length) options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(NSDictionary<NSAttributedStringKey,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
        if (!attrs[YQThemeForegroundColorAttributeName]) {
            return;
        }
        NSMutableDictionary *tmpAttrs = [attrs mutableCopy];
        tmpAttrs[NSForegroundColorAttributeName] = [YQThemeManager colorWithID:attrs[YQThemeForegroundColorAttributeName]];
        [tmpAttributedText setAttributes:tmpAttrs range:range];
    }];
    return tmpAttributedText;
}

@end
