//
//  NSAttributedString+YQTheme.h
//  YQTheme
//
//  Created by LWH on 2018/06/07.
//  Copyright (c) 2018 LWH. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT NSAttributedStringKey const YQThemeForegroundColorAttributeName;

@interface NSAttributedString (YQTheme)

/// 取得真实颜色值
- (NSAttributedString *)theme_replaceRealityColor;

@end
