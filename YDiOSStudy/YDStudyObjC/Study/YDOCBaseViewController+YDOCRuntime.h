//
//  YDOCBaseViewController+YDOCRuntime.h
//  YDiOSStudy
//
//  Created by 王远东 on 2024/11/26.
//

#import "YDOCBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface YDOCBaseViewController (YDOCRuntime)

- (void)loadRuntimeData;

- (void)didRuntimeTypeClick:(NSString *) type;

@end

NS_ASSUME_NONNULL_END
