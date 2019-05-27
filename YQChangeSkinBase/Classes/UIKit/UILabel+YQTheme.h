//
//  UILabel+YQTheme.h
//  YQTheme
//
//  Created by SlashDevelopers on 2018/06/07.
//  Copyright (c) 2018 SlashDevelopers. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (YQTheme)

@property (nonatomic, copy) NSString *theme_textColor;
@property (nonatomic, copy) IBInspectable NSString *yq_textColor;
@property (nonatomic, copy) NSAttributedString *theme_attributedText;

@end
