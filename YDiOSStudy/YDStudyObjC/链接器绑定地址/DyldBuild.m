//
//  DyldBuild.m
//  YDiOSStudy
//
//  Created by 王远东 on 2023/10/26.
//

#import "DyldBuild.h"
//#include <dlfcn.h>
//#include <objc/runtime.h>
#import <AVFoundation/AVAudioPlayer.h>

@implementation DyldBuild

//- (void)build {
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"mp3"];
//    void *handle = dlopen("/System/Library/Frameworks/AVFoundation.framework/AVFoundation", RTLD_LAZY);
//    if (handle) {
//        // 加载AVFoundation库成功，继续使用dlsym获取所需的函数指针
//        // 通过dlsym获取AVPlayer类
////        Class avPlayerClass = (__bridge Class)(dlsym(handle, "AVPlayer"));
//        Class avPlayerClass = NSClassFromString(@"AVAudioPlayer");
//        if (avPlayerClass) {
//            // 获取函数方法
//            SEL selector = NSSelectorFromString(@"initWithData:error:");
//            // 调用实例化对象方法
////            id runtime_Player = objc_msgSend(objc_msgSend(avPlayerClass, sel_registerName("alloc")), sel_registerName("init"));
//            id runtime_Player = [[avPlayerClass alloc] performSelector:selector withObject:[NSData dataWithContentsOfFile:path] withObject:nil];
//            
//            // 获取函数方法
//            selector = NSSelectorFromString(@"play");
//            // 调用播放方法
//            [runtime_Player performSelector:selector];
//            NSLog(@"动态加载播放");
//        }
//        
//        dlclose(handle);  // 关闭AVFoundation库句柄
//    }
//}

- (void)systemBuild {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"mp3"];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"test.mp3" withExtension:nil];
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [audioPlayer play];
}

@end
