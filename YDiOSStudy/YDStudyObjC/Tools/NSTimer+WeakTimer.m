//
//  NSTimer+WeakTimer.m
//  YDiOSStudy
//
//  Created by 王远东 on 2024/11/29.
//

#import "NSTimer+WeakTimer.h"

@interface TimerWeakObject : NSObject

@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, weak) NSTimer *timer;

- (void)fire:(NSTimer *)timer;
@end

@implementation TimerWeakObject

- (void)fire:(NSTimer *)timer {
    if (self.target) {
        if ([self.target respondsToSelector:self.selector]) {
            [self.target performSelector:self.selector withObject:self.timer.userInfo];
            
//            NSMethodSignature *signature = [[self.target class] methodSignatureForSelector:self.selector];
//            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
//            [invocation setTarget:self.target];
//            [invocation setSelector:self.selector];
//            [invocation setArgument:(__bridge void * _Nonnull)(self.timer.userInfo) atIndex:2];
//            [invocation invoke];
        }
    } else {
        [self.timer invalidate];
    }
}

@end


@implementation NSTimer (WeakTimer)

+ (NSTimer *)scheduledWeakTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo {
    TimerWeakObject *object = [[TimerWeakObject alloc] init];
    object.target = aTarget;
    object.selector = aSelector;
    object.timer = [NSTimer scheduledWeakTimerWithTimeInterval:ti target:object selector:@selector(fire:) userInfo:userInfo repeats:yesOrNo];
    return object.timer;
}

@end
