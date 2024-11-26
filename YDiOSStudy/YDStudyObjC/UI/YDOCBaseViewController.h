//
//  YDOCBaseViewController.h
//  YDiOSStudy
//
//  Created by 王远东 on 2024/11/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YDOCBaseViewController : UIViewController

@property (nonatomic, copy) NSArray *data;

+ (YDOCBaseViewController *) creatVC:(NSString *) type;
@end

NS_ASSUME_NONNULL_END
