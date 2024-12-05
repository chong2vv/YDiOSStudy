//
//  YDUserCenter.h
//  YDiOSStudy
//
//  Created by 王远东 on 2024/12/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YDUserCenter : NSObject

- (id)objectForKey:(NSString *)key;
- (void)setObject:(id)obj withKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
