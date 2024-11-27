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

//- (void)setValue:(NSInteger)value {
////    if (_value != value) {
////        _value = value;
////    }
//    NSLog(@"==== %ld ======", (long)value);
//}

@end
