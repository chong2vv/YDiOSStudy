//
//  YDOCBaseViewController+YDDesign.m
//  YDiOSStudy
//
//  Created by 王远东 on 2024/12/5.
//

#import "YDOCBaseViewController+YDDesign.h"

#import "YDBusinessObject.h"
#import "YDBusinessObjectA.h"
#import "YDBusinessObjectB.h"
#import "YDBusinessObjectC.h"

@implementation YDOCBaseViewController (YDDesign)

- (void)loadDesignData {
    self.data = @[
        @"责任链模式"
    ];
}

- (void)didDesignTypeClick:(NSString *)type {
    if ([type isEqualToString:@"责任链模式"]) {
        [self handleAction];
    }
}

- (void)handleAction {
    YDBusinessObjectA *objcA = [[YDBusinessObjectA alloc] init];
    YDBusinessObjectB *objcB = [[YDBusinessObjectB alloc] init];
    YDBusinessObjectC *objcC = [[YDBusinessObjectC alloc] init];
    // C->A->B
    objcC.nextObject = objcA;
    objcA.nextObject = objcB;
    [objcC handle:^(YDBusinessObject * _Nonnull handler, BOOL handled) {
        if (handled == YES) {
            NSLog(@"===== 处理成功 =====");
        }
    }];
    
}
@end
