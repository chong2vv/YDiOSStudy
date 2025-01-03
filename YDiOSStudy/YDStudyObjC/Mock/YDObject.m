//
//  YDObject.m
//  YDiOSStudy
//
//  Created by 王远东 on 2024/11/26.
//

#import "YDObject.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation YDObject

static NSThread *thread = nil;
static BOOL runAlaways = YES;

+ (NSThread *)threadForDispatch {
    if (thread == nil) {
        @synchronized (self) {
            if (thread == nil) {
                // 线程的创建
                thread = [[NSThread alloc] initWithTarget:self selector:@selector(runRequest) object:nil];
                [thread setName:@"com.yd.thread"];
                // 启动
                [thread start];
            }
        }
    }
    return thread;
}

- (void)runRequest {
    CFRunLoopSourceContext context = {0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL};
    CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
    // 创建RunLoop，同时向RunLoop的defaultMode下添加source
    CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
    // 如果可以运行
    while (runAlaways) {
        @autoreleasepool {
            // 令当前RunLoop运行在DefaultMode下面
            CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, true);
        }
    }
    
    // 某一时机 静态变量runAlaways = NO 可以保证跳出RunLoop，线程退出
    CFRunLoopRemoveSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
    CFRelease(source);
    
}


// 方法执行体
void testImp(void) {
    NSLog(@"test invoke");
}

//+ (void)load {
// array
//    Method test = class_getInstanceMethod(self, @selector(resolveTest));
//    Method otherTest = class_getInstanceMethod(self, @selector(exchangeResolveTest));
//    method_exchangeImplementations(test, otherTest);
//    
//    Method test3 = class_getInstanceMethod(self, @selector(resolveTest));
//    Method test4 = class_getInstanceMethod(self, @selector(exchangeResolveTest));
//    method_exchangeImplementations(test3, test4);
//}

- (instancetype)init {
    if (self = [super init]) {
        _value = 0;
    }
    return self;
}

- (void)increase {
    [self willChangeValueForKey:@"value"];
    _value += 1;
    [self didChangeValueForKey:@"value"];
}

- (void)msgSendTest {
//    ( (void (*) (id, SEL)) objc_msgSend) ( (id)self, @selector(msgSendAction));
//    ((void (*) (id, SEL, NSString*)) objc_msgSend)((id)self, @selector(msgSendParamsAction:), @"哈哈哈哈");
    NSString * logStr = ((NSString* (*) (id, SEL, NSString*)) objc_msgSend)((id)self, @selector(msgSendParamsAction:), @"返回值显示");
    NSLog(@"%@", logStr);
    
}

- (void)blockTest {
    __block int a = 10;
    _blk = ^int(int num) {
        return num * a;
    };
    a = 6;
    [self deepBlockTest];
    
}

- (void)deepBlockTest {
    int value = _blk(4);
    NSLog(@"block value : %d", value);
}

- (void)exchangeResolveTest {
    NSLog(@"exchangeResolveTest:");
}

//- (void)resolveTest {
//    NSLog(@"resolveTest");
//}


- (void)msgSendAction {
    NSLog(@"msgSend 调用 ++++++");
}

- (void)msgSendParamsAction:(NSString *)name {
    NSLog(@"msgSend 调用 ++++++ %@", name);
}

- (NSString *)msgSendParamsReturnAction:(NSString *)name {
    NSLog(@"msgSend 调用 ++++++ %@", name);
    return  name;
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    // 如果是test方法 打印日志
    if (sel == @selector(resolveTest)) {
        NSLog(@"resolveInstanceMethod:");
        class_addMethod(self, sel, testImp, "v@:");
        return  YES;
    }else {
        // 返回父类的默认调用
        return [super resolveInstanceMethod: sel];
    }
}



- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"forwardingTargetForSelector:");
    return nil;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(resolveTest)) {
        NSLog(@"methodSignatureForSelector");
        //v 代表返回值是void类型
        //@ 代表第一个参数类型是id，即self
        //: 代表第二个参数是SEL类型的，即@selector（test）
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }else {
        return [super methodSignatureForSelector: aSelector];
    }
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation:");
}

//- (void)setValue:(NSInteger)value {
////    if (_value != value) {
////        _value = value;
////    }
//    NSLog(@"==== %ld ======", (long)value);
//}

@end
