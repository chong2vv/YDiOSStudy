//
//  main.m
//  YDiOSStudy
//
//  Created by 王远东 on 2023/10/12.
//

#import "AppDelegate.h"

#define DEFINEEight 8

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
        int eight = DEFINEEight;
        int six = 6;
        NSString* site = [[NSString alloc] initWithUTF8String:"starming"];
        int rank = eight + six;
        NSLog(@"%@ rank %d", site, rank);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
