//
//  YDOCBaseViewController+YDMemory.m
//  YDiOSStudy
//
//  Created by 王远东 on 2024/11/27.
//

#import "YDOCBaseViewController+YDMemory.h"

@implementation YDOCBaseViewController (YDMemory)

- (void)loadMemoryData {
    self.data = @[
        @"AutoReleasePool"
    ];
}

- (void)didMemoryTypeClick:(NSString *)type {
    if ([type isEqualToString:@"AutoReleasePool"]) {
        [self autoreleausePoolAction];
    }
}

- (void)autoreleausePoolAction {
    NSMutableArray *array = [NSMutableArray array];
    NSLog(@"%@", array);
}

@end
