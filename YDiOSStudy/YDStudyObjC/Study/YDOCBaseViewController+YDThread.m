//
//  YDOCBaseViewController+YDThread.m
//  YDiOSStudy
//
//  Created by 王远东 on 2024/12/1.
//

#import "YDOCBaseViewController+YDThread.h"
#import <dispatch/dispatch.h>

dispatch_semaphore_t semaphore;


@implementation YDOCBaseViewController (YDThread)

void printNumbers(void *param) {
    // 用于区分线程
    NSNumber *threadNumber = (__bridge_transfer NSNumber *)param;
    for (int i = 1; i <= 100; i++) {
        // 等待信号量，只有当信号量大于0时才会继续执行
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
        NSLog(@"线程 %@ 输出: %d", threadNumber, i);
        // 释放信号量，让另一个线程可以执行
        dispatch_semaphore_signal(semaphore);
    }
}

- (void)loadThreadData {
    self.data = @[
        @"信号量",
        @"同步串行",
        @"同步并发"
    ];
}

- (void)didThreadTypeClick:(NSString *)type {
    if ([type isEqualToString:@"信号量"]) {
        [self semaphoreAction];
    }else if ([type isEqualToString:@"同步串行"]) {
        [self syncMainQueue];
    }
}

- (void)syncGlobalQueue {
    NSLog(@"1");
    dispatch_queue_global_t global = dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, DISPATCH_QUEUE_PRIORITY_DEFAULT);
    dispatch_sync(global, ^{
        NSLog(@"2");
        dispatch_sync(global, ^{
            NSLog(@"3");
        });
    });
}

- (void)syncMainQueue {
    dispatch_sync(dispatch_get_main_queue(), ^{
        [self doSomething];
    });
}

- (void)doSomething {
    NSLog(@"xxxxxx");
}

- (void)semaphoreAction {
    semaphore = dispatch_semaphore_create(1);
    dispatch_queue_t queue = dispatch_queue_create("com.example.queue", DISPATCH_QUEUE_CONCURRENT);
    NSNumber *thread1Number = @1;
    NSNumber *thread2Number = @2;
    dispatch_async(queue, ^{
        printNumbers((__bridge void *)thread1Number);
//        [self jjjjjj];
//        [self kkkkk:thread1Number];
    });
    dispatch_async(queue, ^{
        printNumbers((__bridge void *)thread2Number);
//        [self kkkkk:thread2Number];
    });
    dispatch_main();
}

- (void)jjjjjj {
    NSLog(@"====== 大好人 ======");
}

@end
