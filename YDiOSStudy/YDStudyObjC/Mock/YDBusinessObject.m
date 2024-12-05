//
//  YDBusinessObject.m
//  YDiOSStudy
//
//  Created by 王远东 on 2024/12/5.
//

#import "YDBusinessObject.h"

@implementation YDBusinessObject

- (void)handle:(ResultBlock)result {
    CompletionBlock completion = ^(BOOL handled) {
        if (handled) {
            result(self, handled);
        }else {
            if (self.nextObject) {
                [self.nextObject handle:result];
            }else {
                result(nil, NO);
            }
        }
    };
    // 当前业务进行处理
    [self hanleBusiness:completion];
}

// 具体业务处理
- (void)hanleBusiness:(CompletionBlock)completion {
    
}

@end
