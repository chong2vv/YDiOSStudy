//
//  YDOCBaseViewController+YDOCRuntime.m
//  YDiOSStudy
//
//  Created by 王远东 on 2024/11/26.
//

#import "YDOCBaseViewController+YDOCRuntime.h"
#import "YDObject.h"

@implementation YDOCBaseViewController (YDOCRuntime)

- (void)loadRuntimeData {
    self.data = @[
        @"数据结构",
        @"类对象与元类对象",
        @"消息传递",
        @"消息转发",
        @"动态添加方法"
    ];
}

- (void)didRuntimeTypeClick:(NSString *)type {
    if ([type isEqualToString:@"消息传递"]) {
        [self msgSendTestAction];
    }else if ([type isEqualToString:@"消息转发"]) {
        [self msgResolveAction];
    }else if ([type isEqualToString:@"动态添加方法"]) {
        [self addFuncAction];
    }
}

- (void)msgSendTestAction {
    YDObject *obj = [[YDObject alloc] init];
    [obj msgSendTest];
}

- (void)msgResolveAction {
    YDObject *obj = [[YDObject alloc] init];
//    [obj resolveTest];
    [obj performSelector: @selector(resolveTest)];
}

- (void)addFuncAction {
    
}

@end
