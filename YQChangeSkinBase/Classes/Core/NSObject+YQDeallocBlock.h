//
//  NSObject+YQDeallocBlock.h
//  YQTheme
//
//  Created by LWH on 2019/05/27.
//  Copyright © 2019 LWH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YQDeallocBlock)

- (void)yq_executeAtDealloc:(void (^)(void))block;

@end
