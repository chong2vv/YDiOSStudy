//
//  SayHi.m
//  YDiOSStudy
//
//  Created by 王远东 on 2023/10/13.
//

#import "SayHi.h"
#import "Boy.h"

@implementation SayHi

- (instancetype)init {
    if (self = [super init]) {
        Boy *boy = [[Boy alloc] init];
        [boy sayHi];
    }
    return self;
}

@end
