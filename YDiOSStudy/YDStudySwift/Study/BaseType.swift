//
//  BaseType.swift
//  YDiOSStudy
//
//  Created by 王远东 on 2024/9/3.
//

import Foundation

/**
 基础类型
 */
extension SwiftBaseViewController {
    func loadBaseTypeData() {
        data = ["数字", "布尔数", "字符串", "枚举", "", "", "", "", "", ""]
    }
    
    func didClickBaseType(type: String) {
        let objc = BaseType()
        switch type {
        case "数字":
            objc.f1()
        case "布尔数":
            objc.f2()
        case "字符串":
            objc.f3()
        case "枚举":
            objc.f4()
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
    
    // MARK: 布尔数
    func f2() {
        
    }
    
    // MARK: 字符串
    func f3() {
        
    }
    
    // MARK: 枚举
    func f4() {
        /**
         Swift的枚举有类的一些特性，比如计算属性、实例方法、扩展、遵循协议等等。
         */
        
        /**
         在Swift中，CaseIterable 是一个协议，它允许枚举类型（enum）的每个案例（case）可以被迭代。这个协议特别有用，尤其是在处理需要枚举所有可能值的情况，比如UI选项或者状态机的状态等。当你实现CaseIterable协议后，你可以直接遍历枚举的所有成员，而不需要显式地列出所有的案例。

         要使用CaseIterable，你的枚举类型必须遵守这个协议，并且提供一个返回枚举所有成员的数组的方法。通常，这个方法被称为allCases，但实际上你可以选择任何你喜欢的名字。
         */
        enum E1:String, CaseIterable {
            case e1, e2 = "12"
        }

        // 关联值
        enum E2 {
            case e1([String])
            case e2(Int)
        }
        let e1 = E2.e1(["one","two"])
        let e2 = E2.e2(3)

        switch e1 {
        case .e1(let array):
            print(array)
        case .e2(let int):
            print(int)
        }
        print(e2)

        // 原始值
        print(E1.e1.rawValue)

        // 遵循 CaseIterable 协议可迭代
        for ie in E1.allCases {
            print("show \(ie)")
        }

        // 递归枚举
        enum RE {
            case v(String)
            indirect case node(l:RE, r:RE)
        }

        let lNode = RE.v("left")
        let rNode = RE.v("right")
        let pNode = RE.node(l: lNode, r: rNode)

        switch pNode {
        case .v(let string):
            print(string)
        case .node(let l, let r):
            print(l,r)
            switch l {
            case .v(let string):
                print(string)
            case .node(let l, let r):
                print(l, r)
            }
            switch r {
            case .v(let string):
                print(string)
            case .node(let l, let r):
                print(l, r)
            }
        }
    }
}
