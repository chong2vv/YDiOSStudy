//
//  YDOCBaseViewController+YDOCRuntime.m
//  YDiOSStudy
//
//  Created by 王远东 on 2024/11/26.
//

#import "YDOCBaseViewController+YDOCRuntime.h"

@implementation YDOCBaseViewController (YDOCRuntime)

- (void)loadRuntimeData {
    self.data = @[
        @"数据结构",
        @"类对象与元类对象",
        @"消息传递"
    ];
}

- (void)didRuntimeTypeClick:(NSString *)type {
    
}

@end
