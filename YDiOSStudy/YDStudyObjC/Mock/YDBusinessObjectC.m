//
//  YDBusinessObjectC.m
//  YDiOSStudy
//
//  Created by 王远东 on 2024/12/5.
//

#import "YDBusinessObjectC.h"

@implementation YDBusinessObjectC

- (void)hanleBusiness:(CompletionBlock)completion {
    NSLog(@"C");
    completion(NO);
}
@end
