//
//  GrammarBasics.swift
//  YDiOSStudy
//
//  Created by 王远东 on 2024/9/2.
//

import Foundation
import RegexBuilder

/**
 语法基础
 */
extension SwiftBaseViewController {
    func loadGrammarBasicsData() {
        data = ["变量", "打印", "注释", "可选", "闭包", "函数", "访问控制", "Regex"]
    }
    
    func didClickGrammarBasic(type: String) {
        let objc = GrammarBasics()
        
        switch type {
        case "变量":
            objc.f1()
        case "打印":
            objc.f2()
        case "注释":
            objc.f3()
        case "可选":
            objc.f4()
        case "闭包":
            objc.f5()
        case "函数":
            objc.f6()
        case "访问控制":
            objc.f7()
        case "Regex":
            if #available(iOS 16, *) {
                objc.f8()
            }
        default:
            print("error")
        }
    }
    
}

class GrammarBasics {
    // MARK: 变量
    func f1() {
        /**
         变量是可变的，使用 var 修饰，常量是不可变的，使用 let 修饰。类、结构体和枚举里的变量是属性。
         属性没有 set 可以省略 get，如果有 set 需加 get。变量设置前通过 willSet 访问到，变量设置后通过 didSet 访问。
         */
        var v1:String = "hi" // 标注类型
        var v2 = "类型推导"
        let l1 = "标题" // 常量

        class a {
            let p1 = 3
            var p2: Int {
                p1 * 3
            }
            
            func f1() {
                print(p2)
            }
        }
        
        let b = a()
        b.f1()
    }
    
    // MARK: 打印
    func f2() {
        /**
         控制台打印值
         */
        print("hi")
        let i = 14
        print(i)
        print("9月\(i)是小柠檬的生日")

        for i in 1...3{
            print(i)
        }
        // output:
        // 1
        // 2
        // 3

        // 使用terminator使循环打印更整洁
        for i in 1...3 {
            print("\(i) ", terminator: "")
        }
        // output:
        // 1 2 3
    }
    
    // MARK: 注释
    func f3() {
        // 单行注释
        /*
        多行注释第一行。
        多行注释第二行。
        */
        // MARK: 会在 minimap 上展示
        // TODO: 待做
        // FIXME: 待修复
    }
    
    // MARK: 可选
    func f4() {
        /**
         可能会是 nil 的变量就是可选变量。当变量为 nil 通过??操作符可以提供一个默认值。
         */
        var o: Int? = nil
        let i = o ?? 0
        /**
         SE-0345 if let shorthand for shadowing an existing optional variable 引入的新语法，用于 unwrapping optinal。
         */
        let s1: String? = "hey"
        let s2: String? = "u"
        if let s1 {
            print(s1)
        }

        guard let s1, let s2 else { return }
        print(s1 + " " + s2)
    }
    
    // MARK: 闭包
    func f5() {
        /**
         闭包也可以叫做 lambda，是匿名函数，对应 OC 的 block。
         */
        let a1 = [1,3,2].sorted(by: { (l: Int, r: Int) -> Bool in
            return l < r
        })
        // 如果闭包是唯一的参数并在表达式最后可以使用结尾闭包语法，写法简化为
        let a2 = [1,3,2].sorted { (l: Int, r: Int) -> Bool in
            return l < r
        }
        // 已知类型可以省略
        let a3 = [1,3,2].sorted { l, r in
            return l < r
        }
        // 通过位置来使用闭包的参数，最后简化如下：
        let a4 = [1,3,2].sorted { $0 < $1 }
        
        /**
         函数也是闭包的一种，函数的参数也可以是闭包。@escaping 表示逃逸闭包，逃逸闭包是可以在函数返回之后继续调用的。@autoclosure 表示自动闭包，可以用来省略花括号。

         [SE-0326](https://github.com/apple/swift-evolution/blob/main/proposals/0326-extending-multi-statement-closure-inference.md) 提高了 Swift 对闭包使用参数和类型推断的能力。如下代码
         */
        let a = [1,2,3]
        let r = a.map { i in
            if i >= 2 {
                return "\(i) 大于等于2"
            } else {
                return "\(i) 小于2"
            }
        }
        print(r)
    }
    
    // MARK: 函数
    func f6() {
        /**
         函数可以作为另一个函数的参数，也可以作为另一个函数的返回。函数是特殊的闭包，在类、结构体和枚举中是方法。
         */
        // 为参数设置默认值
        func f1(p: String = "p") -> String {
            "p is \(p)"
        }

        // 函数作为参数
        func f2(fn: (String) -> String, p: String) -> String {
            return fn(p)
        }

        print(f2(fn:f1, p: "d")) // p is d

        // 函数作为返回值
        func f3(p: String) -> (String) -> String {
            return f1
        }

        print(f3(p: "yes")("no")) // p is no
        
        /**
         函数可以返回多个值，函数是可以嵌套的，也就是函数里内可以定义函数，函数内定义的函数可以访问自己作用域外函数内的变量。inout 表示的是输入输出参数，函数可以在函数内改变输入输出参数。defer 标识的代码块会在函数返回之前执行。

         函数在 Swift 5.4 时开始有了使用多个变量参数的能力，使用方法如下：
         */
        func f4(s: String..., i: Int...) {
            print(s)
            print(i)
        }

        f4(s: "one", "two", "three", i: 1, 2, 3)
        /// ["one", "two", "three"]
        /// [1, 2, 3]
        
        /**
         嵌套函数可以重载，嵌套函数可以在声明函数之前调用他。
         */
        func f5() {
            let v = nf5()
            func nf5() -> Int{
                print("this is nested function")
                return 3
            }
            print(v)
        }
        f5() // this is nested function
    }
    
    // MARK: 访问控制
    func f7() {
        /**
         在 Xcode 里的 target 就是模块，使用 import 可导入模块。模块内包含源文件，每个源文件里可以有多个类、结构体、枚举和函数等多种类型。访问级别可以通过一些关键字描述，分为如下几种：

         - open：在模块外可以调用和继承。
         - public：在模块外可调用不可继承，open 只适用类和类成员。
         - internal：默认级别，模块内可跨源文件调用，模块外不可调用。
         - fileprivate：只能在源文件内访问。
         - private：只能在所在的作用域内访问。

         重写继承类的成员，可以设置成员比父类的这个成员更高的访问级别。Setter 的级别可以低于对应的 Getter 的级别，比如设置 Setter 访问级别为 private，可以在属性使用 private(set) 来修饰。
         */
    }
    
    // MARK: Regex
    @available(iOS 16.0, *)
    func f8() {
        /**
         标准库多了个 Regex<Output> 类型，Regex 语法与 Perl、Python、Ruby、Java、NSRegularExpression 和许多其他语言兼容。可以用 let regex = try! Regex("a[bc]+")或 let regex = /a[bc]+/ 写法来使用。SE-0350 Regex Type and Overview 引入 Regex 类型。SE-0351 Regex builder DSL 使用 result builder 来构建正则表达式的 DSL。SE-0354 Regex Literals 简化的正则表达式。SE-0357 Regex-powered string processing algorithms提案里有基于正则表达式的新字符串处理算法。
         */
        
        let s1 = "I am not a good painter"
        print(s1.ranges(of: /good/))
        do {
            let regGood = try Regex("[a-z]ood")
            print(s1.replacing(regGood, with: "bad"))
        } catch {
            print(error)
        }
        print(s1.trimmingPrefix(/i am/.ignoresCase()))

        let reg1 = /(.+?) read (\d+) books./
        let reg2 = /(?<name>.+?) read (?<books>\d+) books./
        let s2 = "Jack read 3 books."
        do {
            if let r1 = try reg1.wholeMatch(in: s2) {
                print(r1.1)
                print(r1.2)
            }
            if let r2 = try reg2.wholeMatch(in: s2) {
                print("name:" + r2.name)
                print("books:" + r2.books)
            }
        } catch {
            print(error)
        }
    }
}
