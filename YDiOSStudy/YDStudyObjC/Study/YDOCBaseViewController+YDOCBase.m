//
//  YDOCBaseViewController+YDOCBase.m
//  YDiOSStudy
//
//  Created by 王远东 on 2024/11/26.
//

#import "YDOCBaseViewController+YDOCBase.h"
#import "YDObject.h"
#import "YDObserver.h"

@implementation YDOCBaseViewController (YDOCBase)

- (void)loadOCBaseData {
    self.data = @[
        @"KVO",
        @"copy"
    ];
}

- (void)didOCBaseTypeClick:(NSString *)type {
    if ([type isEqual:@"KVO"]) {
        [self kvo];
    } else if ([type isEqual:@"copy"]) {
        [self copyAction];
    }
}

- (void)kvo {
    YDObject *obj = [[YDObject alloc] init];
    YDObserver *observer = [[YDObserver alloc] init];
    
    [obj addObserver:observer forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:NULL];
    
    obj.value = 1;
    
    [obj setValue:@2 forKey:@"value"];
    
    [obj increase];
}

- (void)copyAction {
//    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3"]];
    NSArray *array;
    NSMutableArray *mutableArray;
    YDObject *obj = [[YDObject alloc] init];
//    obj.bMutableArray = array;
//    obj.cMutableArray = [array mutableCopy];
//    [array addObject:@"4"];
//    NSLog(@"array ==== %@", array);
//    [obj.bMutableArray addObject:@"5"];
//    NSLog(@"bMutableArray ==== %@", obj.bMutableArray);
//    [obj.cMutableArray addObject:@"6"];
//    NSLog(@"cMutableArray ==== %@", obj.cMutableArray);
    
    obj.bMutableArray = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3"]];
    obj.cMutableArray = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3"]];
    array = [obj.cMutableArray mutableCopy];
//    [mutableArray addObject:@"4"];
    
}


@end
