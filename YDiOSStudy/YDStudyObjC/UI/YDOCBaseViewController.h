//
//  YDOCBaseViewController.h
//  YDiOSStudy
//
//  Created by 王远东 on 2024/11/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YDOCBaseViewController : UIViewController
//dispatch_queue_t mainQueue = dispatch_get_main_queue();
//dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//dispatch_queue_t otherQueue = dispatch_queue_create(@"com.xxxx.thread", DISPATCH_QUEUE_SERIAL_INACTIVE);

@property (nonatomic, strong) dispatch_queue_t mainQueue;
@property (nonatomic, strong) dispatch_queue_t globalQueue;
@property (nonatomic, strong) dispatch_queue_t otherQueue;
@property (nonatomic, copy) NSArray *data;

+ (YDOCBaseViewController *) creatVC:(NSString *) type;
@end

NS_ASSUME_NONNULL_END
