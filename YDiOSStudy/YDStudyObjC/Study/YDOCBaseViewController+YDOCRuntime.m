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
        @"消息传递"
    ];
}

- (void)didRuntimeTypeClick:(NSString *)type {
    if ([type isEqualToString:@"消息传递"]) {
        [self msgSendTestAction];
    }
}

- (void)msgSendTestAction {
    YDObject *obj = [[YDObject alloc] init];
    [obj msgSendTest];
}

@end
