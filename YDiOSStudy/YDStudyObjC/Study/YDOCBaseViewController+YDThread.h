//
//  YDOCBaseViewController+YDThread.h
//  YDiOSStudy
//
//  Created by 王远东 on 2024/12/1.
//

#import "YDOCBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface YDOCBaseViewController (YDThread)

- (void)loadThreadData;

- (void)didThreadTypeClick:(NSString *)type;

@end

NS_ASSUME_NONNULL_END
