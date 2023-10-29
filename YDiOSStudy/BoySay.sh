#!/bin/sh

#  BoySay.sh
#  YDiOSStudy
#
#  Created by 王远东 on 2023/10/12.
#  

xcrun clang -c Boy.m
xcrun clang -c SayHi.m

xcrun clang SayHi.o Boy.o -Wl,`xcrun —show-sdk-path`/System/Library/Frameworks/Foundation.framework/Foundation
