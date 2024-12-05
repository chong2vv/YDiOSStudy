//
//  YDUserCenter.m
//  YDiOSStudy
//
//  Created by 王远东 on 2024/12/2.
//

#import "YDUserCenter.h"

@interface YDUserCenter ()
{
    dispatch_queue_t concurrent_queue;
    NSMutableDictionary *userDic;
}

@end

@implementation YDUserCenter

- (instancetype)init {
    if (self = [super init]) {
        concurrent_queue = dispatch_queue_create("read_write_queue", DISPATCH_QUEUE_CONCURRENT);
        userDic = [NSMutableDictionary dictionary];
    }
    return self;
}

- (id)objectForKey:(NSString *)key {
    __block id obj;
    dispatch_sync(concurrent_queue, ^{
        obj = [userDic objectForKey:key];
    });
    return obj;
}

- (void)setObject:(id)obj withKey:(NSString *)key {
    dispatch_barrier_async(concurrent_queue, ^{
        [self->userDic setObject:obj forKey:key];
    });
}

@end
