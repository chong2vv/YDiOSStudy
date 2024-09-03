//
//  NSObject+YD.swift
//  YDiOSStudy
//
//  Created by 王远东 on 2024/9/2.
//

import Foundation
extension NSObject {
    /// 返回className
    var ydClassName: String {
        get{
            let name =  type(of: self).description()
            if (name.contains(".")) {
                let nameArray = name.components(separatedBy: ".")
                if nameArray.count > 1 {
                    return nameArray[1]
                }
            }
            return name
        }
    }
    
    /// 返回类名
    static var className: String {
        return String(describing: self)
    }
}
