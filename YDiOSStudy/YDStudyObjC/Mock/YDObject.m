//
//  YDObject.m
//  YDiOSStudy
//
//  Created by 王远东 on 2024/11/26.
//

#import "YDObject.h"

@implementation YDObject

- (instancetype)init {
    if (self = [super init]) {
        _value = 0;
    }
    return self;
}

- (void)increase {
    [self willChangeValueForKey:@"value"];
    _value += 1;
    [self didChangeValueForKey:@"value"];
}

//- (void)setValue:(NSInteger)value {
////    if (_value != value) {
////        _value = value;
////    }
//    NSLog(@"==== %ld ======", (long)value);
//}

@end
