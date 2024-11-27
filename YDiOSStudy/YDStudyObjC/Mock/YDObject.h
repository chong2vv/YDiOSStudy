//
//  YDObject.h
//  YDiOSStudy
//
//  Created by 王远东 on 2024/11/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YDObject : NSObject

@property (nonatomic, assign) NSInteger value;

//如果是copy声明则会变成不可变对象
@property (nonatomic, copy) NSMutableArray *cMutableArray;
@property (nonatomic, strong) NSMutableArray *bMutableArray;

- (void)increase;

- (void)msgSendTest;

@end

NS_ASSUME_NONNULL_END
