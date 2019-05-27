//
//  UIBarItem+YQTheme.h
//  YQTheme
//
//  Created by LWH on 2019/05/27.
//  Copyright © 2019 LWH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarItem (YQTheme)

@property (nonatomic, copy) NSString *theme_image;

- (void)theme_setTitleTextAttributes:(NSDictionary *)attributes
                            forState:(UIControlState)state;

@end
