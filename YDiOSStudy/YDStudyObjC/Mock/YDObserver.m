//
//  YDObserver.m
//  YDiOSStudy
//
//  Created by 王远东 on 2024/11/26.
//

#import "YDObserver.h"
#import "YDObject.h"

@implementation YDObserver


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([object isKindOfClass:[YDObject class]] && [keyPath isEqualToString:@"value"]) {
        NSNumber *valueNum = [change valueForKey:NSKeyValueChangeNewKey];
        NSLog(@"value is %@", valueNum);
    }
}

@end
