//
//  YQThemeManager.m
//  YQTheme
//
//  Created by LWH on 2019/05/27.
//  Copyright © 2019 LWH. All rights reserved
//

#import "YQThemeManager.h"
#import "UIColor+YQExtension.h"

NSString * const YQThemeChangedNotification = @"YQThemeChangedNotification";

@interface YQThemeManager()

@property (nonatomic, strong) NSBundle *bundle;           ///< 主题bundle
@property (nonatomic, copy) NSDictionary *colorsMap;      ///< 颜色对照表
@property (nonatomic, copy) NSArray *themeArray;          ///< 主题数组

@end

@implementation YQThemeManager

// MARK: - ================ Public M ===========================

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static YQThemeManager *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[YQThemeManager alloc] init];
    });
    return instance;
}

- (void)setupThemeNameArray:(NSArray *)array {
    self.themeArray = array;
}

- (BOOL)changeTheme:(NSString *)themeName {
    if (![_themeArray containsObject:themeName]) {
        return NO;
    }
    NSBundle *bundle = [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:themeName withExtension:@"bundle"]];
    if (!bundle) {
        return NO;
    }
    NSString *mapPath = [bundle pathForResource:@"ColorsMap" ofType:@"plist"];
    if (!mapPath) {
        return NO;
    }
    NSDictionary *colorsMap = [NSDictionary dictionaryWithContentsOfFile:mapPath];
    _themeName = themeName;
    self.bundle = bundle;
    self.colorsMap = colorsMap;
    [self sendChangeThemeNotification];
    return YES;
}

+ (UIColor *)colorWithID:(NSString *)colorID {
    if (!colorID) {
        return [UIColor clearColor];
    }
    return [UIColor yq_colorWithHexString:[[self class] colorStringWithID:colorID]];
}


+ (NSString *)colorStringWithID:(NSString *)colorID {
    NSArray *array = [colorID componentsSeparatedByString:@"_"];
    NSAssert(array.count > 1, @"未找到对应颜色-%@", colorID);
    
    NSDictionary *colorDict = [[YQThemeManager sharedInstance].colorsMap valueForKeyPath:array[0]];
    NSString *value = colorDict[colorID][@"Color"];
    NSAssert(value, @"未找到对应颜色-%@", colorID);
    return value;
}

+ (UIImage *)imageWithName:(NSString *)imageName {
    if (!imageName) {
        return nil;
    }
    UIImage *image = [UIImage imageNamed:imageName inBundle:[YQThemeManager sharedInstance].bundle compatibleWithTraitCollection:nil];
    NSAssert(image, @"未找到对应图片-%@", imageName);
    return image;
}

// MARK: - ================ Private M ===========================

- (void)sendChangeThemeNotification {
    [[NSNotificationCenter defaultCenter] postNotificationName:YQThemeChangedNotification object:nil];
}

@end
