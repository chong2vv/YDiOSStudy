//
//  UnitTest.swift
//  YDiOSStudy
//
//  Created by 王远东 on 2024/9/4.
//

import Foundation

/**
 代码测试区
 */
class UnitTest {
    
    func testAction() {
        print("================== 代码测试 ==================")
        codeTest()
        print("================== 测试结束 ==================")
    }
    
    func codeTest() {
        
        let t1 = (p1: 1, p2: "two", p3: [1,2,3])
        print(t1.p1)
        print(t1.p3)

        // 类型推导
        let t2 = (1, "two", [1,2,3])

        // 通过下标访问
        print(t2.1) // two

        // 分解元组
        let (dp1, dp2, _) = t2
        print(dp1)
        print(dp2)
        
    }
}
