//
//  YQViewController.m
//  YQChangeSkinBase
//
//  Created by luwenhan2018 on 05/27/2019.
//  Copyright (c) 2019 luwenhan2018. All rights reserved.
//

#import "YQViewController.h"
#import <YQChangeSkinBase/YQTheme.h>
@interface YQViewController ()
@property (nonatomic, strong) UIButton *blackButton;
@property (nonatomic, strong) UIButton *whiteButton;
@end

@implementation YQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.theme_backgroundColor = @"block_bg";
    _blackButton  = [UIButton buttonWithType:UIButtonTypeCustom];
    _blackButton.frame = CGRectMake(200, 200, 100, 50);
    [self.blackButton theme_setBackgroundColor:@"block_orange" forState:UIControlStateNormal];
    self.blackButton.tag = 101;
    [self.blackButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.blackButton theme_setImage:@"icon_history_completed_lage" forState:UIControlStateNormal];
    
    _whiteButton  = [UIButton buttonWithType:UIButtonTypeCustom];
    _whiteButton.frame = CGRectMake(200, 300, 100, 50);
    [self.whiteButton theme_setBackgroundColor:@"block_orange" forState:UIControlStateNormal];
    self.whiteButton.tag = 100;
    [self.whiteButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_whiteButton];
    [self.view addSubview:_blackButton];
}

- (void)buttonClicked:(UIButton *)sender {
    NSArray *themeArray = @[@"YQTheme-White", @"YQTheme-Block"];
    NSString *themeName = themeArray[sender.tag-100];
    [[YQThemeManager sharedInstance] changeTheme:themeName];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
