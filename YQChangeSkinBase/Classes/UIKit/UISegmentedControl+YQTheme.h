//
//  UISegmentedControl+YQTheme.h
//  YQTheme
//
//  Created by SlashDevelopers on 2018/5/8.
//

#import <UIKit/UIKit.h>

@interface UISegmentedControl (YQTheme)

- (void)theme_setTitleTextAttributes:(NSDictionary *)attributes
                            forState:(UIControlState)state;

@end
