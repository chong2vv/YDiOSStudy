//
//  YDBusinessObject.h
//  YDiOSStudy
//
//  Created by 王远东 on 2024/12/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class YDBusinessObject;
typedef void(^CompletionBlock)(BOOL handled);
typedef void(^ResultBlock)(YDBusinessObject *handler, BOOL handled);

@interface YDBusinessObject : NSObject
// 下一个响应者
@property (nonatomic, strong) YDBusinessObject *nextObject;
// 响应者的处理方法
- (void)handle:(ResultBlock) result;

// 各个业务在该方法中做实际业务处理
- (void)hanleBusiness:(CompletionBlock) completion;

@end

NS_ASSUME_NONNULL_END
