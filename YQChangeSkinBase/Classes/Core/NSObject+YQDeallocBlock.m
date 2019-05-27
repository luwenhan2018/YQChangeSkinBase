//
//  NSObject+     fcfd
//  YQTheme
//
//  Created by LWH on 2019/05/27.
//  Copyright © 2019 LWH. All rights reserved.
//

#import "NSObject+YQDeallocBlock.h"
#import <objc/runtime.h>

const void *YQDeallocExecutorsKey = &YQDeallocExecutorsKey;

@interface YQDeallocExecutor : NSObject

@property (nonatomic, copy) void(^deallocExecutorBlock)(void);

@end

@implementation YQDeallocExecutor

- (id)initWithBlock:(void(^)(void))deallocExecutorBlock {
    self = [super init];
    if (self) {
        _deallocExecutorBlock = [deallocExecutorBlock copy];
    }
    return self;
}

- (void)dealloc {
    _deallocExecutorBlock ? _deallocExecutorBlock() : nil;
}

@end


@implementation NSObject (YQDeallocBlock)

- (void)yq_executeAtDealloc:(void (^)(void))block {
    if (block) {
        YQDeallocExecutor *executor = [[YQDeallocExecutor alloc] initWithBlock:block];
        @synchronized (self) {
            [[self hs_deallocExecutors] addObject:executor];
        }
    }
}

- (NSHashTable *)hs_deallocExecutors {
    NSHashTable *table = objc_getAssociatedObject(self,YQDeallocExecutorsKey);
    if (!table) {
        table = [NSHashTable hashTableWithOptions:NSPointerFunctionsStrongMemory];
        objc_setAssociatedObject(self, YQDeallocExecutorsKey, table, OBJC_ASSOCIATION_RETAIN);
    }
    return table;
}

@end
