//
//  UILabel+YQTheme.h
//  YQTheme
//
//  Created by LWH on 2019/05/27.
//  Copyright © 2019 LWH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (YQTheme)

@property (nonatomic, copy) NSString *theme_textColor;
@property (nonatomic, copy) IBInspectable NSString *yq_textColor;
@property (nonatomic, copy) NSAttributedString *theme_attributedText;

@end
