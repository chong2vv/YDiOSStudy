//
//  YDBusinessObjectA.m
//  YDiOSStudy
//
//  Created by 王远东 on 2024/12/5.
//

#import "YDBusinessObjectA.h"

@implementation YDBusinessObjectA

- (void)hanleBusiness:(CompletionBlock)completion {
    NSLog(@"A");
    completion(NO);
}
@end
