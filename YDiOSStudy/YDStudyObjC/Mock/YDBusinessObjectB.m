//
//  YDBusinessObjectB.m
//  YDiOSStudy
//
//  Created by 王远东 on 2024/12/5.
//

#import "YDBusinessObjectB.h"

@implementation YDBusinessObjectB

- (void)hanleBusiness:(CompletionBlock)completion {
    NSLog(@"B");
    completion(YES);
}
@end
