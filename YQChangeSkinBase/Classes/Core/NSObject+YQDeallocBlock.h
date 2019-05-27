//
//  NSObject+YQDeallocBlock.h
//  YQTheme
//
//  Created by SlashDevelopers on 2018/06/07.
//  Copyright (c) 2018 SlashDevelopers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YQDeallocBlock)

- (void)yq_executeAtDealloc:(void (^)(void))block;

@end
