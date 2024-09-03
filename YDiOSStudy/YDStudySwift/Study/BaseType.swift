//
//  BaseType.swift
//  YDiOSStudy
//
//  Created by 王远东 on 2024/9/3.
//

import Foundation

extension SwiftBaseViewController {
    func loadBaseTypeData() {
        data = ["数字", "布尔数", "字符串", "", "", "", "", "", "", ""]
    }
    
    func didClickBaseType(type: String) {
        let objc = BaseType()
        switch type {
        case "数字":
            objc.f1()
        default:
            print("error")
        }
        
    }
}

class BaseType {
    
    // MARK: 数字
    func f1() {
        // Int
        let i1 = 100
        let i2 = 22
        print(i1 / i2) // 向下取整得 4

        // Float
        let f1: Float = 100.0
        let f2: Float = 22.0
        print(f1 / f2) // 4.5454545

        if #available(iOS 14, *) {
            let f3: Float16 = 5.0 // macOS 还不能用
            let f4: Float32 = 5.0
            let f5: Float64 = 5.0
    //        let f6: Float80 = 5.0
            print(f4, f5) // 5.0 5.0 5.0
        }

        // Double
        let d1: Double = 100.0
        let d2: Double = 22.0
        print(d1 / d2) // 4.545454545454546

        // 字面量
        print(Int(0b10101)) // 0b 开头是二进制
        print(Int(0x00afff)) // 0x 开头是十六进制
        print(2.5e4) // 2.5x10^4 十进制用 e
        print(0xAp2) // 10*2^2  十六进制用 p
        print(2_000_000) // 2000000

        // isMultiple(of:) 方法检查一个数字是否是另一个数字的倍数
        let i3 = 36
        print(i3.isMultiple(of: 9)) // true
        
        /**
         处理数字有 floor、ceil、round。floor 是向下取整，只取整数部分；cell 是向上取整，只要有不为零的小数，整数就加1;round 是四舍五入。
         */
    }
    
}
