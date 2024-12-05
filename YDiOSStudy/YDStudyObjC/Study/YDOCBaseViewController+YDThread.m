//
//  YDOCBaseViewController+YDThread.m
//  YDiOSStudy
//
//  Created by 王远东 on 2024/12/1.
//

#import "YDOCBaseViewController+YDThread.h"
#import <dispatch/dispatch.h>
#import "YDUserCenter.h"

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
        @"同步并发",
        @"异步串行",
        @"异步并发",
        @"barrier",
        @"Test"
    ];
}

- (void)didThreadTypeClick:(NSString *)type {
    if ([type isEqualToString:@"信号量"]) {
        [self semaphoreAction];
    }else if ([type isEqualToString:@"同步串行"]) {
        [self syncMainQueue];
    }else if ([type isEqualToString:@"同步并发"]) {
        [self syncGlobalQueue];
    }else if ([type isEqualToString:@"异步串行"]) {
        [self asyncMainQueue];
    }else if ([type isEqualToString:@"异步并发"]) {
        [self asyncGlobalQueue];
    }else if ([type isEqualToString:@"barrier"]) {
        
    }else if ([type isEqualToString:@"Test"]) {
        [self test];
    }
}

- (void)test {
    self.mainQueue = dispatch_get_main_queue();
    self.globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    if (!self.otherQueue) {
        self.otherQueue = dispatch_queue_create("com.xxxx.thread", DISPATCH_QUEUE_SERIAL);
    }
    
    dispatch_async(self.otherQueue, ^{
        [self funcA];
        NSLog(@"%@", [NSThread currentThread]);
    });
    dispatch_async(self.otherQueue, ^{
        [self funcB];
        NSLog(@"%@", [NSThread currentThread]);
    });
    dispatch_async(self.otherQueue, ^{
        [self funcC];
        NSLog(@"%@", [NSThread currentThread]);
    });
    NSLog(@"====== hhhhh ======");
    NSLog(@"%@", [NSThread currentThread]);
}

- (void) funcA {
    NSLog(@"A");
}

- (void) funcB {
    NSLog(@"B");
}

- (void) funcC {
    NSLog(@"C");
}

- (void) funcD {
    NSLog(@"D");
}

- (void)asyncGlobalQueue {
    self.mainQueue = dispatch_get_main_queue();
    self.globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    if (!self.otherQueue) {
        self.otherQueue = dispatch_queue_create("com.xxxx.thread", DISPATCH_QUEUE_SERIAL);
    }
//    self.otherQueue = dispatch_queue_create("com.xxxx.thread", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(self.globalQueue, ^{
        NSLog(@"1");
//        [self performSelector:@selector(doSomething) withObject:nil afterDelay:0];
        dispatch_sync(self.globalQueue, ^{
            NSLog(@"2");
        });
        NSLog(@"3");
    });
}

- (void)barrierAction {
    YDUserCenter *userCenter = [[YDUserCenter alloc] init];
}

- (void)syncGlobalQueue {
    NSLog(@"1");
    dispatch_queue_global_t global = dispatch_get_global_queue(QOS_CLASS_USER_INTERACTIVE, DISPATCH_QUEUE_PRIORITY_DEFAULT);
    dispatch_sync(global, ^{
        NSLog(@"2");
        dispatch_sync(global, ^{
            NSLog(@"3");
        });
        NSLog(@"4");
    });
    NSLog(@"5");
}

- (void)syncMainQueue {
    if (!self.otherQueue) {
        self.otherQueue = dispatch_queue_create("com.xxxx.thread", DISPATCH_QUEUE_SERIAL);
    }
    self.globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_sync(self.otherQueue, ^{
        [self doSomething];
    });
}

- (void)asyncMainQueue {
    if (!self.otherQueue) {
        self.otherQueue = dispatch_queue_create("com.xxxx.thread", DISPATCH_QUEUE_SERIAL);
    }
    self.globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"1111");
        dispatch_sync(self.otherQueue, ^{
            NSLog(@"2222");
            sleep(3);
        });
        sleep(3);
        NSLog(@"3333");
    });
}

- (void)doSomething {
    NSLog(@"2");
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
