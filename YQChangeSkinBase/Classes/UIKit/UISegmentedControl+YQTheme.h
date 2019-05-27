//
//  UISegmentedControl+YQTheme.h
//  YQTheme
//
//  Created by LWH on 2018/05/08.
//

#import <UIKit/UIKit.h>

@interface UISegmentedControl (YQTheme)

- (void)theme_setTitleTextAttributes:(NSDictionary *)attributes
                            forState:(UIControlState)state;

@end
