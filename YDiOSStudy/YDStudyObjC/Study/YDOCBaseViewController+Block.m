//
//  YDOCBaseViewController+Block.m
//  YDiOSStudy
//
//  Created by 王远东 on 2024/11/30.
//

#import "YDOCBaseViewController+Block.h"
#import "YDObject.h"

@implementation YDOCBaseViewController (Block)

- (void)loadBlockData {
    self.data = @[
        @"BlockVar"
    ];
}

- (void)didBlockTypeClick:(NSString *)type {
    if ([type isEqualToString:@"BlockVar"]) {
        [self blockTest];
    }
}

- (void)blockTest {
    YDObject *objc = [[YDObject alloc] init];
    [objc blockTest];
}

- (void)blockVarAction {
    int a = 2;
    __block int b = 2;
    
    NSNumber *num = [NSNumber numberWithInt:2];
    __block NSNumber *blockNum = [NSNumber numberWithInt:2];
    NSString *c = @"ab";
    __block NSString *d = @"ab";
    YDObject *objc = [[YDObject alloc] init];
    objc.value = 2;
    void (^Block)(void) = ^void(void) {
        NSLog(@"print a ==== %d",a); //2
        NSLog(@"print b ==== %d",b); //3
        NSLog(@"print c ==== %@",c); //"ab"
        NSLog(@"print d ==== %@",d); //"cd"
        NSLog(@"print num ==== %@",num); //2
        NSLog(@"print blockNum ==== %@",blockNum); //3
        NSLog(@"print value ==== %ld",(long)objc.value); //3
    };
    a = 3;
    b = 3;
    num = [NSNumber numberWithInt:3];
    blockNum = [NSNumber numberWithInt:3];
    c = @"cd";
    d = @"cd";
    objc = [[YDObject alloc] init];
    objc.value = 3;
    /**
     print a ==== 2
     print b ==== 3
     print c ==== ab
     print d ==== cd
     print num ==== 2
     print blockNum ==== 3
     print value ==== 2
     */
    Block();
}

@end
